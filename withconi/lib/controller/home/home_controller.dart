import 'package:get/get.dart';
import 'package:withconi/controller/auth_controller.dart';
import 'package:withconi/controller/map/map_main_page_controller.dart';
import 'package:withconi/data/repository/conimal_repository.dart';
import 'package:withconi/ui/widgets/loading/loading_overlay.dart';
import '../../configs/constants/auth_variables.dart';
import '../../data/model/conimal.dart';
import '../../data/model/disease.dart';
import '../../data/model/user.dart';
import '../../routes/withconi_routes.dart';

class HomeController extends GetxController {
  ConimalRepository _conimalRepository = ConimalRepository();
  late Rx<WcUser> _wcUser;
  RxList<Conimal> conimalList = RxList<Conimal>();
  Rxn<Conimal> selectedConimal = Rxn<Conimal>();
  RxInt selectedConimalIndex = 0.obs;
  RxInt daysAfterAdoption = 0.obs;
  RxInt conimalCount = 0.obs;
  RxList<Disease> allDiseasesList = RxList<Disease>();

  RxInt navIndex = 0.obs;
  WcUser? get wcUser => _wcUser.value;
  RxBool isExpansionOneOpened = false.obs;
  RxBool isExpansionTwoOpened = false.obs;

  @override
  onInit() {
    super.onInit();
    selectedConimalIndex.value = 0;
    _setHomePageData();
  }

  _setHomePageData() {
    _setWcUser();
    _setConimalList();
    _setSelectedConimal(0);
    _setAllDiseases();
  }

  void _setWcUser() {
    _wcUser = AuthController.to.wcUser.value!.obs;
  }

  void _setConimalList() {
    conimalList.assignAll(_wcUser.value.conimals);
    conimalCount.value = conimalList.length;
  }

  void _setSelectedConimal(int conimalNum) {
    selectedConimalIndex.value = conimalNum;
    selectedConimal.value = conimalList[conimalNum];
    daysAfterAdoption.value =
        daysBetween(selectedConimal.value!.adoptedDate, DateTime.now());
  }

  Future<void> refreshPage() async {
    await AuthController.to.refreshWcUserInfo();
    onInit();
  }

  manageConimal() async {
    await Get.toNamed(Routes.CONIMAL_MANAGE, arguments: wcUser!.conimals);
    _setHomePageData();
  }

  void _setAllDiseases() {
    Set<Disease> diseaseSet = {};
    for (Conimal conimal in conimalList) {
      diseaseSet.addAll(conimal.diseases.toSet());
    }
    allDiseasesList.assignAll(diseaseSet.toList());
    allDiseasesList.refresh();
  }

  void onSelectedConimalChanged(int index) {
    _setSelectedConimal(index);
  }

  addDisease({required Conimal selectedConimal}) async {
    List<Disease>? selectedDiseases = await Get.toNamed(Routes.DISEASE_ADD,
        arguments: selectedConimal.diseases) as List<Disease>?;
    if (selectedDiseases == null) {
    } else {
      await showLoading(() => _conimalRepository.updateConimalDisease(
            conimalId: selectedConimal.conimalId,
            diseases: selectedDiseases,
          ));

      refreshPage();
    }
  }

  int daysBetween(DateTime from, DateTime to) {
    from = DateTime(from.year, from.month, from.day);
    to = DateTime(to.year, to.month, to.day);
    return (to.difference(from).inHours / 24).round();
  }
}
