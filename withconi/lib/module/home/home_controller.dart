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
  final ConimalRepository _conimalRepository;
  final CommunityRepository _communityRepository;
  late Rx<UserUIModel> _userInfo;
  RxList<ConimalUIModel> conimalList = RxList<ConimalUIModel>();
  RxInt selectedConimalIndex = 0.obs;
  // Set<DiseaseType> _diseaseTypeSet = {};
  // RxList<BoardUIModel> _diseaseBoardList = RxList<BoardUIModel>();
  RxSet<BoardUIModel> relatedBoardSet = RxSet<BoardUIModel>();

  RxInt navIndex = 0.obs;
  UserUIModel get currentUser => _userInfo.value;
  List<ConimalUIModel> get _conimals => _userInfo.value.conimals;
  // ConimalUIModel get selectedConimal => conimals[selectedConimalIndex.value];
  RxBool isExpansionOneOpened = false.obs;
  RxBool isExpansionTwoOpened = false.obs;
  static int hotPostListSize = 3;
  RxList<PostUIModel> hotPostList = RxList<PostUIModel>();

  RxBool isLoading = true.obs;
  late Worker worker;

  @override
  onInit() {
    super.onInit();

    _setUserInfo();
    _setRelatedBoardList();
    _getHotPostList();
    isLoading = false.obs;
  }

  @override
  onReady() {
    super.onReady();
    LocalNotificationService.requestNotificationPermission();

    // worker = once(
    //   _diseaseBoardList,
    //   _setRelatedBoardList,
    //   condition: () => _diseaseBoardList().isNotEmpty,
    //   onDone: () => worker.dispose(),
    // );
    // 3.delay(worker.dispose);
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
    // await getUserInfo();
    _setUserInfo();
    await _getHotPostList();
  }

  _setUserInfo() {
    _userInfo = Rx<UserUIModel>(AuthController.to.userInfo.copyWith());
    int lastConimalIndex = ((_userInfo.value.conimals.length - 1) < 0)
        ? 0
        : _userInfo.value.conimals.length - 1;
    if (selectedConimalIndex.value > lastConimalIndex) {
      selectedConimalIndex.value = lastConimalIndex;
    }
    conimalList.assignAll(_userInfo.value.conimals.toList());
    _setRelatedBoardList();
    // _setAllDiseasesSet();
  }

  // void _setAllDiseasesSet() {
  //   relatedBoardSet.clear();
  // }

  // Future<void> getUserInfo() async {
  //   Either<Failure, UserResponseDTO> wcUserEither =
  //       await _userRepository.getUserInfo();

  //   wcUserEither.fold((fail) {
  //     FailureInterpreter().mapFailureToDialog(fail, 'updateUserInfo');
  //   }, (userDto) {
  //     _userInfo.value = _parseUserDto(userDto);
  //     conimalList.assignAll(_userInfo.value.conimals.toList());
  //     _userInfo.refresh();
  //   });
  // }

  // _parseUserDto(UserResponseDTO dto) {
  //   return UserUIModel.fromDTO(dto);
  // }

  Future<void> _getHotPostList() async {
    final hotPostListEither =
        await _communityRepository.getHotPostList(hotPostListSize);

    hotPostListEither.fold(
        (fail) =>
            FailureInterpreter().mapFailureToSnackbar(fail, '_getBoardList'),
        (newHotPostList) {
      hotPostList.assignAll(
          newHotPostList.map((e) => PostUIModel.fromDTO(e)).toList());
      hotPostList.refresh();
    });
  }

  void onSelectedConimalChanged(int index) {
    selectedConimalIndex.value = index;
  }

  addDisease(int conimalIndex) async {
    List<DiseaseUIModel>? addedDiseases =
        await goToDiseaseSearchPage(conimalIndex);
    if (addedDiseases != null) {
      conimalList[conimalIndex].diseases.addAll(addedDiseases);
      _updateConimalDiseaseById(conimalList[conimalIndex].conimalId,
          conimalList[conimalIndex].diseases);
    }
  }

  deleteDisease(int conimalIndex, DiseaseUIModel disease) async {
    bool confirmed = await showSelectionDialog(
        confirmText: '삭제', cancleText: '취소', title: '해당 질병을 삭제할까요?');

    if (confirmed) {
      await showLoading(() => _updateConimalDiseaseById(
          conimalList[conimalIndex].conimalId,
          conimalList[conimalIndex]
              .diseases
              .where((element) => element.diseaseId != disease.diseaseId)
              .toList()));
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
        await _setUserInfo();
        return;
      }
    });
  }

  goToDiseaseSearchPage(int conimalIndex) async {
    return await Get.toNamed(Routes.DISEASE_SEARCH,
        arguments: _conimals[conimalIndex].diseases) as List<DiseaseUIModel>?;
  }

  goToPostDetailPage(PostUIModel selectedHotPost) {
    Get.toNamed(Routes.COMMUNITY_POST_DETAIL, arguments: {
      'postId': selectedHotPost.postId,
      'boardId': selectedHotPost.boardId
    });
  }

  goToPostListPage(BoardUIModel board) {
    Get.toNamed(Routes.COMMUNITY_POST_LIST,
        arguments: {'boardId': board.boardId, 'boardName': board.title});
  }

  goToDictionaryDetailPage(DiseaseUIModel disease) async {
    await Get.toNamed(Routes.DICTIONARY_DETAIL,
        arguments: {'diseaseCode': disease.diseaseCode});
    _setUserInfo();
  }

  goToManageConimalPage() async {
    await Get.toNamed(Routes.CONIMAL_MANAGE,
        arguments: {'conimals': _conimals.toList()});
    _setUserInfo();
  }

  // int daysBetween(DateTime from, DateTime to) {
  //   from = DateTime(from.year, from.month, from.day);
  //   to = DateTime(to.year, to.month, to.day);
  //   return (to.difference(from).inHours / 24).round();
  // }
}
