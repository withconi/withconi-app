import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'package:flutter_naver_login/flutter_naver_login.dart';

import 'package:withconi/core/values/constants/auth_variables.dart';

import 'package:withconi/core/error_handling/exceptions.dart';
import 'package:withconi/core/network_handling/network_service.dart';

import 'package:withconi/data/model/dto/api_call_dto.dart';
import 'package:withconi/data/model/dto/request_dto/community_request/get_version_check_request_dto.dart';

import '../../../core/error_handling/failures.dart';

class AppSettingAPI {
  final Api _dio = Api();

  checkAppVersion() async {
    GetVersionCheckRequestDTO requestDTO = GetVersionCheckRequestDTO.fromData();
    ApiCallDTO apiCallDTO = ApiCallDTO.fromDTO(requestDTO);
    Map<String, dynamic> data = await _dio.apiCall(apiCallDTO);

    return data;
  }
}
