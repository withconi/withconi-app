import 'package:withconi/core/network_handling/network_service.dart';
import 'package:withconi/core/tools/api_url.dart';
import 'package:withconi/data/model/dto/request_dto/abstract_request/request_info_abstract.dart';

import '../abstract_request/request_dto_abstract.dart';

class GetDeveloperInfoRequestDTO
    extends RequestConverter<GetDeveloperInfoRequestDTO, Null>
    implements RequestDTO {
  @override
  bool get requiresToken => false;

  @override
  RequestType get requestType => RequestType.GET;

  @override
  String get url => HttpUrl.DEVELOPER_INFO;

  GetDeveloperInfoRequestDTO.fromData() : super.fromData(null);

  @override
  Map<String, dynamic> get dataMap => {};
}
