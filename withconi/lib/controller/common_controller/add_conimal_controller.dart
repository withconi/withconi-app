import 'package:dartz/dartz.dart';
import 'package:intl/intl.dart';
import 'package:withconi/controller/auth_controller.dart';
import 'package:withconi/controller/ui_interpreter/failure_ui_interpreter.dart';
import 'package:withconi/data/repository/auth_repository.dart';
import 'package:withconi/data/repository/conimal_repository.dart';
import 'package:withconi/data/repository/signup_repository.dart';
import 'package:withconi/ui/widgets/loading.dart';
import '../../configs/constants/auth_variables.dart';
import '../../configs/constants/enum.dart';
import '../../configs/constants/regex.dart';
import '../../configs/constants/strings.dart';
import '../../core/error_handling/failures.dart';
import '../../data/model/conimal.dart';
import '../../data/model/disease.dart';
import '../../data/model/user.dart';
import '../../import_basic.dart';

class AddConimalController extends GetxController {
  final ConimalRepository _conimalRepository = Get.put(ConimalRepository());
  RxBool isConimalAdded = false.obs;
  final RxString _conimalName = ''.obs;
  late WcUser wcUser;
  RxString diseaseText = ''.obs;
  RxString diseaseSuffixText = ''.obs;
  RxBool showAddConimalButton = false.obs;
  Rxn<Gender> conimalGender = Rxn<Gender>();
  Rxn<Species> conimalSpecies = Rxn<Species>();
  List<Disease> _diseaseList = [];
  RxBool isButtonValid = false.obs;
  RxBool birthDateSelected = false.obs;
  RxBool speciesSelected = false.obs;
  RxBool genderSelected = false.obs;
  RxBool adoptedDateSelected = false.obs;
  RxBool diseaseSelected = false.obs;
  final Rxn<DateTime> _birthDate = Rxn<DateTime>();
  final Rxn<DateTime> _adoptedDate = Rxn<DateTime>();
  RxList<bool> genderSelectionList = [false, false].obs;
  RxnString conimalNameErrorText = RxnString();
  TextEditingController conimalNameTextController = TextEditingController();
  String get conimalName => _conimalName.value;
  DateTime? get birthDate => _birthDate.value;
  DateTime? get adoptedDate => _adoptedDate.value;
  String get birthDateString => (_birthDate.value == null)
      ? ''
      : DateFormat('yyyy-MM-dd').format(_birthDate.value!);
  String get adoptedDateString => (_adoptedDate.value == null)
      ? ''
      : DateFormat('yyyy-MM-dd').format(_adoptedDate.value!);

  @override
  void onInit() {
    super.onInit();
    wcUser = AuthController.to.wcUser.value!;
  }

  @override
  void onReady() {
    super.onReady();

    ever(_conimalName, validateName);
  }

  void onConimalNameChanged(String val) {
    _conimalName.value = val;
  }

  void onGenderChanged(Gender gender) {
    conimalGender.value = gender;
    genderSelected.value = true;
  }

  void onSpeicesChanged(Species species) {
    conimalSpecies.value = species;
    speciesSelected.value = true;
  }

  void onBirthDateChanged(DateTime birthDate) {
    _birthDate.value = birthDate;
    birthDateSelected.value = true;
  }

  void onAdoptedDateChanged(DateTime adoptedDate) {
    _adoptedDate.value = adoptedDate;
    adoptedDateSelected.value = true;
  }

  void onDiseaseListChanged(List<Disease> diseaseList) {
    _diseaseList.assignAll(diseaseList);
    setSelectedDiseaseText(_diseaseList);
  }

  bool validateButton() {
    if (conimalNameErrorText.value == null &&
        conimalName.isNotEmpty &&
        birthDateSelected.value &&
        adoptedDateSelected.value &&
        speciesSelected.value &&
        genderSelected.value) {
      isButtonValid.value = true;
    } else {
      isButtonValid.value = false;
    }
    return isButtonValid.value;
  }

  validateName(String value) {
    final nameRegExp = Regex.nickName;
    conimalNameErrorText.value = null;
    if (!nameRegExp.hasMatch(value)) {
      conimalNameErrorText.value = Strings.validator.name;
    } else {
      conimalNameErrorText.value = null;
    }
  }

  selectBirthDate() async {
    DateTime? pickedDate = await showDatePicker(
        context: Get.context!,
        initialDate: _birthDate.value ?? DateTime.now(),
        firstDate: DateTime(1960),
        lastDate: DateTime.now());

    if (pickedDate != null) {
      onBirthDateChanged(pickedDate);
    } else {
      birthDateSelected.value = false;
    }
  }

  selectAdoptedDate() async {
    DateTime? pickedDate = await showDatePicker(
        context: Get.context!,
        initialDate: _adoptedDate.value ?? DateTime.now(),
        firstDate: DateTime(1980),
        lastDate: DateTime.now());

    if (pickedDate != null) {
      onAdoptedDateChanged(pickedDate);
    } else {
      adoptedDateSelected.value = false;
    }
  }

  selectDisease() async {
    List<Disease>? newDiseaseList =
        await Get.toNamed(Routes.DISEASE_ADD, arguments: _diseaseList)
            as List<Disease>?;
    if (newDiseaseList != null) {
      onDiseaseListChanged(newDiseaseList);
    }
  }

  setSelectedDiseaseText(List<Disease> diseaseList) {
    if (diseaseList.isNotEmpty) {
      diseaseSelected.value = true;
      if (diseaseList.length > 1) {
        diseaseText.value = diseaseList[0].name.substring(0, 10);
        diseaseSuffixText.value = ' 외 ${diseaseList.length - 1}개';
      } else {
        diseaseText.value = diseaseList[0].name.substring(0, 10);
        diseaseSuffixText.value = '';
      }
    } else {
      diseaseSelected.value = false;
    }
  }

  // removeThisConimal() {
  //   Either<Failure, String> removeLastConimaEither =
  //       _conimalRepository.removeLastTempConimal();
  //   removeLastConimaEither.fold(
  //       (fail) => FailureInterpreter().mapFailureToDialog(fail),
  //       (str) => print(str));
  // }

  // finishAdd() async {
  //   Conimal newConimal = Conimal(
  //     conimalId: DateTime.now().millisecondsSinceEpoch.toString(),
  //     name: conimalName,
  //     gender: conimalGender.value!,
  //     species: conimalSpecies.value!,
  //     birthDate: birthDate!,
  //     adoptedDate: adoptedDate!,
  //     diseases: _diseaseList,
  //     userId: wcUser.uid,
  //     // createdAt: DateTime.now(),
  //   );
  //   Get.back(result: newConimal);
  // }

  Future<void> createConimal() async {
    Conimal newConimal = Conimal(
      conimalId: DateTime.now().millisecondsSinceEpoch.toString(),
      name: conimalName,
      gender: conimalGender.value!,
      species: conimalSpecies.value!,
      birthDate: birthDate!,
      adoptedDate: adoptedDate!,
      diseases: _diseaseList,
      userId: wcUser.uid,
    );

    Either<Failure, bool> addResultEither = await showLoading(
        () => _conimalRepository.createConimal(newConimal: newConimal));

    addResultEither.fold(
        (fail) =>
            FailureInterpreter().mapFailureToDialog(fail, 'updateConimalList'),
        (success) {
      AuthController.to.refreshWcUserInfo();
      Get.back(result: newConimal);
    });
  }
}
