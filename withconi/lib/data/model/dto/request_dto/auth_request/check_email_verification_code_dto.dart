// ignore_for_file: prefer_void_to_null

import 'package:dartz/dartz.dart';
import 'package:dio/src/form_data.dart';
import 'package:withconi/core/network_handling/network_service.dart';
import 'package:withconi/core/tools/api_url.dart';
import 'package:withconi/core/tools/helpers/infinite_scroll.dart';
import 'package:withconi/data/model/dto/request_dto/abstract_request/request_info_abstract.dart';
import '../../../../enums/enum.dart';
import '../abstract_request/request_dto_abstract.dart';

class CheckEmailVerificationCodeRequestDTO
    extends RequestConverter<CheckEmailVerificationCodeRequestDTO, String>
    implements RequestDTO {
  final String email;
  final String verificationCode;
  @override
  bool get requiresToken => false;

  // TODO: GetCustomTokenDTO Post 맞는지 확인하기
  @override
  RequestType get requestType => RequestType.POST;

  @override
  String get url => HttpUrl.VERIFY_EMAIL_CODE;

  CheckEmailVerificationCodeRequestDTO.fromData(
      this.email, this.verificationCode)
      : super.fromData(email);

  @override
  Map<String, dynamic> get dataMap =>
      {"to": email, "authNumber": verificationCode};
}
