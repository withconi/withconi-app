import 'package:withconi/configs/constants/enum.dart';
import 'package:withconi/controller/ui_helper/infinite_scroll.dart';
import 'package:withconi/ui/ui_model/location.dart';

import '../comment.dart';
import '../conimal.dart';

class MapFilterRequest {
  MapFilterRequest({
    required this.paginationFilter,
    required this.latLng,
    this.keyword,
    this.locType,
    this.openingStatus,
    this.diseaseType,
    this.speciesType,
    required this.distance,
  });

  PaginationFilter paginationFilter;
  String? keyword;
  PlaceType? locType;
  Species? speciesType;
  OpeningStatus? openingStatus;
  LatLngClass latLng;
  DiseaseType? diseaseType;
  int distance;

  Map<String, dynamic> toJson() => {
        'page': paginationFilter.page,
        'listSize': paginationFilter.limit,
        'keyword': keyword,
        'locType': locType?.code,
        'filterByDisease': diseaseType?.code,
        'filterBySpecies': speciesType?.code,
        'filterByOpeningStatus': openingStatus?.code,
        'lat': latLng.latitude,
        'lng': latLng.longitude,
        'distance': distance,
      };
}

class CommentCreateRequest {
  CommentCreateRequest({required this.comment});

  Comment comment;

  Map<String, dynamic> toJson() => {
        "userId": comment.authorId,
        "boardId": comment.boardId,
        "postId": comment.postId,
        "content": comment.content
      };
}
