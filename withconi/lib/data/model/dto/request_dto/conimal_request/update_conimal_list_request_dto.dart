import 'package:dartz/dartz.dart';
import 'package:withconi/core/network_handling/network_service.dart';
import 'package:withconi/core/tools/api_url.dart';
import 'package:withconi/data/model/dto/request_dto/abstract_request/request_info_abstract.dart';
import 'package:withconi/data/model/dto/request_dto/conimal_request/create_conimal_request_dto.dart';
import 'package:withconi/module/ui_model/conimal_ui_model.dart';
import 'package:withconi/module/ui_model/user_ui_model.dart';
import '../../../../enums/enum.dart';
import '../abstract_request/request_dto_abstract.dart';

class UpdateConimalListRequestDTO
    extends RequestConverter<UpdateConimalListRequestDTO, List<ConimalUIModel>>
    implements RequestDTO {
  final List<ConimalUIModel> _conimalList;
  @override
  bool get requiresToken => true;

  @override
  RequestType get requestType => RequestType.POST;

  @override
  String get url => HttpUrl.USER_UPDATE;

  UpdateConimalListRequestDTO.fromData(
      {required List<ConimalUIModel> conimalList})
      : _conimalList = conimalList,
        super.fromData(conimalList);

  @override
  Map<String, dynamic> get dataMap {
    return {
      'conimals': _conimalList
          .map((e) => CreateConimalRequestDTO.fromData(data: e).dataMap)
          .toList()
    };
  }
}
