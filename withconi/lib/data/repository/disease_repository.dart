// ignore_for_file: prefer_const_constructors

import 'dart:async';
import 'package:dartz/dartz.dart';
import 'package:withconi/core/tools/helpers/infinite_scroll.dart';
import 'package:withconi/core/error_handling/exceptions.dart';
import 'package:withconi/data/model/dto/api_call_dto.dart';
import 'package:withconi/data/model/dto/request_dto/disease_request/get_disease_request_dto.dart';
import 'package:withconi/data/provider/remote_provider/disease_api.dart';
import 'package:withconi/import_basic.dart';
import '../../core/error_handling/failures.dart';
import '../model/dto/response_dto/disease_response/disease_list_response_dto.dart';
import '../model/dto/response_dto/disease_response/disease_response_dto.dart';

class DiseaseRepository extends GetxService {
  DiseaseRepository(this._api);
  final DiseaseAPI _api;

  Future<Either<Failure, List<DiseaseResponseDTO>>> getDiseaseList(
      {required String keyword,
      required PaginationFilter paginationFilter}) async {
    try {
      GetDiseaseListRequestDTO requestDTO = GetDiseaseListRequestDTO.fromData(
          paginationFilter: paginationFilter, keyword: keyword);
      ApiCallDTO apiCallDTO = ApiCallDTO.fromDTO(requestDTO);
      Map<String, dynamic> data = await _api.getDiseaseList(apiCallDTO);
      var diseaseListResponseDTO = DiseaseListResponseDTO.fromJson(data);

      return Right(diseaseListResponseDTO.list);
    } on NoInternetConnectionException {
      return Left(NoConnectionFailure());
    } on DataParsingException {
      return Left(DataParsingFailure());
    }
  }
}
