// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'board_response_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_BoardResponseDTO _$$_BoardResponseDTOFromJson(Map<String, dynamic> json) =>
    _$_BoardResponseDTO(
      id: json['id'] as String,
      name: json['name'] as String,
      diseaseType:
          $enumDecodeNullable(_$DiseaseTypeEnumMap, json['diseaseType']) ??
              DiseaseType.undefined,
    );

Map<String, dynamic> _$$_BoardResponseDTOToJson(_$_BoardResponseDTO instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'diseaseType': _$DiseaseTypeEnumMap[instance.diseaseType]!,
    };

const _$DiseaseTypeEnumMap = {
  DiseaseType.all: 'all',
  DiseaseType.oncology: 'oncology',
  DiseaseType.endocrinology: 'endocrinology',
  DiseaseType.urinary: 'urinary',
  DiseaseType.cardiovacular: 'cardiovacular',
  DiseaseType.digestive: 'digestive',
  DiseaseType.infectiousDisease: 'infectiousDisease',
  DiseaseType.musculoskeletal: 'musculoskeletal',
  DiseaseType.brainNeurology: 'brainNeurology',
  DiseaseType.dermatology: 'dermatology',
  DiseaseType.otorhinolaryngology: 'otorhinolaryngology',
  DiseaseType.respiratory: 'respiratory',
  DiseaseType.dentistry: 'dentistry',
  DiseaseType.ophthalmology: 'ophthalmology',
  DiseaseType.emergency: 'emergency',
  DiseaseType.undefined: '',
};
