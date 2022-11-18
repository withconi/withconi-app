import 'package:freezed_annotation/freezed_annotation.dart';
import '../abstract_dto/response_dto.dart';
import 'disease_response_dto.dart';
part 'disease_list_response_dto.freezed.dart';
part 'disease_list_response_dto.g.dart';

@freezed
class DiseaseListResponseDTO
    with _$DiseaseListResponseDTO
    implements ResponseDTO {
  @JsonSerializable(explicitToJson: true)
  factory DiseaseListResponseDTO({
    required List<DiseaseResponseDTO> list,
    required int totalDocuments,
  }) = _DiseaseListResponseDTO;

  factory DiseaseListResponseDTO.fromJson(Map<String, dynamic> json) =>
      _$DiseaseListResponseDTOFromJson(json);
}
