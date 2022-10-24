import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:withconi/configs/constants/enum.dart';
import 'package:withconi/data/model/disease_history_item.dart';
part 'disease_history.freezed.dart';
part 'disease_history.g.dart';

@freezed
class DiseaseHistory with _$DiseaseHistory {
  @JsonSerializable(explicitToJson: true)
  factory DiseaseHistory({
    // required int totalDisease,
    // required int totalCardiovascular,
    // required int totalMusculoskeletal,
    // required int totalDigestive,
    // required int totalOphthalmology,
    // required int totalUrinary,
    // required int totalRespiratory,
    // required int totalOtorhinolaryngology,
    // required int totalInfectiousDisease,
    // required int totalBrainNeurology,
    // required int totalDentistry,
    // required int totalOncology,
    // required int totalDermatology,
    // required int totalEndocrinology,
    // required int totalEmergency,
    required DiseaseType diseaseType,
    required int totalTypeHistory,
    required List<DiseaseHistoryItem> diseaseTypeDetailList,
  }) = _DiseaseHistory;

  factory DiseaseHistory.fromJson(Map<String, dynamic> json) =>
      _$DiseaseHistoryFromJson(json);
}
