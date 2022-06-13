import 'package:withconi/data/model/diseases.dart';
import 'package:withconi/data/repository/disease_search_repository.dart';
import '../../import_basic.dart';

class DiseaseSearchController extends GetxController {
  late RxString _disease;
  final DiseaseSearchRepository _diseaseRepository = DiseaseSearchRepository();
  TextEditingController diseaseTextController = TextEditingController();

  String get disease => _disease.value;

  RxList<DiseaseModel> diseaseListSelected = RxList<DiseaseModel>();
  RxList<DiseaseModel> diseaseListSearched = RxList<DiseaseModel>();
  Set<DiseaseModel> resultSet = {};

  Set<DiseaseModel> selectedSet = {};

  Set<DiseaseModel> newResultSet = {};

  @override
  void onInit() {
    super.onInit();

    _disease = ''.obs;
  }

  @override
  void onReady() {
    super.onReady();

    debounce(_disease, searchNewDiseaseList,
        time: const Duration(milliseconds: 100));
  }

  void onDiseaseChanged(String val) {
    _disease.value = val;
    if (val.isEmpty) clearResult();
  }

  void clearResult() {
    diseaseTextController.clear();
    diseaseListSearched.clear();
  }

  searchNewDiseaseList(String val) async {
    if (val.isEmpty) {
      return;
    } else {
      List<DiseaseModel> newResultList =
          await _diseaseRepository.getDiseaseList(diseaseName: val);
      diseaseListSearched.assignAll(newResultList);
    }
  }
}
