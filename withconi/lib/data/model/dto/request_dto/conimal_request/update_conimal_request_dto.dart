import 'package:withconi/data/model/dto/request_dto/abstract_request/request_dto_abstract.dart';
import 'package:withconi/data/model/dto/request_dto/abstract_request/request_info_abstract.dart';
import 'package:withconi/module/ui_model/conimal_ui_model.dart';
import '../../../../../core/network_handling/network_service.dart';
import '../../../../../core/tools/api_url.dart';
import '../../../../enums/enum.dart';

class UpdateConimalRequestDTO
    extends RequestConverter<UpdateConimalRequestDTO, ConimalUIModel>
    implements RequestDTO {
  final String name;
  final Species species;
  final Gender gender;
  final DateTime birthDate;
  final DateTime adoptedDate;
  final List<String> diseaseIdList;
  final String breed;

  @override
  bool get requiresToken => true;

  @override
  RequestType get requestType => RequestType.POST;

  @override
  String get url => HttpUrl.CONIMAL_UPDATE;

  UpdateConimalRequestDTO.fromData({required ConimalUIModel data})
      : adoptedDate = data.adoptedDate!,
        birthDate = data.birthDate!,
        breed = data.breed,
        diseaseIdList = data.diseases.map((e) => e.diseaseId).toList(),
        gender = data.gender!,
        name = data.name,
        species = data.species!,
        super.fromData(data);

  @override
  Map<String, dynamic> get dataMap {
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
