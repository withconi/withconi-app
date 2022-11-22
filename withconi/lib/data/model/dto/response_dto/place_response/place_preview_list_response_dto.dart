import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:withconi/data/model/dto/response_dto/place_response/place_preview_response_dto.dart';
import '../abstract_dto/response_dto.dart';
part 'place_preview_list_response_dto.freezed.dart';
part 'place_preview_list_response_dto.g.dart';

@freezed
class PlacePreviewListResponseDTO
    with _$PlacePreviewListResponseDTO
    implements ResponseDTO {
  @JsonSerializable(explicitToJson: true)
  factory PlacePreviewListResponseDTO({
    required List<PlacePreviewResponseDTO> list,
    required int totalDocuments,
  }) = _PlacePreviewListResponseDTO;

  factory PlacePreviewListResponseDTO.fromJson(Map<String, dynamic> json) =>
      _$PlacePreviewListResponseDTOFromJson(json);
}
