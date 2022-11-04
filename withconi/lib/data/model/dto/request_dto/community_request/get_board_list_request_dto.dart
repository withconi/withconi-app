import 'dart:html';
import 'package:withconi/core/network_handling/network_service.dart';
import 'package:withconi/core/tools/api_url.dart';
import 'package:withconi/data/model/dto/request_dto/abstract_request/request_info_abstract.dart';

import '../abstract_request/request_dto_abstract.dart';

// ignore: prefer_void_to_null
class GetBoardListRequestDTO extends RequestDTO<GetBoardListRequestDTO, Null>
    implements RequestInfo {
  @override
  bool requiresToken = true;

  @override
  RequestType requestType = RequestType.GET;

  @override
  String url = HttpUrl.BOARD_GET;

  @override
  FormData? formData;

  GetBoardListRequestDTO.fromData() : super.fromData(null);

  @override
  Map<String, dynamic> get dataMap => {};
}
