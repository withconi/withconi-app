import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:withconi/data/model/symptom.dart';

import '../../configs/constants/enum.dart';
import '../../core/error_handling/exceptions.dart';
import 'conimal.dart';
part 'disease.freezed.dart';
part 'disease.g.dart';

@freezed
class Disease with _$Disease {
  @JsonSerializable(explicitToJson: true)
  factory Disease({
    @DateTimeConverter() required DateTime createdAt,
    required String code,
    required String name,
    // required List<String> symptoms,
    @Default('') String? description,
    @Default([]) List<SymptomGroup> symptomGroups,
    DiseaseType? diseaseType,
  }) = _Disease;

  factory Disease.fromJson(Map<String, dynamic> json) =>
      _$DiseaseFromJson(json);
}
