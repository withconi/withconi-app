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
    @ReportItemConverter() required List<ReportItem> reviewDesc,

    // @ImageItemConverter() @Default([]) required List<ImageItem> images,
  }) = _Report;

  factory Report.fromJson(Map<String, dynamic> json) => _$ReportFromJson(json);
}

class ReportItemConverter implements JsonConverter<List<ReportItem>, String> {
  const ReportItemConverter();

  @override
  List<ReportItem> fromJson(String reportItem) {
    return [];
  }

  @override
  String toJson(List<ReportItem> reportItemList) {
    if (reportItemList.isNotEmpty) {
      return reportItemList
          .map((reportItem) => reportItem.displayName)
          .toList()
          .join(',');
    } else {
      return '';
    }
  }
}
