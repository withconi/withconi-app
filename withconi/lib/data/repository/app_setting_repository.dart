import 'package:dartz/dartz.dart';
import 'package:withconi/core/error_handling/exceptions.dart';
import 'package:withconi/core/error_handling/failures.dart';
import 'package:withconi/data/model/dto/api_call_dto.dart';
import 'package:withconi/data/model/dto/request_dto/image_request/create_image_request_dto.dart';
import 'package:withconi/data/model/dto/request_dto/inquiry_request/create_inquiry_request_dto.dart';
import 'package:withconi/data/model/dto/response_dto/setting_response/developer_info_list_response_dto.dart';
import 'package:withconi/data/provider/remote_provider/app_config_api.dart';
import 'package:withconi/import_basic.dart';

import '../enums/enum.dart';
import '../model/dto/request_dto/setting_request/get_developer_info_request_dto.dart';

class AppSettingRepository extends GetxController {
  // final AuthAPI _api = AuthAPI();
  AppSettingRepository(this._api);
  final AppSettingAPI _api;

  Future<Either<Failure, bool>> checkAppVersion() async {
    try {
      Map<String, dynamic> result = await _api.checkAppVersion();
      return Right(result['isEqual'] as bool);
    } on NoInternetConnectionException {
      return Left(NoConnectionFailure());
    } catch (e) {
      return Left(VersionCheckFailure());
    }
  }

  Future<Either<Failure, DeveloperInfoListResponseDTO>>
      getDeveloperInfo() async {
    try {
      GetDeveloperInfoRequestDTO requestDTO =
          GetDeveloperInfoRequestDTO.fromData();
      ApiCallDTO apiCallDTO = ApiCallDTO.fromDTO(requestDTO);
      Map<String, dynamic> result = await _api.getDeveloperInfo(apiCallDTO);
      DeveloperInfoListResponseDTO developerInfo =
          DeveloperInfoListResponseDTO.fromJson(result);
      return Right(developerInfo);
    } on NoInternetConnectionException {
      return Left(NoConnectionFailure());
    } catch (e) {
      return Left(VersionCheckFailure());
    }
  }

  Future<Either<Failure, bool>> createInquiry(
      {required InquiryItem inquiryItem, required String inquiryDesc}) async {
    try {
      CreateInquiryRequestDTO requestDTO =
          CreateInquiryRequestDTO.fromData(inquiryItem, inquiryDesc);
      ApiCallDTO apiCallDTO = ApiCallDTO.fromDTO(requestDTO);
      Map<String, dynamic> result = await _api.createInquiry(apiCallDTO);
      return Right(true);
    } on NoInternetConnectionException {
      return Left(NoConnectionFailure());
    } catch (e) {
      return Left(VersionCheckFailure());
    }
  }
}
