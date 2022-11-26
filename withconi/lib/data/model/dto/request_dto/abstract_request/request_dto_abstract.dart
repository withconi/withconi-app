import 'package:dartz/dartz.dart';
import 'package:withconi/data/model/dto/api_call_dto.dart';
import 'package:withconi/data/model/dto/request_dto/abstract_request/request_info_abstract.dart';
import 'package:withconi/module/ui_model/ui_model_abstract/ui_model.dart';

import '../../../../../core/network_handling/network_service.dart';
import '../../../../../core/tools/api_url.dart';
import 'request_info_abstract.dart';

abstract class RequestConverter<DTO, DATA> {
  RequestConverter.fromData(DATA data);
}
