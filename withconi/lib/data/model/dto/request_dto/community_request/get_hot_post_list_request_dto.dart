// ignore_for_file: prefer_void_to_null

import 'package:dartz/dartz.dart';
import 'package:dio/src/form_data.dart';
import 'package:withconi/core/network_handling/network_service.dart';
import 'package:withconi/core/tools/api_url.dart';
import 'package:withconi/core/tools/helpers/infinite_scroll.dart';
import 'package:withconi/data/model/dto/request_dto/abstract_request/request_info_abstract.dart';
import '../abstract_request/request_dto_abstract.dart';

class GetHotPostListRequestDTO
    extends RequestConverter<GetHotPostListRequestDTO, int>
    implements RequestDTO {
  final int _listSize;

  @override
  bool get requiresToken => true;

  @override
  RequestType get requestType => RequestType.GET;

  @override
  String get url => HttpUrl.COMMUNITY_GET_HOT_POST_LIST;

  GetHotPostListRequestDTO.fromData({required int listSize})
      : _listSize = listSize,
        super.fromData(listSize);

  @override
  Map<String, dynamic> get dataMap => {'size': _listSize};
}
