// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'disease.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Disease _$$_DiseaseFromJson(Map<String, dynamic> json) => _$_Disease(
      createdAt: const DateTimeConverter().fromJson(json['createdAt'] as int),
      code: json['code'] as String,
      name: json['name'] as String,
      symptoms:
          (json['symptoms'] as List<dynamic>).map((e) => e as String).toList(),
      description: json['description'] as String,
    );

Map<String, dynamic> _$$_DiseaseToJson(_$_Disease instance) =>
    <String, dynamic>{
      'createdAt': const DateTimeConverter().toJson(instance.createdAt),
      'code': instance.code,
      'name': instance.name,
      'symptoms': instance.symptoms,
      'description': instance.description,
    };
