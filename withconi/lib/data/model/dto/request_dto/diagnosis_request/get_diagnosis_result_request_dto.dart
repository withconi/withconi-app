import 'package:dartz/dartz.dart';
import 'package:withconi/core/network_handling/network_service.dart';
import 'package:withconi/core/tools/api_url.dart';
import 'package:withconi/data/model/dto/api_call_dto.dart';
import 'package:withconi/data/model/dto/joined_dto/symptom.dart';
import 'package:withconi/module/ui_model/ui_model_abstract/ui_model.dart';
import '../../../../../core/tools/helpers/infinite_scroll.dart';
import '../../../../../module/ui_model/post_list_filter_ui_model.dart';
import '../../../../enums/enum.dart';
import '../abstract_request/request_dto_abstract.dart';
import '../abstract_request/request_info_abstract.dart';

class GetDiagnosisResultRequestDTO
    extends RequestConverter<GetDiagnosisResultRequestDTO, dynamic>
    implements RequestDTO {
// {
//     "conimalSpecies": "cat",
//     "conimalGender": "male",
//     "conimalIsNeutralized": true,
//     "conimalSpeciesName": "페르시안",
//     "conimalBirthDate": 1657524572528,
//     "symptoms": ["기타_감기"]
// }

  final Species _species;
  final Gender _gender;
  final bool _isNeutralized;
  final String _breed;
  final DateTime _birthDate;
  final List<SymptomGroup> _symptomGroupList;

  @override
  bool get requiresToken => true;

  @override
  RequestType get requestType => RequestType.POST;

  @override
  String get url => HttpUrl.GET_DIAGNOSIS_RESULT;

  GetDiagnosisResultRequestDTO.fromData(this._species, this._gender,
      this._isNeutralized, this._breed, this._birthDate, this._symptomGroupList)
      : super.fromData(null);

  @override
  Map<String, dynamic> get dataMap => {
        'conimalSpecies': _species.code,
        'conimalGender': _gender.code,
        'conimalIsNeutralized': _isNeutralized,
        'conimalSpeciesName': _breed,
        'conimalBirthDate': _birthDate.millisecondsSinceEpoch,
        'symptoms':
            _symptomGroupList.fold<List<String>>([], (previousValue, element) {
          previousValue.addAll(element.symptomList
              .map((symptomString) =>
                  '${element.symptomType.codeKR}_$symptomString')
              .toList());
          return previousValue;
        })
      };
}
