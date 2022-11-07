import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:withconi/data/model/dto/response_dto/place_response/place_abstract_dto/place_response_dto.dart';
import 'package:withconi/data/model/dto/response_dto/post_response_dto.dart';
import 'package:withconi/module/ui_model/latlng_ui_model.dart';

import '../abstract_dto/response_dto.dart';
import '../disease_response_dto.dart';

part 'lat_lng_response_dto.freezed.dart';
part 'lat_lng_response_dto.g.dart';

@freezed
class LatLngResponseDTO with _$LatLngResponseDTO implements ResponseDTO {
  @JsonSerializable(explicitToJson: true)
  factory LatLngResponseDTO({
    required double lat,
    required double lng,
  }) = _LatLngResponseDTO;

  factory LatLngResponseDTO.fromJson(Map<String, dynamic> json) =>
      _$LatLngResponseDTOFromJson(json);
}
