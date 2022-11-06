// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'conimal_response_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_ConimalResponseDTO _$$_ConimalResponseDTOFromJson(
        Map<String, dynamic> json) =>
    _$_ConimalResponseDTO(
      conimalId: json['conimalId'] as String,
      name: json['name'] as String,
      species: $enumDecode(_$SpeciesEnumMap, json['species']),
      gender: $enumDecode(_$GenderEnumMap, json['gender']),
      userId: json['userId'] as String? ?? '',
      birthDate: const DateTimeConverter().fromJson(json['birthDate'] as int),
      adoptedDate:
          const DateTimeConverter().fromJson(json['adoptedDate'] as int),
      diseases: json['diseases'] == null
          ? const []
          : const DiseaseIdConverter().fromJson(json['diseases'] as List),
    );

Map<String, dynamic> _$$_ConimalResponseDTOToJson(
        _$_ConimalResponseDTO instance) =>
    <String, dynamic>{
      'conimalId': instance.conimalId,
      'name': instance.name,
      'species': _$SpeciesEnumMap[instance.species]!,
      'gender': _$GenderEnumMap[instance.gender]!,
      'userId': instance.userId,
      'birthDate': const DateTimeConverter().toJson(instance.birthDate),
      'adoptedDate': const DateTimeConverter().toJson(instance.adoptedDate),
      'diseases': const DiseaseIdConverter().toJson(instance.diseases),
    };

const _$SpeciesEnumMap = {
  Species.all: 'all',
  Species.cat: 'cat',
  Species.dog: 'dog',
};

const _$GenderEnumMap = {
  Gender.female: 'female',
  Gender.male: 'male',
};
