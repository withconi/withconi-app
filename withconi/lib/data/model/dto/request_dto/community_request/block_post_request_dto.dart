import 'dart:ffi';
import 'package:dartz/dartz.dart';
import 'package:withconi/core/network_handling/network_service.dart';
import 'package:withconi/core/tools/api_url.dart';
import 'package:withconi/data/model/dto/request_dto/abstract_request/request_info_abstract.dart';
import '../abstract_request/request_dto_abstract.dart';

class BlockPostRequestDTO extends RequestConverter<BlockPostRequestDTO, Null>
    implements RequestDTO {
  final String _authorId;
  @override
  bool get requiresToken => true;

  @override
  RequestType get requestType => RequestType.POST;

  @override
  String get url => HttpUrl.COMMUNITY_BLOCK_POST;

  BlockPostRequestDTO.fromData({required String authorId})
      : _authorId = authorId,
        super.fromData(null);

  @override
  Map<String, dynamic> get dataMap => {
        "authorId": _authorId,
      };
}
