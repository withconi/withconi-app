import 'package:withconi/configs/constants/enum.dart';

class DiseasePercents {
  int totalDisease;

  Map<DiseaseType, int> diseaseCountMap;

  DiseasePercents({required this.totalDisease, required this.diseaseCountMap});

  factory DiseasePercents.fromJson(Map<String, dynamic> json) {
    int totalDisease;
    Map<DiseaseType, int> diseaseMap;

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

    return DiseasePercents(
        totalDisease: totalDisease, diseaseCountMap: diseaseMap);
  }
}
