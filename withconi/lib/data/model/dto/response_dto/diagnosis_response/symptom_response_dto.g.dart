// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'symptom_response_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_SymptomResponseDTO _$$_SymptomResponseDTOFromJson(
        Map<String, dynamic> json) =>
    _$_SymptomResponseDTO(
      categoryName: $enumDecode(_$SymptomEnumMap, json['categoryName']),
      symptomList:
          (json['list'] as List<dynamic>).map((e) => e as String).toList(),
    );

Map<String, dynamic> _$$_SymptomResponseDTOToJson(
        _$_SymptomResponseDTO instance) =>
    <String, dynamic>{
      'categoryName': _$SymptomEnumMap[instance.categoryName]!,
      'list': instance.symptomList,
    };

const _$SymptomEnumMap = {
  Symptom.action: '행동변화',
  Symptom.bone: '근골격',
  Symptom.eat: '섭취이상',
  Symptom.eye: '눈',
  Symptom.lung: '호흡기',
  Symptom.mouth: '구강',
  Symptom.nerve: '신경이상',
  Symptom.stomach: '복부',
  Symptom.skin: '피부',
  Symptom.urinary: '생식비뇨',
};
