import 'package:dartz/dartz.dart';
import 'package:withconi/core/error_handling/exceptions.dart';
import 'package:withconi/data/model/disease.dart';
import '../../../core/error_handling/failures.dart';
import '../../../import_basic.dart';

class DiseaseData extends GetxController {
  static DiseaseData get to => Get.find();

  final RxList<Disease> _selectedDiseases = RxList<Disease>([]);
  List<Disease> get selectedDiseases => _selectedDiseases;

  addDisease(Disease disease) {
    if (selectedDiseases.length < 4) {
      _selectedDiseases.add(disease);
      return true;
    } else {
      throw MaxListException();
    }
  }

  removeDisease(Disease disease) {
    if (selectedDiseases.contains(disease)) {
      _selectedDiseases.remove(disease);
      return true;
    } else {
      throw MaxListException();
    }
  }
}
