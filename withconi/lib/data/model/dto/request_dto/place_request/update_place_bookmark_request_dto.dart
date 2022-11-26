import 'package:dartz/dartz.dart';
import 'package:withconi/data/model/dto/request_dto/abstract_request/request_dto_abstract.dart';
import 'package:withconi/data/model/dto/request_dto/abstract_request/request_info_abstract.dart';

import '../../../../../core/network_handling/network_service.dart';
import '../../../../../core/tools/api_url.dart';

class UpdatePlaceBookmarkRequestDTO extends RequestConverter<
    UpdatePlaceBookmarkRequestDTO, Tuple2<String, bool>> implements RequestDTO {
  final String placeId;
  final bool isBookmarked;

  @override
  bool get requiresToken => true;

  @override
  RequestType get requestType => RequestType.POST;

  @override
  String get url => HttpUrl.MAP_UPDATE_BOOKMARK;

  UpdatePlaceBookmarkRequestDTO.fromData(
      {required this.placeId, required this.isBookmarked})
      : super.fromData(Tuple2(placeId, isBookmarked));

  @override
  Map<String, dynamic> get dataMap {
    return {"placeId": placeId, "isBookmarked": isBookmarked};
  }
}
