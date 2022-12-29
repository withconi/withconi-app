import 'package:freezed_annotation/freezed_annotation.dart';
import '../../../enums/enum.dart';
part 'symptom.freezed.dart';
part 'symptom.g.dart';

@freezed
class SymptomGroup with _$SymptomGroup {
  @JsonSerializable(explicitToJson: true)
  factory SymptomGroup({
    @JsonKey(name: 'categoryName') required Symptom symptomType,
    @JsonKey(name: 'list') required List<String> symptomList,
  }) = _SymptomGroup;

  factory SymptomGroup.fromJson(Map<String, dynamic> json) =>
      _$SymptomGroupFromJson(json);
}
