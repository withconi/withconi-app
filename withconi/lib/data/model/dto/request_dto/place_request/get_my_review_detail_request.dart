import 'package:withconi/core/network_handling/network_service.dart';
import 'package:withconi/core/tools/api_url.dart';
import 'package:withconi/data/model/dto/request_dto/abstract_request/request_info_abstract.dart';
import '../abstract_request/request_dto_abstract.dart';

class GetMyReviewDetailRequestDTO
    extends RequestConverter<GetMyReviewDetailRequestDTO, String>
    implements RequestDTO {
  final String reviewId;
  @override
  bool get requiresToken => true;

  @override
  RequestType get requestType => RequestType.GET;

  @override
  String get url => HttpUrl.MAP_GET_MY_REVIEW_LIST;

  GetMyReviewDetailRequestDTO.fromData({required this.reviewId})
      : super.fromData(reviewId);

  @override
  Map<String, dynamic> get dataMap => {};
}
