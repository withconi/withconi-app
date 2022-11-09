import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:withconi/data/model/dto/response_dto/review_response/review_detail_response_dto.dart';
import '../abstract_dto/response_dto.dart';
part 'review_list_response_dto.freezed.dart';
part 'review_list_response_dto.g.dart';

@freezed
abstract class ReviewListResponseDTO
    with _$ReviewListResponseDTO
    implements ResponseDTO {
  @JsonSerializable(explicitToJson: true)
  factory ReviewListResponseDTO({
    required List<ReviewDetailResponseDTO> results,
    required int totalDocuments,
  }) = _ReviewListResponseDTO;

  factory ReviewListResponseDTO.fromJson(Map<String, dynamic> json) =>
      _$ReviewListResponseDTOFromJson(json);
}
