import 'package:dartz/dartz.dart';
import 'package:withconi/core/network_handling/network_service.dart';
import 'package:withconi/core/tools/api_url.dart';
import 'package:withconi/data/model/dto/request_dto/abstract_request/request_info_abstract.dart';

import '../../../../enums/enum.dart';
import '../abstract_request/request_dto_abstract.dart';

// ignore: prefer_void_to_null
class GetBreedListRequestDTO
    extends RequestConverter<GetBreedListRequestDTO, Species>
    implements RequestDTO {
  final Species _species;
  // final String _keyword;
  @override
  bool get requiresToken => false;

  @override
  RequestType get requestType => RequestType.GET;

  @override
  String get url => HttpUrl.BREED_LIST_GET;

  GetBreedListRequestDTO.fromData({
    required Species species,
  })  : _species = species,
        // _keyword = keyword,
        super.fromData(species);

  @override
  Map<String, dynamic> get dataMap => {
        // 'keyword': _keyword,
        'species': _species.code,
      };
}
