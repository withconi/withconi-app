import 'package:dartz/dartz.dart';
import 'package:withconi/core/network_handling/network_service.dart';
import 'package:withconi/core/tools/api_url.dart';

import '../../../../../core/tools/helpers/infinite_scroll.dart';
import '../abstract_request/request_dto_abstract.dart';
import '../abstract_request/request_info_abstract.dart';

class GetCommonDiseaseRequestDTO
    extends RequestConverter<GetCommonDiseaseRequestDTO, Null>
    implements RequestDTO {
  @override
  String get url => HttpUrl.DISEASE_COMMON_LIST;

  @override
  Map<String, dynamic> get dataMap => {};

  @override
  RequestType get requestType => RequestType.GET;

  @override
  bool get requiresToken => true;

  GetCommonDiseaseRequestDTO.fromData() : super.fromData(null);
}
