import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:withconi/configs/constants/enum.dart';
import 'disease.dart';
part 'disease_history_item.freezed.dart';
part 'disease_history_item.g.dart';

@freezed
class DiseaseHistoryItem with _$DiseaseHistoryItem {
  @JsonSerializable(explicitToJson: true)
  factory DiseaseHistoryItem({
    required String diseaseName,
    required int diseasePercent,
  }) = _DiseaseHistoryItem;

  factory DiseaseHistoryItem.fromJson(Map<String, dynamic> json) =>
      _$DiseaseHistoryItemFromJson(json);
}
