// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'disease_common_list_response_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_DiseaseCommonListResponseDTO _$$_DiseaseCommonListResponseDTOFromJson(
        Map<String, dynamic> json) =>
    _$_DiseaseCommonListResponseDTO(
      catDiseaseList: (json['cat'] as List<dynamic>?)
              ?.map(
                  (e) => DiseaseResponseDTO.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
      dogDiseaseList: (json['dog'] as List<dynamic>?)
              ?.map(
                  (e) => DiseaseResponseDTO.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
    );

Map<String, dynamic> _$$_DiseaseCommonListResponseDTOToJson(
        _$_DiseaseCommonListResponseDTO instance) =>
    <String, dynamic>{
      'cat': instance.catDiseaseList.map((e) => e.toJson()).toList(),
      'dog': instance.dogDiseaseList.map((e) => e.toJson()).toList(),
    };
