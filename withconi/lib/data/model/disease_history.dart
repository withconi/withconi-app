import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:withconi/configs/constants/enum.dart';
import 'package:withconi/data/model/disease_history_item.dart';
part 'disease_history.freezed.dart';
part 'disease_history.g.dart';

@freezed
class DiseaseHistory with _$DiseaseHistory {
  @JsonSerializable(explicitToJson: true)
  factory DiseaseHistory({
    required DiseaseType diseaseType,
    required int totalTypeHistory,
    required List<DiseaseHistoryItem> diseaseTypeDetailList,
  }) = _DiseaseHistory;

  factory DiseaseHistory.fromJson(Map<String, dynamic> json) =>
      _$DiseaseHistoryFromJson(json);
}
