// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'conimal.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ConimalModel _$ConimalModelFromJson(Map<String, dynamic> json) => ConimalModel(
      birthDate: json['birthDate'] as int,
      name: json['name'] as String,
      adoptedDate: json['adoptedDate'] as int,
      diseases: (json['diseases'] as List<dynamic>)
          .map((e) => DiseaseModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      createdAt: json['createdAt'] as int,
    );

Map<String, dynamic> _$ConimalModelToJson(ConimalModel instance) =>
    <String, dynamic>{
      'birthDate': instance.birthDate,
      'name': instance.name,
      'adoptedDate': instance.adoptedDate,
      'diseases': instance.diseases.map((e) => e.toJson()).toList(),
      'createdAt': instance.createdAt,
    };
