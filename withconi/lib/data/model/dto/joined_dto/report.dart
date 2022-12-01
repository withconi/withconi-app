import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../enums/enum.dart';
part 'report.freezed.dart';
part 'report.g.dart';

@freezed
class Report with _$Report {
  @JsonSerializable(explicitToJson: true)
  factory Report({
    required String boardId,
    required String postId,
    required String userId,
    @ReportItemConverter() required ReportItem reportItem,
    required String reportDesc,
  }) = _Report;

  factory Report.fromJson(Map<String, dynamic> json) => _$ReportFromJson(json);
}

class ReportItemConverter implements JsonConverter<ReportItem, String> {
  const ReportItemConverter();

  @override
  ReportItem fromJson(String reportItemStr) {
    return ReportItem.getByCode(reportItemStr);
  }

  @override
  String toJson(ReportItem reportItem) {
    return reportItem.displayName;
  }
}
