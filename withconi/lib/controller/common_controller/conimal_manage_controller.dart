import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:withconi/configs/helpers/calculator.dart';
import 'package:withconi/controller/auth_controller.dart';
import 'package:withconi/controller/ui_interpreter/failure_ui_interpreter.dart';
import 'package:withconi/ui/widgets/loading.dart';
import '../../core/error_handling/failures.dart';
import '../../data/model/conimal.dart';
import '../../data/repository/conimal_repository.dart';
import '../../import_basic.dart';

class ConimalManageController extends GetxController {
  final ConimalRepository _conimalRepository = ConimalRepository();
  final RxString _userName = ''.obs;
  RxList<Conimal> conimalList = RxList<Conimal>();
  String get userName => _userName.value;
  RxBool isButtonValid = true.obs;

  @override
  void onInit() {
    super.onInit();
    var conimals = Get.arguments as List<Conimal>;
    conimalList.assignAll(conimals);
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

  getConimalList() {
    conimalList.value = _conimalRepository.conimalList;
  }

  calculateConimalAge(int index) {
    int age = TimeCalculator().calculateAge(conimalList[index].birthDate);

    return age;
  }

  addConimal() async {
    if (conimalList.length < 3) {
      Conimal? addedConimal = await Get.toNamed(Routes.CONIMAL_ADD) as Conimal?;
      if (addedConimal != null) {
        conimalList.add(addedConimal);
      }
    }
  }

  editConimal(int index) async {
    Conimal? editedConimal =
        await Get.toNamed(Routes.CONIMAL_EDIT, arguments: conimalList[index])
            as Conimal?;

    if (editedConimal != null) {
      conimalList.removeAt(index);
      conimalList.insert(index, editedConimal);
    }
  }

  deleteConimal(int index) {
    conimalList.removeAt(index);
  }

  Future<void> updateConimalList() async {
    for (Conimal conimal in conimalList) {
      Either<Failure, bool> addResultEither = await showLoading(
          () => _conimalRepository.updateConimal(editConimal: conimal));

      addResultEither.fold(
          (fail) => FailureInterpreter()
              .mapFailureToDialog(fail, 'updateConimalList'), (success) {
        log('Conimal update success => $conimal');
      });
    }
  }
}
