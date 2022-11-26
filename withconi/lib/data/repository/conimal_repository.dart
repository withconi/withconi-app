import 'package:dartz/dartz.dart';
import 'package:withconi/data/model/dto/api_call_dto.dart';
import 'package:withconi/data/model/dto/request_dto/conimal_request/create_conimal_request_dto.dart';
import 'package:withconi/data/model/dto/request_dto/conimal_request/delete_conimal_request_dto.dart';
import 'package:withconi/data/model/dto/request_dto/conimal_request/get_breed_list_request.dart';
import 'package:withconi/data/model/dto/request_dto/conimal_request/update_conimal_disease_dto.dart';
import 'package:withconi/data/model/dto/request_dto/conimal_request/update_conimal_list_request_dto.dart';
import 'package:withconi/data/model/dto/request_dto/conimal_request/update_conimal_request_dto.dart';
import 'package:withconi/core/error_handling/exceptions.dart';
import 'package:withconi/data/model/dto/response_dto/community_response/breed_list_response_dto.dart';
import 'package:withconi/data/model/dto/response_dto/community_response/breed_response_dto.dart';
import 'package:withconi/import_basic.dart';
import 'package:withconi/module/ui_model/conimal_ui_model.dart';
import 'package:withconi/module/ui_model/disease_ui_model.dart';
import '../../core/error_handling/failures.dart';
import '../enums/enum.dart';
import '../model/dto/request_dto/user_request/update_user_info_request_dto.dart';
import '../provider/remote_provider/conimal_api.dart';

class ConimalRepository extends GetxService {
  ConimalRepository(this._api);
  final ConimalAPI _api;

  Future<Either<Failure, bool>> createConimal(
      {required ConimalUIModel newConimal}) async {
    try {
      CreateConimalRequestDTO requestDTO =
          CreateConimalRequestDTO.fromData(data: newConimal);
      ApiCallDTO apiCallDTO = ApiCallDTO.fromDTO(requestDTO);
      await _api.createConimal(apiCallDTO);

      return Right(true);
    } on MaxListException {
      return Left(MaxConimalFailure());
    } catch (e) {
      return Left(DataParsingFailure());
    }
  }

  Future<Either<Failure, List<BreedResponseDTO>>> getBreedList(
      {required Species species}) async {
    try {
      GetBreedListRequestDTO requestDTO = GetBreedListRequestDTO.fromData(
        species: species,
      );
      ApiCallDTO apiCallDTO = ApiCallDTO.fromDTO(requestDTO);
      var breedListData = await _api.getBreedList(apiCallDTO);

      List<BreedResponseDTO> breedListDto =
          BreedListResponseDTO.fromJson(breedListData).list;

      return Right(breedListDto);
    } on MaxListException {
      return Left(MaxConimalFailure());
    } catch (e) {
      return Left(DataParsingFailure());
    }
  }

  Future<Either<Failure, bool>> updateConimal(
      {required ConimalUIModel editConimal}) async {
    try {
      // print(AuthController.to.wcUser.value!.uid);
      UpdateConimalRequestDTO requestDTO =
          UpdateConimalRequestDTO.fromData(data: editConimal);
      ApiCallDTO apiCallDTO = ApiCallDTO.fromDTO(requestDTO);
      await _api.updateConimal(apiCallDTO);

      return Right(true);
    } on MaxListException {
      return Left(MaxConimalFailure());
    } catch (e) {
      return Left(DataParsingFailure());
    }
  }

  Future<Either<Failure, bool>> updateConimalDisease({
    required List<DiseaseUIModel> diseases,
    required String conimalId,
  }) async {
    try {
      UpdateConimalDiseaseRequestDTO requestDTO =
          UpdateConimalDiseaseRequestDTO.fromData(
              conimalId: conimalId, diseases: diseases);

      ApiCallDTO apiCallDTO = ApiCallDTO.fromDTO(requestDTO);

      await _api.updateConimalDisease(apiCallDTO);

      return Right(true);
    } on MaxListException {
      return Left(MaxConimalFailure());
    } catch (e) {
      return Left(DataParsingFailure());
    }
  }

  Future<Either<Failure, bool>> deleteConimal(
      {required String conimalId}) async {
    try {
      DeleteConimalRequestDTO requestDTO =
          DeleteConimalRequestDTO.fromData(conimalId: conimalId);

      ApiCallDTO apiCallDTO = ApiCallDTO.fromDTO(requestDTO);
      await _api.deleteConimal(apiCallDTO);

      return Right(true);
    } on MaxListException {
      return Left(MaxConimalFailure());
    } catch (e) {
      return Left(DataParsingFailure());
    }
  }

  Future<Either<Failure, bool>> updateConimalList(
      {required List<ConimalUIModel> conimals}) async {
    try {
      var requestDTO =
          UpdateConimalListRequestDTO.fromData(conimalList: conimals);
      var apiCallDTO = ApiCallDTO.fromDTO(requestDTO);
      Map<String, dynamic>? data = await _api.updateConimalList(apiCallDTO);
      return Right(true);
    } on NoInternetConnectionException {
      return Left(NoConnectionFailure());
    } on NotFoundException {
      return Left(NotFoundFailure());
    } catch (e) {
      return Left(UserInfoUpdateFailure());
    }
  }
}
