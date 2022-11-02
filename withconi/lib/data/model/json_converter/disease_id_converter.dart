import 'package:freezed_annotation/freezed_annotation.dart';

import '../disease.dart';

class DiseaseIdConverter
    implements JsonConverter<List<Disease>, List<dynamic>> {
  const DiseaseIdConverter();

  @override
  List<Disease> fromJson(List<dynamic>? diseaseMap) {
    try {
      if (diseaseMap == null || diseaseMap.isEmpty) {
        return [];
      } else {
        return diseaseMap.map((data) => Disease.fromJson(data)).toList();
      }
    } catch (e) {
      return [];
    }
  }

  @override
  List<String> toJson(List<dynamic> diseases) {
    if (diseases.isEmpty) {
      return [];
    } else {
      return diseases.map((disease) => disease.code.toString()).toList();
    }
  }
}
