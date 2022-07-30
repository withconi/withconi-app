import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:withconi/configs/constants/enum.dart';
part 'custom_token.freezed.dart';
part 'custom_token.g.dart';

@freezed
class CustomToken with _$CustomToken {
  factory CustomToken({
    required Provider provider,
    required String uid,
    required String accessToken,
  }) = _CustomToken;

  factory CustomToken.fromJson(Map<String, dynamic> json) =>
      _$CustomTokenFromJson(json);
}
