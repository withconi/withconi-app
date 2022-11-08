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

class GetPlacePreviewRequestDTO extends RequestConverter<
    GetPlacePreviewRequestDTO,
    Tuple2<String, PlaceType>> implements RequestDTO {
  final String _placeId;
  final PlaceType _placeType;

  @override
  bool get requiresToken => true;

  @override
  RequestType get requestType => RequestType.GET;

  @override
  String get url => HttpUrl.MAP_GET_VERIFICATION;

  GetPlacePreviewRequestDTO.fromData(
      {required String placeId, required PlaceType placeType})
      : _placeId = placeId,
        _placeType = placeType,
        super.fromData(Tuple2(placeId, placeType));

  @override
  Map<String, dynamic> get dataMap =>
      {'locId': _placeId, 'locType': _placeType};
}
