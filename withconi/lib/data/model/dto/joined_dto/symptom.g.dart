// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'symptom.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_SymptomGroup _$$_SymptomGroupFromJson(Map<String, dynamic> json) =>
    _$_SymptomGroup(
      symptomType: $enumDecode(_$SymptomEnumMap, json['categoryName']),
      symptomList:
          (json['list'] as List<dynamic>).map((e) => e as String).toList(),
    );

Map<String, dynamic> _$$_SymptomGroupToJson(_$_SymptomGroup instance) =>
    <String, dynamic>{
      'categoryName': _$SymptomEnumMap[instance.symptomType]!,
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
  Symptom.ect: '기타',
};
