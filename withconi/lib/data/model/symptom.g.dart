// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'symptom.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_SymptomGroup _$$_SymptomGroupFromJson(Map<String, dynamic> json) =>
    _$_SymptomGroup(
      symptomType: $enumDecode(_$SymptomEnumMap, json['symptomType']),
      symptomList: (json['symptomList'] as List<dynamic>)
          .map((e) => e as String)
          .toList(),
    );

Map<String, dynamic> _$$_SymptomGroupToJson(_$_SymptomGroup instance) =>
    <String, dynamic>{
      'symptomType': _$SymptomEnumMap[instance.symptomType]!,
      'symptomList': instance.symptomList,
    };

const _$SymptomEnumMap = {
  Symptom.action: 'action',
  Symptom.bone: 'bone',
  Symptom.eat: 'eat',
  Symptom.eye: 'eye',
  Symptom.lung: 'lung',
  Symptom.mouth: 'mouth',
  Symptom.nerve: 'nerve',
  Symptom.stomach: 'stomach',
  Symptom.urinary: 'urinary',
};
