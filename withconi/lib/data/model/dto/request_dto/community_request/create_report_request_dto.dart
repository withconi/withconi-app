import 'package:withconi/core/network_handling/network_service.dart';
import 'package:withconi/core/tools/api_url.dart';
import 'package:withconi/module/ui_model/ui_model_abstract/ui_model.dart';
import '../../../../../module/ui_model/report_ui_model.dart';
import '../../../../enums/enum.dart';
import '../abstract_request/request_dto_abstract.dart';
import '../abstract_request/request_info_abstract.dart';

class CreateReportRequestDTO
    extends RequestConverter<CreateReportRequestDTO, ReportUIModel>
    implements RequestDTO {
  final String boardId;
  final String postId;
  final ReportItem reportItem;
  final String reportDesc;

  @override
  bool get requiresToken => true;

  @override
  RequestType get requestType => RequestType.POST;

  @override
  String get url => HttpUrl.COMMUNITY_CREATE_REPORT;

  CreateReportRequestDTO.fromData(ReportUIModel reportUIModel)
      : boardId = reportUIModel.boardId,
        reportDesc = reportUIModel.reportDesc,
        reportItem = reportUIModel.reportItem!,
        postId = reportUIModel.postId,
        super.fromData(reportUIModel);

  @override
  Map<String, dynamic> get dataMap {
    return {
      'postId': postId,
      'reportDesc': reportDesc,
      'reportItem': reportItem.code,
    };
  }
}
