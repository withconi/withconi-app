import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:withconi/data/enums/enum.dart';
import 'package:withconi/data/model/dto/response_dto/place_response/place_preview_response_dto.dart';

import '../../../json_converter/datetime_converter.dart';
import '../../joined_dto/symptom.dart';
import '../abstract_dto/response_dto.dart';
import '../conimal_response/conimal_response_dto.dart';
import '../disease_response/disease_response_dto.dart';
part 'review_detail_response_dto.freezed.dart';
part 'review_detail_response_dto.g.dart';

@freezed
class ReviewDetailResponseDTO
    with _$ReviewDetailResponseDTO
    implements ResponseDTO {
  @JsonSerializable(explicitToJson: true)
  factory ReviewDetailResponseDTO({
    @DateTimeConverter() required DateTime createdAt,
    required PlacePreviewResponseDTO placePreview,
    required List<ConimalResponseDTO> conimals,
    required List<DiseaseType> diseaseTypeList,
    required List<DiseaseResponseDTO> diseaseList,
    required ReviewRate reviewRate,
    required List<ReviewItem> reviewItems,
    required String reviewDesc,
    @Default('') String definition,
    @Default('') String diagnosisTechnique,
    @Default('') String treatment,
    @Default('') String advice,
    @Default([]) List<SymptomGroup> symptomGroupList,
    @Default(DiseaseType.brainNeurology) DiseaseType diseaseType,
    // @ImageItemConverter() @Default([]) required List<ImageItem> images,
  }) = _ReviewDetailResponseDTO;

  factory ReviewDetailResponseDTO.fromJson(Map<String, dynamic> json) =>
      _$ReviewDetailResponseDTOFromJson(json);
}
