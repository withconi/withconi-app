import 'package:withconi/configs/constants/enum.dart';

class DiseasePercents {
  // late DiseaseType totalCardiovascular;
  // late int totalMusculoskeletal;
  // late int totalDigestive;
  // late int totalOphthalmology;
  // late int totalUrinary;
  // late int totalRespiratory;
  int totalDisease;

  Map<DiseaseType, int> diseaseCountMap;

  DiseasePercents({required this.totalDisease, required this.diseaseCountMap});

  factory DiseasePercents.fromJson(Map<String, dynamic> json) {
    int totalVisiting;
    Map<DiseaseType, int> diseaseMap;

    totalVisiting = json['totalVisiting'];
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
    return DiseasePercents(
        totalDisease: totalVisiting, diseaseCountMap: diseaseMap);
  }
}
