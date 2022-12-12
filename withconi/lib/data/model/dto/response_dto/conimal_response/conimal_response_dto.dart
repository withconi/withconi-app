import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:withconi/data/enums/enum.dart';

import '../../../json_converter/datetime_converter.dart';
import '../abstract_dto/response_dto.dart';
import '../disease_response/disease_response_dto.dart';
part 'conimal_response_dto.freezed.dart';
part 'conimal_response_dto.g.dart';

@freezed
class ConimalResponseDTO with _$ConimalResponseDTO implements ResponseDTO {
  @JsonSerializable(explicitToJson: true)
  factory ConimalResponseDTO({
    @JsonKey(name: '_id') required String conimalId,
    required String name,
    required Species species,
    required Gender gender,
    @Default(false) bool isNeutralized,
    @JsonKey(name: 'speciesName') @Default('breed') String breed,
    @Default('') String? userId,
    @DateTimeConverter() required DateTime birthDate,
    @DateTimeConverter() required DateTime adoptedDate,
    @Default([]) List<DiseaseResponseDTO> diseases,
  }) = _ConimalResponseDTO;

  factory ConimalResponseDTO.fromJson(Map<String, dynamic> json) =>
      _$ConimalResponseDTOFromJson(json);
}
