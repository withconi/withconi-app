// ignore_for_file: prefer_void_to_null

import 'package:dartz/dartz.dart';
import 'package:dio/src/form_data.dart';
import 'package:withconi/core/network_handling/network_service.dart';
import 'package:withconi/core/tools/api_url.dart';
import 'package:withconi/core/tools/helpers/infinite_scroll.dart';
import 'package:withconi/data/model/dto/request_dto/abstract_request/request_info_abstract.dart';
import '../../../../enums/enum.dart';
import '../abstract_request/request_dto_abstract.dart';

class UpdateFcmTokenRequest
    extends RequestConverter<UpdateFcmTokenRequest, String?>
    implements RequestDTO {
  final String? fcmToken;

  @override
  bool get requiresToken => true;

  // TODO: GetCustomTokenDTO Post 맞는지 확인하기
  @override
  RequestType get requestType => RequestType.POST;

  @override
  String get url => HttpUrl.FCM_REFRESH;

  UpdateFcmTokenRequest.fromData(this.fcmToken) : super.fromData(fcmToken);

  @override
  Map<String, dynamic> get dataMap => {'newToken': fcmToken};
}
