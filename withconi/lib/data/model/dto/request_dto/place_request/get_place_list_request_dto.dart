import 'package:dartz/dartz.dart';
import 'package:withconi/core/network_handling/network_service.dart';
import 'package:withconi/core/tools/api_url.dart';
import 'package:withconi/data/model/dto/request_dto/abstract_request/request_info_abstract.dart';
import '../../../../../core/tools/helpers/infinite_scroll.dart';
import '../../../../../module/ui_model/map_filter_ui_model.dart';
import '../../../../enums/enum.dart';
import '../../../../../module/ui_model/latlng_ui_model.dart';
import '../abstract_request/request_dto_abstract.dart';

class GetPlacePreviewListRequestDTO extends RequestConverter<
    GetPlacePreviewListRequestDTO,
    Tuple2<MapFilterUIModel, PaginationFilter>> implements RequestDTO {
  PaginationFilter paginationFilter;
  String? keyword;
  PlaceType? locType;
  Species? speciesType;
  OpeningStatus? openingStatus;
  LatLngUIModel _baseLatLng;
  DiseaseType? diseaseType;
  int distance;

  @override
  bool get requiresToken => true;

  @override
  RequestType get requestType => RequestType.GET;

  @override
  String get url => HttpUrl.PLACE_PREVIEW_LIST;

  GetPlacePreviewListRequestDTO.fromData(
      {required MapFilterUIModel data,
      required this.paginationFilter,
      required LatLngUIModel latlng})
      : distance = data.searchArea,
        _baseLatLng = latlng,
        diseaseType = data.diseaseType,
        speciesType = data.speciesType,
        openingStatus = data.openingStatus,
        locType = data.placeType,
        keyword = data.keyword,
        super.fromData(Tuple2(data, paginationFilter));

  @override
  Map<String, dynamic> get dataMap => {
        'page': paginationFilter.page,
        'listSize': paginationFilter.listSize,
        'keyword': keyword,
        'locType': locType?.code,
        'filterByDisease': diseaseType?.code,
        'filterBySpecies': speciesType?.code,
        'filterByOpeningStatus': openingStatus?.code,
        'lat': _baseLatLng.latitude,
        'lng': _baseLatLng.longitude,
        'distance': distance,
      };
}
