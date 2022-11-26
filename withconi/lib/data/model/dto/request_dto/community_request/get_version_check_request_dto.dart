import 'package:withconi/core/network_handling/network_service.dart';
import 'package:withconi/core/tools/api_url.dart';
import 'package:withconi/data/model/dto/api_call_dto.dart';
import 'package:withconi/module/ui_model/ui_model_abstract/ui_model.dart';
import '../../../../../core/tools/helpers/infinite_scroll.dart';
import '../../../../../module/ui_model/post_list_filter_ui_model.dart';
import '../../../../enums/enum.dart';
import '../abstract_request/request_dto_abstract.dart';
import '../abstract_request/request_info_abstract.dart';

class GetVersionCheckRequestDTO
    extends RequestConverter<GetVersionCheckRequestDTO, Null>
    implements RequestDTO {
  @override
  bool get requiresToken => false;

  @override
  RequestType get requestType => RequestType.GET;

  @override
  String get url => HttpUrl.VERSION_CHECK;

  GetVersionCheckRequestDTO.fromData() : super.fromData(null);

  @override
  Map<String, dynamic> get dataMap => {};
}
