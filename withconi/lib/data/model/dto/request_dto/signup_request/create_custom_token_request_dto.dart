import 'package:withconi/data/model/dto/request_dto/abstract_request/request_dto_abstract.dart';
import 'package:withconi/data/model/dto/request_dto/abstract_request/request_info_abstract.dart';
import '../../../../../core/network_handling/network_service.dart';
import '../../../../../core/tools/api_url.dart';

class CreateCustomTokenRequestDTO
    extends RequestConverter<CreateCustomTokenRequestDTO, String>
    implements RequestDTO {
  final String _platformToken;

  @override
  bool get requiresToken => false;

  @override
  RequestType get requestType => RequestType.POST;

  @override
  String get url => HttpUrl.CUSTOM_TOKEN_GET;

  CreateCustomTokenRequestDTO.fromData({required String platformToken})
      : _platformToken = platformToken,
        super.fromData(platformToken);

  @override
  Map<String, dynamic> get dataMap {
    return {'token': _platformToken};
  }
}
