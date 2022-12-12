import 'package:dartz/dartz.dart';
import 'package:withconi/data/model/dto/request_dto/abstract_request/request_dto_abstract.dart';
import 'package:withconi/data/model/dto/request_dto/abstract_request/request_info_abstract.dart';
import 'package:withconi/module/ui_model/disease_ui_model.dart';
import '../../../../../core/network_handling/network_service.dart';
import '../../../../../core/tools/api_url.dart';

class UpdateConimalDiseaseRequestDTO extends RequestConverter<
    UpdateConimalDiseaseRequestDTO,
    Tuple2<String, List<DiseaseUIModel>>> implements RequestDTO {
  final String _conimalId;
  final List<String> _diseaseIdList;

  @override
  bool get requiresToken => true;

  @override
  RequestType get requestType => RequestType.POST;

  @override
  String get url => HttpUrl.CONIMAL_UPDATE;

  UpdateConimalDiseaseRequestDTO.fromData(
      {required String conimalId, required List<DiseaseUIModel> diseases})
      : _conimalId = conimalId,
        _diseaseIdList = diseases.map((e) => (e.diseaseId)).toList(),
        super.fromData(Tuple2(conimalId, diseases));

  // @override
  // factory CreateConimalRequestDTO.fromData(ConimalUIModel conimalUIModel) {
  //   return CreateConimalRequestDTO._(
  //     adoptedDate: conimalUIModel.adoptedDate!,
  //     birthDate: conimalUIModel.birthDate!,
  //     breed: conimalUIModel.breed,
  //     diseases: conimalUIModel.diseases,
  //     gender: conimalUIModel.gender!,
  //     name: conimalUIModel.name,
  //     species: conimalUIModel.species!,
  //   );
  // }

  @override
  Map<String, dynamic> get dataMap {
    // print('업데이트 하려는 disease 리스트의 code => ${_diseaseIdList.map((e) => e)}');
    // _diseaseIdList.removeWhere((element) =>
    //     (int.tryParse(element) == null || int.parse(element) > 2000));

    // diseaseIntIdList
    //     .removeWhere((element) => (element == null || element > 2000));

    // List<String> diseaseStringList =
    //     diseaseIntIdList.map((e) => e.toString()).toList();

    return {
      'conimalId': _conimalId,
      'diseases': _diseaseIdList,
    };
  }
}
