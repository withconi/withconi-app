import 'package:get/get.dart';
import 'package:withconi/controller/auth_controller.dart';
import '../../data/model/conimal.dart';
import '../../data/model/disease.dart';
import '../../data/model/user.dart';

class HomeController extends GetxController {
  Rxn<WcUser> wcUser = Rxn<WcUser>();
  RxList<Conimal> conimalList = RxList<Conimal>();
  Rxn<Conimal> selectedConimal = Rxn<Conimal>();
  RxInt selectedConimalIndex = 0.obs;
  RxInt daysAfterAdoption = 0.obs;
  RxInt conimalCount = 0.obs;
  RxList<Disease> caredDiseasesList = RxList<Disease>();

  @override
  onInit() {
    _setWcUser();
    _setConimalList();
    _setSelectedConimal(selectedConimalIndex.value);
    _setAllDiseases();
  }

  _setWcUser() {
    wcUser = AuthController.to.wcUser;
  }

  _setConimalList() {
    conimalList.assignAll(wcUser.value!.conimals);
    conimalCount.value = conimalList.length;
  }

  _setSelectedConimal(int conimalNum) {
    selectedConimalIndex.value = conimalNum;
    selectedConimal.value = conimalList[conimalNum];
    daysAfterAdoption.value =
        daysBetween(selectedConimal.value!.adoptedDate, DateTime.now());
  }

  _setAllDiseases() {
    Set<Disease> diseaseSet = {};

    for (Conimal conimal in conimalList) {
      diseaseSet.addAll(conimal.diseases.toSet());
    }

    caredDiseasesList.addAll(diseaseSet.toList());
  }

  onSelectedConimalChanged(int index) {
    _setSelectedConimal(index);
  }

  int daysBetween(DateTime from, DateTime to) {
    from = DateTime(from.year, from.month, from.day);
    to = DateTime(to.year, to.month, to.day);
    return (to.difference(from).inHours / 24).round();
  }
}
