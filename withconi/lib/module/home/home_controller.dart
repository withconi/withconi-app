import 'package:dartz/dartz.dart';
import 'package:get/get.dart';
import 'package:withconi/data/repository/app_setting_repository.dart';
import 'package:withconi/data/repository/user_repository.dart';
import 'package:withconi/global_widgets/dialog/selection_dialog.dart';
import 'package:withconi/module/auth/auth_controller.dart';
import 'package:withconi/module/map/controllers/map_main_page_controller.dart';
import 'package:withconi/data/repository/conimal_repository.dart';
import 'package:withconi/global_widgets/loading/loading_overlay.dart';
import 'package:withconi/module/ui_model/board_ui_model.dart';
import 'package:withconi/module/ui_model/conimal_ui_model.dart';
import 'package:withconi/module/ui_model/disease_ui_model.dart';
import 'package:withconi/module/ui_model/post_ui_model.dart';
import 'package:withconi/module/ui_model/user_ui_model.dart';
import '../../core/error_handling/failure_ui_interpreter.dart';
import '../../core/error_handling/failures.dart';
import '../../core/values/constants/auth_variables.dart';
import '../../data/enums/enum.dart';

import '../../data/model/dto/response_dto/auth_response/user_response_dto.dart';
import '../../data/repository/community_repository.dart';
import '../../data/repository/local_notification_repository.dart';
import '../../routes/routes.dart';

class HomeController extends GetxController {
  HomeController(this._conimalRepository, this._communityRepository);

  static HomeController get to => Get.find();
  final ConimalRepository _conimalRepository;
  final CommunityRepository _communityRepository;
  late Rx<UserUIModel> _userInfo;
  RxList<ConimalUIModel> conimalList = RxList<ConimalUIModel>();
  int _selectedConimalIndex = 0;
  late Rx<ConimalUIModel> selectedConimal;
  // Set<DiseaseType> _diseaseTypeSet = {};
  // RxList<BoardUIModel> _diseaseBoardList = RxList<BoardUIModel>();
  RxSet<BoardUIModel> relatedBoardSet = RxSet<BoardUIModel>();

  RxInt navIndex = 0.obs;
  UserUIModel get currentUser => _userInfo.value;
  List<ConimalUIModel> get _conimals => _userInfo.value.conimals;
  // ConimalUIModel get selectedConimal => conimals[selectedConimalIndex.value];
  RxBool isExpansionOneOpened = false.obs;
  RxBool isExpansionTwoOpened = false.obs;
  static int hotPostListSize = 4;
  RxList<PostUIModel> hotPostList = RxList<PostUIModel>();
  RxBool isLoading = true.obs;
  late Worker worker;

  @override
  onInit() async {
    super.onInit();

    setHomeUserInfo();
    _setRelatedBoardList();
    await _getHotPostList();
  }

  @override
  onReady() {
    super.onReady();
    LocalNotificationService.requestNotificationPermission();
  }

  // void _setConimalList() {
  //   conimalList.assignAll(_wcUser.value.conimals);
  //   conimalCount.value = conimalList.length;
  // }

  // void _setSelectedConimal(int conimalNum) {
  //   selectedConimalIndex.value = conimalNum;
  //   selectedConimal.value = conimalList[conimalNum];
  // }

  _setRelatedBoardList() {
    relatedBoardSet.clear();
    for (var conimal in _conimals) {
      relatedBoardSet.addAll(conimal.diseases.map((e) => BoardUIModel(
          boardId: e.boardId,
          title: e.diseaseType.displayName,
          diseaseType: e.diseaseType)));
    }
    relatedBoardSet.refresh();
  }

  Future<void> refreshPage() async {
    setHomeUserInfo();
    await _getHotPostList();
  }

  setHomeUserInfo() {
    _userInfo = Rx<UserUIModel>(AuthController.to.userInfo.copyWith());
    conimalList.assignAll(_userInfo.value.conimals.toList());
    int lastConimalIndex = ((_userInfo.value.conimals.length - 1) < 0)
        ? 0
        : _userInfo.value.conimals.length - 1;
    if (_selectedConimalIndex > lastConimalIndex) {
      _selectedConimalIndex = lastConimalIndex;
    }
    selectedConimal = conimalList[_selectedConimalIndex].obs;
    conimalList.refresh();
    _setRelatedBoardList();
  }

  Future<void> _getHotPostList() async {
    final hotPostListEither =
        await _communityRepository.getHotPostList(hotPostListSize);

    var hotPostResult = hotPostListEither.fold((fail) {
      FailureInterpreter().mapFailureToSnackbar(fail, '_getBoardList');
      return null;
    }, (newHotPostList) {
      return newHotPostList;
    });
    if (hotPostResult != null) {
      hotPostList
          .assignAll(hotPostResult.map((e) => PostUIModel.fromDTO(e)).toList());
      hotPostList.refresh();
      isLoading.value = false;
    }
  }

  void onSelectedConimalChanged(int index) {
    _selectedConimalIndex = index;
    selectedConimal.value = conimalList[_selectedConimalIndex];
    conimalList.refresh();
  }

  addDisease(String conimalId) async {
    int index =
        conimalList.indexWhere((element) => element.conimalId == conimalId);
    if (index >= 0) {
      List<DiseaseUIModel>? addedDiseases =
          await Get.toNamed(Routes.DISEASE_SEARCH, arguments: {
        'selectedDiseaseList': _conimals[index].diseases.toList(),
        'maxDisease': 3
      }) as List<DiseaseUIModel>?;
      if (addedDiseases != null) {
        conimalList[index].diseases = addedDiseases;
        _updateConimalDiseaseById(
            conimalList[index].conimalId, conimalList[index].diseases);
      }
    }
  }

  deleteDisease(String conimalId, DiseaseUIModel disease) async {
    int index =
        conimalList.indexWhere((element) => element.conimalId == conimalId);

    if (index >= 0) {
      bool confirmed = await showSelectionDialog(
          confirmText: '삭제', cancleText: '취소', title: '해당 질병을 삭제할까요?');

      if (confirmed) {
        await showLoading(() => _updateConimalDiseaseById(
            conimalList[index].conimalId,
            conimalList[index]
                .diseases
                .where((element) => element.diseaseId != disease.diseaseId)
                .toList()));
      }
    }
  }

  _updateConimalDiseaseById(
      String conimalId, List<DiseaseUIModel> editedDiseaseList) async {
    await showLoading(() async {
      var editDiseaseEither = await _conimalRepository.updateConimalDisease(
        conimalId: conimalId,
        diseases: editedDiseaseList,
      );
      bool editSucceed = await editDiseaseEither.fold((l) {
        FailureInterpreter().mapFailureToSnackbar(l, 'addDisease');
        return false;
      }, (r) {
        return true;
      });

      if (editSucceed) {
        await AuthController.to.setUserAuthInfo();
        await setHomeUserInfo();
        return;
      }
    });
  }

  // goToDiseaseSearchPage(int conimalIndex) async {
  //   return await Get.toNamed(Routes.DISEASE_SEARCH, arguments: {
  //     'selectedDiseaseList': _conimals[conimalIndex].diseases.toList(),
  //     'maxDisease': 3
  //   }) as List<DiseaseUIModel>?;
  // }

  goToPostDetailPage(PostUIModel selectedHotPost) {
    Get.toNamed(Routes.COMMUNITY_POST_DETAIL, arguments: {
      'postId': selectedHotPost.postId,
      'boardId': selectedHotPost.boardId,
      'fromRootPage': true,
    });
  }

  goToPostListPage(BoardUIModel board) {
    Get.toNamed(Routes.COMMUNITY_POST_LIST,
        arguments: {'boardId': board.boardId, 'boardName': board.title});
  }

  goToDictionaryDetailPage(DiseaseUIModel disease) async {
    await Get.toNamed(Routes.DICTIONARY_DETAIL,
        arguments: {'diseaseId': disease.diseaseId});
    setHomeUserInfo();
  }

  goToManageConimalPage() async {
    await Get.toNamed(Routes.CONIMAL_MANAGE,
        arguments: {'conimals': _conimals.toList()});
    setHomeUserInfo();
  }

  goToDiagnosisPage() {
    Get.toNamed(Routes.DIAGNOSIS_MAIN);
  }

  // int daysBetween(DateTime from, DateTime to) {
  //   from = DateTime(from.year, from.month, from.day);
  //   to = DateTime(to.year, to.month, to.day);
  //   return (to.difference(from).inHours / 24).round();
  // }
}
