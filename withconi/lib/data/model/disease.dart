import 'package:freezed_annotation/freezed_annotation.dart';
part 'disease.freezed.dart';
part 'disease.g.dart';

@freezed
class Disease with _$Disease {
  factory Disease({
    required int createdAt,
    required String code,
    required String name,
    required List<String> symptoms,
    required String description,
  }) = _Disease;

  factory Disease.fromJson(Map<String, dynamic> json) =>
      _$DiseaseFromJson(json);
}

// List<Disease> parseDisease(Map<String, dynamic> data) {
//   final diseaseList =
//       data['list'].map<Disease>((json) => Disease.fromJson(json)).toList();
//   return diseaseList;
// }

class DiseaseResponse {
  DiseaseResponse({required this.totalResults, required this.results});

  int totalResults;
  List<Disease> results;

  factory DiseaseResponse.fromJson(Map<String, dynamic> json) {
    List<Disease> list = [];
    int totalDocuments = json['totalDocuments'];
    if (json['list'] != null) {
      list =
          json['list'].map<Disease>((json) => Disease.fromJson(json)).toList();
    }
    return DiseaseResponse(
      totalResults: totalDocuments,
      results: list,
    );
  }
}
