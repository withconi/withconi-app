// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'disease.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DiseaseModel _$DiseaseModelFromJson(Map<String, dynamic> json) => DiseaseModel(
      createdAt: json['createdAt'] as int,
      code: json['code'] as String,
      name: json['name'] as String,
      symptoms:
          (json['symptoms'] as List<dynamic>).map((e) => e as String).toList(),
      description: json['description'] as String,
    );

Map<String, dynamic> _$DiseaseModelToJson(DiseaseModel instance) =>
    <String, dynamic>{
      'code': instance.code,
      'name': instance.name,
      'symptoms': instance.symptoms,
      'description': instance.description,
      'createdAt': instance.createdAt,
    };
