// ignore_for_file: prefer_const_constructors

import 'dart:async';
import 'package:dartz/dartz.dart';
import 'package:withconi/core/error_handling/exceptions.dart';
import 'package:withconi/data/model/disease.dart';
import 'package:withconi/data/provider/disease_api.dart';
import '../../core/error_handling/failures.dart';
import '../../core/network_handling/response_model.dart';

class DiseaseRepository {
  final DiseaseAPI _api = DiseaseAPI();

  Future<Either<Failure, List<Disease>>> getDiseaseList(
      {required String diseaseName}) async {
    try {
      Map<String, dynamic> data = await _api.getDiseaseList(
          diseaseName: diseaseName, page: 1, listSize: 30);
      List<Disease> diseaseList = DiseaseResponse.fromJson(data).results;
      return Right(diseaseList);
    } on NoInternetConnectionException {
      return Left(NoConnectionFailure());
    } on DataParsingException {
      return Left(DataParsingFailure());
    }
  }
}
