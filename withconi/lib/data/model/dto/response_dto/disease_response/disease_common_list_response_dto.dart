import 'package:freezed_annotation/freezed_annotation.dart';
import '../abstract_dto/response_dto.dart';
import 'disease_response_dto.dart';
part 'disease_common_list_response_dto.freezed.dart';
part 'disease_common_list_response_dto.g.dart';

@freezed
class DiseaseCommonListResponseDTO
    with _$DiseaseCommonListResponseDTO
    implements ResponseDTO {
  @JsonSerializable(explicitToJson: true)
  factory DiseaseCommonListResponseDTO({
    @JsonKey(name: 'cat') @Default([]) List<DiseaseResponseDTO> catDiseaseList,
    @JsonKey(name: 'dog') @Default([]) List<DiseaseResponseDTO> dogDiseaseList,
  }) = _DiseaseCommonListResponseDTO;

  factory DiseaseCommonListResponseDTO.fromJson(Map<String, dynamic> json) =>
      _$DiseaseCommonListResponseDTOFromJson(json);
}
