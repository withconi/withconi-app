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
  final PaginationFilter paginationFilter;
  final String? keyword;
  final PlaceType? locType;
  final Species? speciesType;
  final OpeningStatus? openingStatus;
  final LatLngUIModel _baseLatLng;
  final DiseaseType? diseaseType;
  final double distance;

  @override
  bool get requiresToken => true;

  @override
  RequestType get requestType => RequestType.GET;

  @override
  String get url => HttpUrl.PLACE_PREVIEW_LIST;

  GetPlacePreviewListRequestDTO.fromData(
      {required MapFilterUIModel mapFilter,
      String? keywords,
      required this.paginationFilter,
      required LatLngUIModel latlng})
      : distance = mapFilter.searchArea,
        _baseLatLng = latlng,
        diseaseType = mapFilter.diseaseType,
        speciesType = mapFilter.speciesType,
        openingStatus = mapFilter.openingStatus,
        locType = mapFilter.placeType,
        keyword = keywords,
        super.fromData(Tuple2(mapFilter, paginationFilter));

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
