// ignore_for_file: prefer_const_constructors

import 'dart:async';
import 'package:dartz/dartz.dart';
import 'package:withconi/core/tools/helpers/infinite_scroll.dart';
import 'package:withconi/core/error_handling/exceptions.dart';
import 'package:withconi/data/model/dto/api_call_dto.dart';
import 'package:withconi/data/model/dto/joined_dto/symptom.dart';
import 'package:withconi/data/model/dto/request_dto/diagnosis_request/get_diagnosis_result_request_dto.dart';
import 'package:withconi/data/model/dto/request_dto/diagnosis_request/get_symptom_list_request_dto.dart';
import 'package:withconi/data/model/dto/request_dto/disease_request/get_disease_detail_request_dto.dart';
import 'package:withconi/data/model/dto/request_dto/disease_request/get_disease_request_dto.dart';
import 'package:withconi/data/model/dto/response_dto/diagnosis_response/symptom_list_response_dto.dart';
import 'package:withconi/data/provider/remote_provider/diagnosis_api.dart';
import 'package:withconi/data/provider/remote_provider/disease_api.dart';
import 'package:withconi/import_basic.dart';
import '../../core/error_handling/failures.dart';
import '../enums/enum.dart';
import '../model/diagnosis_result_list_response_dto.dart';
import '../model/dto/response_dto/disease_response/disease_list_response_dto.dart';
import '../model/dto/response_dto/disease_response/disease_response_dto.dart';

class DiagnosisRepository extends GetxService {
  DiagnosisRepository(this._api);
  final DiagnosisAPI _api;

  late Species _selectedSpecies;
  late Gender _selectedGender;
  late bool _isNeutralized;
  late String _selectedBreed;
  late DateTime _selectedBirthDate;

  List<SymptomGroup> _selectedSymptomList = List.empty(growable: true);

  storeConimalInfo(Species species, Gender gender, bool isNeutralized,
      String breed, DateTime birthDate) {
    _selectedSpecies = species;
    _selectedGender = gender;
    _isNeutralized = isNeutralized;
    _selectedBreed = breed;
    _selectedBirthDate = birthDate;
  }

  storeSymptomList(List<SymptomGroup> symptomGroupList) {
    _selectedSymptomList.assignAll(symptomGroupList.toList());
  }

  Future<Either<Failure, SymptomListResponseDTO>> getSymptomList() async {
    try {
      GetSymptomListRequestDTO requestDTO = GetSymptomListRequestDTO.fromData();
      ApiCallDTO apiCallDTO = ApiCallDTO.fromDTO(requestDTO);
      Map<String, dynamic> data = await _api.getSymptomList(apiCallDTO);

      SymptomListResponseDTO responseDTO =
          SymptomListResponseDTO.fromJson(data);

      return Right(responseDTO);
    } on NoInternetConnectionException {
      return Left(NoConnectionFailure());
    } on DataParsingException {
      return Left(DataParsingFailure());
    } catch (e) {
      return Left(NotFoundFailure());
    }
  }

  Future<Either<Failure, DiagnosisResultListResponseDTO>>
      getDiagnosisResult() async {
    try {
      GetDiagnosisResultRequestDTO requestDTO =
          GetDiagnosisResultRequestDTO.fromData(
              _selectedSpecies,
              _selectedGender,
              _isNeutralized,
              _selectedBreed,
              _selectedBirthDate,
              _selectedSymptomList);
      ApiCallDTO apiCallDTO = ApiCallDTO.fromDTO(requestDTO);
      Map<String, dynamic> data = await _api.getSymptomList(apiCallDTO);

      DiagnosisResultListResponseDTO responseDTO =
          DiagnosisResultListResponseDTO.fromJson(data);

      return Right(responseDTO);
    } on NoInternetConnectionException {
      return Left(NoConnectionFailure());
    } on DataParsingException {
      return Left(DataParsingFailure());
    } catch (e) {
      return Left(NotFoundFailure());
    }
  }
}
