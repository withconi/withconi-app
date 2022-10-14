import 'package:withconi/controller/ui_interpreter/failure_ui_interpreter.dart';
import 'package:withconi/data/repository/community_repository.dart';
import 'package:withconi/data/repository/conimal_repository.dart';
import 'package:withconi/ui/widgets/loading/loading_overlay.dart';
import '../../data/model/board.dart';
import '../../data/model/conimal.dart';
import '../../data/model/disease.dart';
import '../../import_basic.dart';
import '../../ui/pages/community/community_setting_page.dart';
import '../../ui/widgets/dialog/disease_editing_dialog.dart';
import '../auth_controller.dart';

class DictionaryDetailController extends GetxController {
  ConimalRepository _conimalRepository = ConimalRepository();
  CommunityRepository _communityRepository = CommunityRepository();
  RxList<Board> _boardList = RxList<Board>();
  List<Board> get boardList => _boardList.toList();
  late Disease disease;
  RxBool isManagingDisease = false.obs;

  @override
  onInit() {
    super.onInit();
    disease = Get.arguments as Disease;
    isManagingDisease.value = _checkDiseaseMangingStatus();
  }

  onDiseaseManagementChanged() async {
    await showLoading(() => AuthController.to.setUserInfo(redirectPage: false));
    isManagingDisease.value = _checkDiseaseMangingStatus();
  }

  bool _checkDiseaseMangingStatus() {
    return AuthController.to.wcUser.value!.conimals.any((conimal) {
      bool managingDisease =
          conimal.diseases.any((element) => element.code == disease.code);
      return managingDisease;
    });
  }

  _updateConimalDisease(List<Conimal> editedConimals) async {
    for (Conimal conimal in editedConimals) {
      await _conimalRepository.updateConimalDisease(
        diseases: conimal.diseases,
        conimalId: conimal.conimalId,
      );
    }
  }

  editConimalDiseases(BuildContext context) async {
    List<Conimal>? editedConimal = await showDiseaseEditDialog(
        conimalList: AuthController.to.wcUser.value!.conimals,
        context: context,
        disease: disease);

    if (editedConimal != null) {
      await showLoading(() => _updateConimalDisease(editedConimal));
      await onDiseaseManagementChanged();
    }
  }

  toBoardDetailPage({required String boardId}) {
    Get.toNamed(Routes.COMMUNITY_DETAIL, arguments: boardId);
  }

  toSettingPage() {
    Get.to(CommunitySettingPage());
  }
}
