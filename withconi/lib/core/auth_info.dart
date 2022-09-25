import 'dart:core';
import 'package:freezed_annotation/freezed_annotation.dart';
import '../configs/constants/enum.dart';

class CustomAuthInfo {
  dynamic authObject;
  String email;
  Provider provider;
  // bool isEmailVerified;
  // bool isEmailVerifySkipped;

  CustomAuthInfo({
    required this.authObject,
    required this.email,
    required this.provider,
  });
}
