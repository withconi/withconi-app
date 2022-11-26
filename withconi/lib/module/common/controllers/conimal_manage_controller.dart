import 'dart:developer';
import 'package:dartz/dartz.dart';
import 'package:withconi/module/auth/auth_controller.dart';
import 'package:withconi/core/error_handling/failure_ui_interpreter.dart';
import 'package:withconi/global_widgets/loading/loading_overlay.dart';
import 'package:withconi/global_widgets/snackbar.dart';
import 'package:withconi/module/ui_model/conimal_ui_model.dart';
import '../../../core/error_handling/failures.dart';
import '../../../data/repository/conimal_repository.dart';
import '../../../import_basic.dart';
import '../../../global_widgets/dialog/selection_dialog.dart';

class ConimalManageController extends GetxController {
  ConimalManageController(this._conimalRepository);

  final ConimalRepository _conimalRepository;
  final RxString _userName = ''.obs;
  RxList<ConimalUIModel> conimalList = RxList<ConimalUIModel>();
  String get userName => _userName.value;
  RxBool isButtonValid = false.obs;

  @override
  void onInit() {
    super.onInit();
    conimalList.assignAll(Get.arguments as List<ConimalUIModel>);
    // editedConimalIndex.fillRange(0, conimalList.length, false);
  }

  @override
  void onReady() {
    super.onReady();

    ever(conimalList, validateButton);
  }

  validateButton(_conimalList) {
    if (_conimalList.length <= 0) {
      isButtonValid.value = false;
    } else {
      isButtonValid.value = true;
    }
  }

  addConimalPage() async {
    if (conimalList.length < 3) {
      ConimalUIModel? addedConimal =
          await Get.toNamed(Routes.CONIMAL_ADD) as ConimalUIModel?;
      if (addedConimal != null) {
        conimalList.add(addedConimal);
      }
    }
  }

  editConimalPage(int index) async {
    ConimalUIModel? editedConimal =
        await Get.toNamed(Routes.CONIMAL_EDIT, arguments: conimalList[index])
            as ConimalUIModel?;

    if (editedConimal != null) {
      conimalList.removeAt(index);
      conimalList.insert(index, editedConimal);
    }
  }

  onDeleteTap(int index) {
    if (conimalList.length <= 1) {
      showCustomSnackbar(text: '한마리 이상의 코니멀은 꼭 있어야 해요');
    } else {
      conimalList.removeAt(index);
      conimalList.refresh();
    }
  }

  // Future<void> deleteConimal(int index) async {
  //   Either<Failure, bool> addResultEither = await showLoading(() =>
  //       _conimalRepository.deleteConimal(
  //           conimalId: conimalList[index].conimalId));

  //   addResultEither.fold(
  //       (fail) =>
  //           FailureInterpreter().mapFailureToDialog(fail, 'updateConimalList'),
  //       (success) async {
  //     conimalList.removeAt(index);
  //     await AuthController.to.refreshWcUserInfo();
  //   });
  // }

  Future<void> getBack() async {
    if (isButtonValid.value) {
      bool isConfirmed = await showSelectionDialog(
          cancleText: '계속하기',
          confirmText: '그만하기',
          title: '코니멀 수정을 그만할까요?',
          subtitle: '변경된 정보는 모두 사라집니다');
      if (isConfirmed) {
        Get.back();
      }
    } else {
      Get.back();
    }
  }

  Future<void> onEditButtonTap() async {
    bool isConfirmed = await showSelectionDialog(
        cancleText: '아니요',
        confirmText: '네',
        title: '정보를 수정할까요?',
        subtitle: '변경된 코니멀 정보를 수정합니다');

    if (isConfirmed) {
      await editConimalDB();
    }
  }

  Future<void> editConimalDB() async {
    Either<Failure, bool> addResultEither = await showLoading(
        () => _conimalRepository.updateConimalList(conimals: conimalList));

    addResultEither.fold(
        (fail) =>
            FailureInterpreter().mapFailureToDialog(fail, 'updateConimalList'),
        (success) async {
      await AuthController.to.setUserInfo();
      Get.back();
    });
    // Get.back(result: editConimal.value);
  }
}
