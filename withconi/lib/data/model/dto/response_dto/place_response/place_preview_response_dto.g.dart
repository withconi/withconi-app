// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'place_preview_response_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$PharmacyPreviewResponseDTO _$$PharmacyPreviewResponseDTOFromJson(
        Map<String, dynamic> json) =>
    _$PharmacyPreviewResponseDTO(
      placeId: json['_id'] as String,
      address: json['address'] as String,
      visitVerified: json['isVisitVerified'] as bool,
      isBookmarked: json['isBookmarked'] as bool,
      coordinate: LatLngResponseDTO.fromJson(
          json['coordinate'] as Map<String, dynamic>),
      phone: json['phone'] as String,
      name: json['name'] as String,
      openingStatus: $enumDecode(_$OpeningStatusEnumMap, json['openingStatus']),
      thumbnail: json['thumbnail'] as String? ?? '',
      placeType: $enumDecode(_$PlaceTypeEnumMap, json['locType']),
      mostVisitedDiseaseType: $enumDecodeNullable(
              _$DiseaseTypeEnumMap, json['mostVisitedDiseaseType']) ??
          DiseaseType.brainNeurology,
      totalReviews: json['totalReviews'] as int,
      $type: json['runtimeType'] as String?,
    );

Map<String, dynamic> _$$PharmacyPreviewResponseDTOToJson(
        _$PharmacyPreviewResponseDTO instance) =>
    <String, dynamic>{
      '_id': instance.placeId,
      'address': instance.address,
      'isVisitVerified': instance.visitVerified,
      'isBookmarked': instance.isBookmarked,
      'coordinate': instance.coordinate.toJson(),
      'phone': instance.phone,
      'name': instance.name,
      'openingStatus': _$OpeningStatusEnumMap[instance.openingStatus]!,
      'thumbnail': instance.thumbnail,
      'locType': _$PlaceTypeEnumMap[instance.placeType]!,
      'mostVisitedDiseaseType':
          _$DiseaseTypeEnumMap[instance.mostVisitedDiseaseType]!,
      'totalReviews': instance.totalReviews,
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

const _$DiseaseTypeEnumMap = {
  DiseaseType.all: '',
  DiseaseType.cardiovacular: 'cardiovacular',
  DiseaseType.musculoskeletal: 'musculoskeletal',
  DiseaseType.digestive: 'digestive',
  DiseaseType.ophthalmology: 'ophthalmology',
  DiseaseType.urinary: 'urinary',
  DiseaseType.respiratory: 'respiratory',
  DiseaseType.otorhinolaryngology: 'otorhinolaryngology',
  DiseaseType.infectiousDisease: 'infectiousDisease',
  DiseaseType.brainNeurology: 'brainNeurology',
  DiseaseType.dentistry: 'dentistry',
  DiseaseType.oncology: 'oncology',
  DiseaseType.dermatology: 'dermatology',
  DiseaseType.endocrinology: 'endocrinology',
  DiseaseType.emergency: 'emergency',
  DiseaseType.undefined: 'undefined',
};

_$HospitalPreviewResponseDTO _$$HospitalPreviewResponseDTOFromJson(
        Map<String, dynamic> json) =>
    _$HospitalPreviewResponseDTO(
      placeId: json['_id'] as String,
      address: json['address'] as String,
      visitVerified: json['isVisitVerified'] as bool,
      isBookmarked: json['isBookmarked'] as bool,
      coordinate: LatLngResponseDTO.fromJson(
          json['coordinate'] as Map<String, dynamic>),
      phone: json['phone'] as String,
      name: json['name'] as String,
      openingStatus: $enumDecode(_$OpeningStatusEnumMap, json['openingStatus']),
      thumbnail: json['thumbnail'] as String? ?? '',
      placeType: $enumDecode(_$PlaceTypeEnumMap, json['locType']),
      mostVisitedDiseaseType: $enumDecodeNullable(
              _$DiseaseTypeEnumMap, json['mostVisitedDiseaseType']) ??
          DiseaseType.brainNeurology,
      totalReviews: json['totalReviews'] as int,
      $type: json['runtimeType'] as String?,
    );

Map<String, dynamic> _$$HospitalPreviewResponseDTOToJson(
        _$HospitalPreviewResponseDTO instance) =>
    <String, dynamic>{
      '_id': instance.placeId,
      'address': instance.address,
      'isVisitVerified': instance.visitVerified,
      'isBookmarked': instance.isBookmarked,
      'coordinate': instance.coordinate,
      'phone': instance.phone,
      'name': instance.name,
      'openingStatus': _$OpeningStatusEnumMap[instance.openingStatus]!,
      'thumbnail': instance.thumbnail,
      'locType': _$PlaceTypeEnumMap[instance.placeType]!,
      'mostVisitedDiseaseType':
          _$DiseaseTypeEnumMap[instance.mostVisitedDiseaseType]!,
      'totalReviews': instance.totalReviews,
      'runtimeType': instance.$type,
    };
