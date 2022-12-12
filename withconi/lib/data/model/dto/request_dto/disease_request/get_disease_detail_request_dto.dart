import 'package:dartz/dartz.dart';
import 'package:withconi/core/network_handling/network_service.dart';
import 'package:withconi/core/tools/api_url.dart';

import '../../../../../core/tools/helpers/infinite_scroll.dart';
import '../abstract_request/request_dto_abstract.dart';
import '../abstract_request/request_info_abstract.dart';

class GetDiseaseDetailRequestDTO
    extends RequestConverter<GetDiseaseDetailRequestDTO, String>
    implements RequestDTO {
  String diseaseCode;

  @override
  String get url => HttpUrl.DISEASE_DETAIL_GET;

  @override
  Map<String, dynamic> get dataMap => {
        "code": diseaseCode,
      };

  @override
  RequestType get requestType => RequestType.GET;

  @override
  bool get requiresToken => false;

  GetDiseaseDetailRequestDTO.fromData({required this.diseaseCode})
      : super.fromData(diseaseCode);
}
