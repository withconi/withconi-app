import 'dart:html';
import 'package:dartz/dartz.dart';
import 'package:withconi/core/network_handling/network_service.dart';
import 'package:withconi/core/tools/api_url.dart';
import 'package:withconi/data/model/dto/api_dto/api_call_dto.dart';
import 'package:withconi/data/model/dto/request_dto/abstract_request/request_info_abstract.dart';
import '../../../../../core/tools/helpers/infinite_scroll.dart';
import '../../../../../module/ui_model/map_filter_ui_model.dart';
import '../../../../../module/ui_model/ui_model_abstract/ui_model.dart';
import '../../../../enums/enum.dart';
import '../../../../../module/ui_model/latlng_ui_model.dart';
import '../abstract_request/request_dto_abstract.dart';

class GetPlacePreviewRequestDTO
    extends RequestConverter<GetPlacePreviewRequestDTO, Tuple2<String, bool>>
    implements RequestDTO {
  final String _placeId;
  final bool _onlyVerified;

  @override
  bool get requiresToken => true;

  @override
  RequestType get requestType => RequestType.GET;

  @override
  String get url => HttpUrl.MAP_GET_PLACE_REVIEW_LIST;

  GetPlacePreviewRequestDTO.fromData(
      {required String placeId, required bool onlyVerified})
      : _placeId = placeId,
        _onlyVerified = onlyVerified,
        super.fromData(Tuple2(placeId, onlyVerified));

  @override
  Map<String, dynamic> get dataMap =>
      {'locId': _placeId, 'onlyVisitVerified': _onlyVerified};
}
