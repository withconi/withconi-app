// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'hospital_preview_response_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_HospitalPreviewResponseDTO _$$_HospitalPreviewResponseDTOFromJson(
        Map<String, dynamic> json) =>
    _$_HospitalPreviewResponseDTO(
      locId: json['locId'] as String,
      address: json['address'] as String,
      visitVerified: json['visitVerified'] as bool,
      isBookmarked: json['isBookmarked'] as bool,
      coordinate: LatLngResponseDTO.fromJson(
          json['coordinate'] as Map<String, dynamic>),
      phone: json['phone'] as String,
      name: json['name'] as String,
      openingStatus: $enumDecode(_$OpeningStatusEnumMap, json['openingStatus']),
      thumbnail: json['thumbnail'] as String,
      placeType: $enumDecode(_$PlaceTypeEnumMap, json['placeType']),
      mostVisitedDiseaseType:
          $enumDecode(_$DiseaseTypeEnumMap, json['mostVisitedDiseaseType']),
      totalReviews: json['totalReviews'] as int,
    );

Map<String, dynamic> _$$_HospitalPreviewResponseDTOToJson(
        _$_HospitalPreviewResponseDTO instance) =>
    <String, dynamic>{
      'locId': instance.locId,
      'address': instance.address,
      'visitVerified': instance.visitVerified,
      'isBookmarked': instance.isBookmarked,
      'coordinate': instance.coordinate.toJson(),
      'phone': instance.phone,
      'name': instance.name,
      'openingStatus': _$OpeningStatusEnumMap[instance.openingStatus]!,
      'thumbnail': instance.thumbnail,
      'placeType': _$PlaceTypeEnumMap[instance.placeType]!,
      'mostVisitedDiseaseType':
          _$DiseaseTypeEnumMap[instance.mostVisitedDiseaseType]!,
      'totalReviews': instance.totalReviews,
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

const _$DiseaseTypeEnumMap = {
  DiseaseType.all: 'all',
  DiseaseType.cardiovascular: 'cardiovascular',
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
};
