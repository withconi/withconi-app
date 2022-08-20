import 'dart:core';
import 'package:freezed_annotation/freezed_annotation.dart';
import '../configs/constants/enum.dart';
part 'auth_info.freezed.dart';
part 'auth_info.g.dart';

@freezed
class AuthInfo with _$AuthInfo {
  factory AuthInfo(
      {required dynamic authObject,
      required String email,
      required Provider provider,
      @Default(false) bool? isEmailVerified,
      @Default(false) bool? isEmailVerifySkipped,
      required}) = _AuthInfo;

  factory AuthInfo.fromJson(Map<String, dynamic> json) =>
      _$AuthInfoFromJson(json);
}
