import 'package:withconi/data/enums/enum.dart';
import 'package:withconi/data/model/disease_history.dart';

class DiseaseHistoryGroup {
  int totalHistory;

  Map<DiseaseType, int> diseaseMap;

  List<DiseaseHistory>? historyList;

  DiseaseHistoryGroup(
      {required this.totalHistory, required this.diseaseMap, this.historyList});

  factory DiseaseHistoryGroup.fromJson(Map<String, dynamic> json) {
    int totalDisease;
    Map<DiseaseType, int> diseaseMap;
    List<DiseaseHistory> historyList = [];

    totalDisease = json['totalVisiting'];
    diseaseMap = {
      DiseaseType.cardiovascular:
          json['totalVisitingDiseaseCardiovascular'] ?? 0,
      DiseaseType.musculoskeletal:
          json['totalVisitingDiseaseMusculoskeletal'] ?? 0,
      DiseaseType.digestive: json['totalVisitingDiseaseDigestive'] ?? 0,
      DiseaseType.ophthalmology: json['totalVisitingDiseaseOphthalmology'] ?? 0,
      DiseaseType.urinary: json['totalVisitingDiseaseUrinary'] ?? 0,
      DiseaseType.respiratory: json['totalVisitingDiseaseRespiratory'] ?? 0,
    };

    diseaseMap.forEach(((key, value) => totalDisease += value));

    diseaseMap = Map.fromEntries(diseaseMap.entries.toList()
      ..sort((e2, e1) => e1.value.compareTo(e2.value)));
    return DiseaseHistoryGroup(
        totalHistory: totalDisease, diseaseMap: diseaseMap);
  }
}
