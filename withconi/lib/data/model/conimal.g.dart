// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'conimal.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Conimal _$$_ConimalFromJson(Map<String, dynamic> json) => _$_Conimal(
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

Map<String, dynamic> _$$_ConimalToJson(_$_Conimal instance) =>
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
  Species.cat: 'cat',
  Species.dog: 'dog',
  Species.all: 'all',
  Species.undefined: 'undefined',
};

const _$GenderEnumMap = {
  Gender.female: 'female',
  Gender.male: 'male',
};
