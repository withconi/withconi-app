// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'breed_list_response_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_BreedListResponseDTO _$$_BreedListResponseDTOFromJson(
        Map<String, dynamic> json) =>
    _$_BreedListResponseDTO(
      list: (json['list'] as List<dynamic>)
          .map((e) => BreedResponseDTO.fromJson(e as Map<String, dynamic>))
          .toList(),
      species: $enumDecode(_$SpeciesEnumMap, json['species']),
    );

Map<String, dynamic> _$$_BreedListResponseDTOToJson(
        _$_BreedListResponseDTO instance) =>
    <String, dynamic>{
      'list': instance.list.map((e) => e.toJson()).toList(),
      'species': _$SpeciesEnumMap[instance.species]!,
    };

const _$SpeciesEnumMap = {
  Species.all: 'all',
  Species.cat: 'cat',
  Species.dog: 'dog',
};
