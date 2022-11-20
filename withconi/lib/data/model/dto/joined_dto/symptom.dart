import 'package:freezed_annotation/freezed_annotation.dart';
import '../../../enums/enum.dart';
part 'symptom.freezed.dart';
part 'symptom.g.dart';

@freezed
class SymptomGroup with _$SymptomGroup {
  @JsonSerializable(explicitToJson: true)
  factory SymptomGroup({
    required Symptom symptomType,
    required List<String> symptomList,
  }) = _SymptomGroup;

  factory SymptomGroup.fromJson(Map<String, dynamic> json) =>
      _$SymptomGroupFromJson(json);
}
