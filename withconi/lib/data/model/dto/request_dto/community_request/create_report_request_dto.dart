import 'dart:html';
import 'package:withconi/core/network_handling/network_service.dart';
import 'package:withconi/core/tools/api_url.dart';
import 'package:withconi/module/ui_model/ui_model_abstract/ui_model.dart';
import '../../../../../module/ui_model/report_ui_model.dart';
import '../../../../enums/enum.dart';
import '../abstract_request/request_dto_abstract.dart';
import '../abstract_request/request_info_abstract.dart';

class CreateRepostRequestDTO
    extends RequestConverter<CreateRepostRequestDTO, ReportUIModel>
    implements RequestDTO {
  final String boardId;
  final String postId;
  final List<ReportItem> reportItems;
  final String reportDesc;

  @override
  bool get requiresToken => true;

  @override
  RequestType get requestType => RequestType.POST;

  @override
  String get url => HttpUrl.POST_CREATE;

  CreateRepostRequestDTO.fromData(ReportUIModel reportUIModel)
      : boardId = reportUIModel.boardId,
        reportDesc = reportUIModel.reportDesc,
        reportItems = reportUIModel.reportItems,
        postId = reportUIModel.postId,
        super.fromData(reportUIModel);

  // @override
  // factory CreateRepostRequestDTO.fromData(ReportUIModel reportUIModel) {
  //   return CreateRepostRequestDTO._(
  //     boardId: reportUIModel.boardId,
  //     reportDesc: reportUIModel.reportDesc,
  //     reportItems: reportUIModel.reportItems,
  //     postId: reportUIModel.postId,
  //   );
  // }

  @override
  Map<String, dynamic> get dataMap {
    List<String> reportItemStringList = reportItems.map((e) => e.code).toList();
    return {
      'boardId': boardId,
      'postId': postId,
      'reportDesc': reportItemStringList,
    };
  }
}
