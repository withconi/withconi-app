import 'package:withconi/data/model/dto/request_dto/abstract_request/request_dto_abstract.dart';
import 'package:withconi/data/model/dto/request_dto/abstract_request/request_info_abstract.dart';

import '../../../../../core/network_handling/network_service.dart';
import '../../../../../core/tools/api_url.dart';

class DeleteConimalRequestDTO
    extends RequestConverter<DeleteConimalRequestDTO, String>
    implements RequestDTO {
  final String conimalId;

  @override
  bool get requiresToken => true;

  @override
  RequestType get requestType => RequestType.POST;

  @override
  String get url => HttpUrl.CONIMAL_UPDATE;

  DeleteConimalRequestDTO.fromData({required this.conimalId})
      : super.fromData(conimalId);

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
    return {
      'conimalId': conimalId,
    };
  }
}
