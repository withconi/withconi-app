import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:withconi/data/enums/enum.dart';

import '../conimal_response/conimal_response_dto.dart';
part 'user_response_dto.freezed.dart';
part 'user_response_dto.g.dart';

@freezed
class UserResponseDTO with _$UserResponseDTO {
  @JsonSerializable(explicitToJson: true)
  factory UserResponseDTO(
      {required String uid,
      required String email,
      required String displayName,
      required String nickname,
      required Provider provider,
      required bool isEmailVerified,
      required bool verificationSkipped,
      @JsonKey(name: 'profileImageUrl') @Default('') String photoURL,
      @Default(false) bool isWrittenReview,
      required List<ConimalResponseDTO> conimals}) = _WcUser;

  factory UserResponseDTO.fromJson(Map<String, dynamic> json) =>
      _$UserResponseDTOFromJson(json);
}
