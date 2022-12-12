// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'conimal_response_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_ConimalResponseDTO _$$_ConimalResponseDTOFromJson(
        Map<String, dynamic> json) =>
    _$_ConimalResponseDTO(
      conimalId: json['_id'] as String,
      name: json['name'] as String,
      species: $enumDecode(_$SpeciesEnumMap, json['species']),
      gender: $enumDecode(_$GenderEnumMap, json['gender']),
      isNeutralized: json['isNeutralized'] as bool? ?? false,
      breed: json['speciesName'] as String? ?? 'breed',
      userId: json['userId'] as String? ?? '',
      birthDate: const DateTimeConverter().fromJson(json['birthDate'] as int),
      adoptedDate:
          const DateTimeConverter().fromJson(json['adoptedDate'] as int),
      diseases: (json['diseases'] as List<dynamic>?)
              ?.map(
                  (e) => DiseaseResponseDTO.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
    );

Map<String, dynamic> _$$_ConimalResponseDTOToJson(
        _$_ConimalResponseDTO instance) =>
    <String, dynamic>{
      '_id': instance.conimalId,
      'name': instance.name,
      'species': _$SpeciesEnumMap[instance.species]!,
      'gender': _$GenderEnumMap[instance.gender]!,
      'isNeutralized': instance.isNeutralized,
      'speciesName': instance.breed,
      'userId': instance.userId,
      'birthDate': const DateTimeConverter().toJson(instance.birthDate),
      'adoptedDate': const DateTimeConverter().toJson(instance.adoptedDate),
      'diseases': instance.diseases.map((e) => e.toJson()).toList(),
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
