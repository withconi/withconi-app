import 'package:withconi/core/network_handling/network_service.dart';
import 'package:withconi/core/tools/api_url.dart';
import 'package:withconi/data/model/dto/request_dto/abstract_request/request_info_abstract.dart';
import '../abstract_request/request_dto_abstract.dart';

class DeleteMyReviewRequestDTO
    extends RequestConverter<DeleteMyReviewRequestDTO, String>
    implements RequestDTO {
  final String placeId;
  final String reviewId;
  @override
  bool get requiresToken => true;

  @override
  RequestType get requestType => RequestType.POST;

  @override
  String get url => HttpUrl.MAP_DELETE_REVIEW;

  DeleteMyReviewRequestDTO.fromData(
      {required this.placeId, required this.reviewId})
      : super.fromData(reviewId);

  @override
  Map<String, dynamic> get dataMap => {
        'locId': placeId,
        'reviewId': reviewId,
      };
}
