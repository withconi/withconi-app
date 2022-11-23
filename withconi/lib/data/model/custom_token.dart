import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:withconi/data/enums/enum.dart';
part 'custom_token.freezed.dart';
part 'custom_token.g.dart';

@freezed
class CustomTokenResponseDTO with _$CustomTokenResponseDTO {
  factory CustomTokenResponseDTO({
    required Provider provider,
    required String uid,
    required String accessToken,
  }) = _CustomTokenResponseDTO;

  factory CustomTokenResponseDTO.fromJson(Map<String, dynamic> json) =>
      _$CustomTokenResponseDTOFromJson(json);
}
