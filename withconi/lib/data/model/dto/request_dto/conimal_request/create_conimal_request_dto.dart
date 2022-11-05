import 'dart:html';
import 'package:withconi/data/model/dto/request_dto/abstract_request/request_dto_abstract.dart';
import 'package:withconi/data/model/dto/request_dto/abstract_request/request_info_abstract.dart';
import 'package:withconi/module/ui_model/conimal_ui_model.dart';
import 'package:withconi/module/ui_model/ui_model_impl/ui_model_impl.dart';
import '../../../../../core/network_handling/network_service.dart';
import '../../../../../core/tools/api_url.dart';
import '../../../../enums/enum.dart';
import '../../api_dto/api_call_dto.dart';
import '../../../disease.dart';

class CreateConimalRequestDTO
    extends RequestConverter<CreateConimalRequestDTO, ConimalUIModel>
    implements RequestDTO {
  final String name;
  final Species species;
  final Gender gender;
  final DateTime birthDate;
  final DateTime adoptedDate;
  final List<Disease> diseases;
  final String breed;

  @override
  bool requiresToken = true;

  @override
  RequestType requestType = RequestType.POST;

  @override
  String url = HttpUrl.CONIMAL_CREATE;

  @override
  FormData? formData;

  CreateConimalRequestDTO.fromData({required ConimalUIModel data})
      : adoptedDate = data.adoptedDate!,
        birthDate = data.birthDate!,
        breed = data.breed,
        diseases = data.diseases,
        gender = data.gender!,
        name = data.name,
        species = data.species!,
        super.fromData(data);

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
    List<String> diseaseIdList = diseases.map((e) => e.name).toList();
    return {
      'diseases': diseaseIdList,
      'name': name,
      'species': species.code,
      'gender': gender.code,
      'birthDate': birthDate.millisecondsSinceEpoch,
      'adoptedDate': adoptedDate.millisecondsSinceEpoch,
    };
  }
}
