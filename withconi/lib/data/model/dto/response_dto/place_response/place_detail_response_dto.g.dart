// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'place_detail_response_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$HospitalPlaceDetailResponseDTO _$$HospitalPlaceDetailResponseDTOFromJson(
        Map<String, dynamic> json) =>
    _$HospitalPlaceDetailResponseDTO(
      placeId: json['_id'] as String,
      address: json['address'] as String,
      isBookmarked: json['isBookmarked'] as bool? ?? false,
      diseaseHistory: DiseaseHistoryListResponseDTO.fromJson(
          json['diseaseHistory'] as Map<String, dynamic>),
      reviewHistory: const ReviewHistoryConverter()
          .fromJson(json['reviewHistory'] as Map<String, dynamic>),
      coordinate: json['coordinate'] == null
          ? null
          : LatLngResponseDTO.fromJson(
              json['coordinate'] as Map<String, dynamic>),
      phone: json['phone'] as String,
      name: json['name'] as String,
      openingStatus: $enumDecode(_$OpeningStatusEnumMap, json['openingStatus']),
      thumbnail: json['thumbnail'] as String? ?? '',
      placeType: $enumDecode(_$PlaceTypeEnumMap, json['locType']),
      totalVisitingCats: json['totalVisitingCats'] as int,
      totalVisitingDogs: json['totalVisitingDogs'] as int,
      $type: json['runtimeType'] as String?,
    );

Map<String, dynamic> _$$HospitalPlaceDetailResponseDTOToJson(
        _$HospitalPlaceDetailResponseDTO instance) =>
    <String, dynamic>{
      '_id': instance.placeId,
      'address': instance.address,
      'isBookmarked': instance.isBookmarked,
      'diseaseHistory': instance.diseaseHistory.toJson(),
      'reviewHistory':
          const ReviewHistoryConverter().toJson(instance.reviewHistory),
      'coordinate': instance.coordinate?.toJson(),
      'phone': instance.phone,
      'name': instance.name,
      'openingStatus': _$OpeningStatusEnumMap[instance.openingStatus]!,
      'thumbnail': instance.thumbnail,
      'locType': _$PlaceTypeEnumMap[instance.placeType]!,
      'totalVisitingCats': instance.totalVisitingCats,
      'totalVisitingDogs': instance.totalVisitingDogs,
      'runtimeType': instance.$type,
    };

const _$OpeningStatusEnumMap = {
  OpeningStatus.open: 'open',
  OpeningStatus.all: null,
  OpeningStatus.closed: 'closed',
};

const _$PlaceTypeEnumMap = {
  PlaceType.all: 'all',
  PlaceType.hospital: 'hospital',
  PlaceType.pharmacy: 'pharmacy',
};

_$PharmacyPlaceDetailResponseDTO _$$PharmacyPlaceDetailResponseDTOFromJson(
        Map<String, dynamic> json) =>
    _$PharmacyPlaceDetailResponseDTO(
      placeId: json['_id'] as String,
      address: json['address'] as String,
      isBookmarked: json['isBookmarked'] as bool? ?? false,
      diseaseHistory: DiseaseHistoryListResponseDTO.fromJson(
          json['diseaseHistory'] as Map<String, dynamic>),
      reviewHistory: const ReviewHistoryConverter()
          .fromJson(json['reviewHistory'] as Map<String, dynamic>),
      coordinate: json['coordinate'] == null
          ? null
          : LatLngResponseDTO.fromJson(
              json['coordinate'] as Map<String, dynamic>),
      phone: json['phone'] as String,
      name: json['name'] as String,
      openingStatus: $enumDecode(_$OpeningStatusEnumMap, json['openingStatus']),
      thumbnail: json['thumbnail'] as String? ?? '',
      placeType: $enumDecode(_$PlaceTypeEnumMap, json['locType']),
      totalVisitingCats: json['totalVisitingCats'] as int,
      totalVisitingDogs: json['totalVisitingDogs'] as int,
      $type: json['runtimeType'] as String?,
    );

Map<String, dynamic> _$$PharmacyPlaceDetailResponseDTOToJson(
        _$PharmacyPlaceDetailResponseDTO instance) =>
    <String, dynamic>{
      '_id': instance.placeId,
      'address': instance.address,
      'isBookmarked': instance.isBookmarked,
      'diseaseHistory': instance.diseaseHistory,
      'reviewHistory':
          const ReviewHistoryConverter().toJson(instance.reviewHistory),
      'coordinate': instance.coordinate,
      'phone': instance.phone,
      'name': instance.name,
      'openingStatus': _$OpeningStatusEnumMap[instance.openingStatus]!,
      'thumbnail': instance.thumbnail,
      'locType': _$PlaceTypeEnumMap[instance.placeType]!,
      'totalVisitingCats': instance.totalVisitingCats,
      'totalVisitingDogs': instance.totalVisitingDogs,
      'runtimeType': instance.$type,
    };
