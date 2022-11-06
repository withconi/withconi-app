import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:withconi/data/enums/enum.dart';
import '../../disease.dart';
import '../../json_converter/datetime_converter.dart';
import '../../json_converter/disease_id_converter.dart';
part 'conimal_response_dto.freezed.dart';
part 'conimal_response_dto.g.dart';

@freezed
class ConimalResponseDTO with _$ConimalResponseDTO {
  @JsonSerializable(explicitToJson: true)
  factory ConimalResponseDTO({
    required String conimalId,
    required String name,
    required Species species,
    required Gender gender,
    @Default('') String? userId,
    @DateTimeConverter() required DateTime birthDate,
    @DateTimeConverter() required DateTime adoptedDate,
    @DiseaseIdConverter() @Default([]) List<Disease> diseases,
  }) = _ConimalResponseDTO;

  factory ConimalResponseDTO.fromJson(Map<String, dynamic> json) =>
      _$ConimalResponseDTOFromJson(json);
}
