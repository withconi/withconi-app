// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'symptom_list_response_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_SymptomListResponseDTO _$$_SymptomListResponseDTOFromJson(
        Map<String, dynamic> json) =>
    _$_SymptomListResponseDTO(
      symptomGroupList: (json['list'] as List<dynamic>)
          .map((e) => SymptomGroup.fromJson(e as Map<String, dynamic>))
          .toList(),
      totalDocuments: json['totalDocuments'] as int,
      symptomList: (json['categoryList'] as List<dynamic>)
          .map((e) => $enumDecode(_$SymptomEnumMap, e))
          .toList(),
    );

Map<String, dynamic> _$$_SymptomListResponseDTOToJson(
        _$_SymptomListResponseDTO instance) =>
    <String, dynamic>{
      'list': instance.symptomGroupList.map((e) => e.toJson()).toList(),
      'totalDocuments': instance.totalDocuments,
      'categoryList':
          instance.symptomList.map((e) => _$SymptomEnumMap[e]!).toList(),
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
