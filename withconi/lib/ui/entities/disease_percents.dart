import 'package:withconi/configs/constants/enum.dart';

class DiseasePercentInfo {
  int totalDisease;

  Map<DiseaseType, int> diseaseMap;

  DiseasePercentInfo({required this.totalDisease, required this.diseaseMap});

  factory DiseasePercentInfo.fromJson(Map<String, dynamic> json) {
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

    diseaseMap = Map.fromEntries(diseaseMap.entries.toList()
      ..sort((e2, e1) => e1.value.compareTo(e2.value)));

    print(diseaseMap.entries);
    print(diseaseMap.keys);

    return DiseasePercentInfo(
        totalDisease: totalDisease, diseaseMap: diseaseMap);
  }
}
