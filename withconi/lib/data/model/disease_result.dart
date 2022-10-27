import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:withconi/data/model/conimal.dart';

import '../../configs/constants/enum.dart';
part 'disease_result.freezed.dart';
part 'disease_result.g.dart';

@freezed
class DiseaseResult with _$DiseaseResult {
  @JsonSerializable(explicitToJson: true)
  factory DiseaseResult({
    required String diseaseId,
    required String diseaseName,
    required DiseasePosibility posibility,
  }) = _DiseaseResult;

  factory DiseaseResult.fromJson(Map<String, dynamic> json) =>
      _$DiseaseResultFromJson(json);
}
