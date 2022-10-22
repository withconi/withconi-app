// ignore_for_file: prefer_const_constructors

import 'dart:async';
import 'package:dartz/dartz.dart';
import 'package:withconi/controller/ui_helper/infinite_scroll.dart';
import 'package:withconi/core/error_handling/exceptions.dart';
import 'package:withconi/data/model/disease.dart';
import 'package:withconi/data/provider/disease_api.dart';
import '../../core/error_handling/failures.dart';
import '../model/response_model/response_model.dart';

class DiseaseRepository {
  final DiseaseAPI _api = DiseaseAPI();

  Future<Either<Failure, DiseaseResponse>> getDiseaseList(
      {required String diseaseName,
      required PaginationFilter paginationFilter}) async {
    try {
      Map<String, dynamic> data = await _api.getDiseaseList(
          diseaseName: diseaseName,
          page: paginationFilter.page,
          listSize: paginationFilter.limit);
      DiseaseResponse diseaseResponse = DiseaseResponse.fromJson(data);
      return Right(diseaseResponse);
    } on NoInternetConnectionException {
      return Left(NoConnectionFailure());
    } on DataParsingException {
      return Left(DataParsingFailure());
    }
  }
}
