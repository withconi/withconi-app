// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'hospital_detail_response_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_HospitalDetailResponseDTO _$$_HospitalDetailResponseDTOFromJson(
        Map<String, dynamic> json) =>
    _$_HospitalDetailResponseDTO(
      locId: json['locId'] as String,
      address: json['address'] as String,
      visitVerified: json['visitVerified'] as bool,
      isBookmarked: json['isBookmarked'] as bool,
      diseaseHistoryGroup: DiseaseHistoryGroupResponseDTO.fromJson(
          json['diseaseHistoryGroup'] as Map<String, dynamic>),
      reviewHistoryGroup: ReviewHistoryGroupResponseDTO.fromJson(
          json['reviewHistoryGroup'] as Map<String, dynamic>),
      coordinate: LatLngResponseDTO.fromJson(
          json['coordinate'] as Map<String, dynamic>),
      phone: json['phone'] as String,
      name: json['name'] as String,
      openingStatus: $enumDecode(_$OpeningStatusEnumMap, json['openingStatus']),
      thumbnail: json['thumbnail'] as String,
      placeType: $enumDecode(_$PlaceTypeEnumMap, json['placeType']),
      totalVisitingCats: json['totalVisitingCats'] as int,
      totalVisitingDogs: json['totalVisitingDogs'] as int,
    );

Map<String, dynamic> _$$_HospitalDetailResponseDTOToJson(
        _$_HospitalDetailResponseDTO instance) =>
    <String, dynamic>{
      'locId': instance.locId,
      'address': instance.address,
      'visitVerified': instance.visitVerified,
      'isBookmarked': instance.isBookmarked,
      'diseaseHistoryGroup': instance.diseaseHistoryGroup.toJson(),
      'reviewHistoryGroup': instance.reviewHistoryGroup.toJson(),
      'coordinate': instance.coordinate.toJson(),
      'phone': instance.phone,
      'name': instance.name,
      'openingStatus': _$OpeningStatusEnumMap[instance.openingStatus]!,
      'thumbnail': instance.thumbnail,
      'placeType': _$PlaceTypeEnumMap[instance.placeType]!,
      'totalVisitingCats': instance.totalVisitingCats,
      'totalVisitingDogs': instance.totalVisitingDogs,
    };

const _$OpeningStatusEnumMap = {
  OpeningStatus.open: 'open',
  OpeningStatus.all: 'all',
  OpeningStatus.closed: 'closed',
};

const _$PlaceTypeEnumMap = {
  PlaceType.all: 'all',
  PlaceType.hospital: 'hospital',
  PlaceType.pharmacy: 'pharmacy',
};
