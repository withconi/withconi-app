import 'package:freezed_annotation/freezed_annotation.dart';
import '../../../../enums/enum.dart';
import '../abstract_dto/response_dto.dart';
part 'email_duplication_check_response_dto.freezed.dart';
part 'email_duplication_check_response_dto.g.dart';

@freezed
class UserInfoExistenceResponseDTO
    with _$UserInfoExistenceResponseDTO
    implements ResponseDTO {
  @JsonSerializable(explicitToJson: true)
  factory UserInfoExistenceResponseDTO({
    @Default(false) bool isAuth,
    @Default(false) bool isDB,
    Provider? provider,
  }) = _UserInfoExistenceResponseDTO;

  factory UserInfoExistenceResponseDTO.fromJson(Map<String, dynamic> json) =>
      _$UserInfoExistenceResponseDTOFromJson(json);
}
