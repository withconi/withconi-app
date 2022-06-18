import 'dart:async';

import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:withconi/configs/constants/enum.dart';
import 'package:withconi/configs/helpers/token_manager.dart';
import 'package:withconi/core/error_handling/exceptions.dart';
import 'package:withconi/data/model/disease.dart';
import 'package:withconi/data/provider/auth_api.dart';
import 'package:withconi/data/provider/disease_api.dart';

import '../../controller/signup/shared_data/disease_data.dart';
import '../../core/error_handling/failures.dart';

class DiseaseSearchRepository {
  final DiseaseAPI _api = DiseaseAPI();

  Future<Either<Failure, List<Disease>>> getDiseaseList(
      {required String diseaseName}) async {
    try {
      Map<String, dynamic> data = await _api.getDiseaseList(
          diseaseName: diseaseName, page: 1, listSize: 30);
      List<Disease> diseaseList = DiseaseResponse.fromJson(data).results;
      return Right(diseaseList);
    } on NoInternetConnectionException {
      return Left(NoConnectionFailure(message: '인터넷에 연결되어있지 않습니다'));
    } on DataParsingException {
      return Left(DataParsingFailure(message: '질병 데이터를 불러올 수 없습니다'));
    }
  }

  // bool setDiseaseList(List<Disease> diseaseList) {
  //   try {
  //     DiseaseData.to.setDiseaseList(diseaseList);
  //     return true;
  //   } catch (e) {
  //     return false;
  //   }
  // }

  Either<Failure, bool> addDisease(Disease disease) {
    try {
      return Right(DiseaseData.to.addDisease(disease));
    } on MaxListException {
      return Left(MaxListFailure(message: '질병은 4개까지만 추가 가능합니다'));
    }
  }

  Either<Failure, bool> removeDisease(Disease disease) {
    try {
      return Right(DiseaseData.to.removeDisease(disease));
    } on MaxListException {
      return Left(MaxListFailure(message: '삭제할 질병이 없습니다'));
    }
  }

  Either<Failure, List<Disease>> getSelectedDiseaseList(Disease disease) {
    try {
      return Right(DiseaseData.to.selectedDiseases);
    } on MaxListException {
      return Left(MaxListFailure(message: '리스트 저장에 실패했습니다'));
    }
  }

  // bool editDisease(Disease disease) {
  //   return true;
  // }

  // bool removeDisease(Disease disease) {
  //   try {
  //     // DiseaseData.to.removeDisease(Disease);
  //     return true;
  //   } catch (e) {
  //     return false;
  //   }
  // }
}
