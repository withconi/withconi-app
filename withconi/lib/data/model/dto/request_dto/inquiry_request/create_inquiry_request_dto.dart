import 'package:withconi/core/network_handling/network_service.dart';
import 'package:withconi/core/tools/api_url.dart';
import 'package:withconi/data/enums/enum.dart';
import 'package:withconi/data/model/dto/request_dto/abstract_request/request_info_abstract.dart';

import '../abstract_request/request_dto_abstract.dart';

class CreateInquiryRequestDTO
    extends RequestConverter<CreateInquiryRequestDTO, Null>
    implements RequestDTO {
  final InquiryItem _inquiryItem;
  final String _inquiryDesc;

  @override
  bool get requiresToken => true;

  @override
  RequestType get requestType => RequestType.POST;

  @override
  String get url => HttpUrl.INQUIRY_CREATE;

  CreateInquiryRequestDTO.fromData(this._inquiryItem, this._inquiryDesc)
      : super.fromData(null);

  @override
  Map<String, dynamic> get dataMap =>
      {"suggestionItems": _inquiryItem.code, "suggestionDesc": _inquiryDesc};
}
