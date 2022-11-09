// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'post_response_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_PostResponseDTO _$$_PostResponseDTOFromJson(Map<String, dynamic> json) =>
    _$_PostResponseDTO(
      boardId: json['boardId'] as String,
      postId: json['postId'] as String? ?? '',
      authorId: json['authorId'] as String,
      nickname: json['nickname'] as String,
      postType: $enumDecode(_$PostTypeEnumMap, json['postType']),
      diseaseType: $enumDecode(_$DiseaseTypeEnumMap, json['diseaseType']),
      content: json['content'] as String,
      images: const ImageItemConverter().fromJson(json['images'] as Null),
      createdAt: const DateTimeConverter().fromJson(json['createdAt'] as int),
      isLike: json['isLike'] as bool? ?? false,
      likeNum: json['likeNum'] as int? ?? 12,
      commentNum: json['commentNum'] as int? ?? 3,
    );

Map<String, dynamic> _$$_PostResponseDTOToJson(_$_PostResponseDTO instance) =>
    <String, dynamic>{
      'boardId': instance.boardId,
      'postId': instance.postId,
      'authorId': instance.authorId,
      'nickname': instance.nickname,
      'postType': _$PostTypeEnumMap[instance.postType]!,
      'diseaseType': _$DiseaseTypeEnumMap[instance.diseaseType]!,
      'content': instance.content,
      'images': const ImageItemConverter().toJson(instance.images),
      'createdAt': const DateTimeConverter().toJson(instance.createdAt),
      'isLike': instance.isLike,
      'likeNum': instance.likeNum,
      'commentNum': instance.commentNum,
    };

const _$PostTypeEnumMap = {
  PostType.all: 'all',
  PostType.cat: 'cat',
  PostType.dog: 'dog',
};

const _$DiseaseTypeEnumMap = {
  DiseaseType.all: 'all',
  DiseaseType.cardiovascular: 'cardiovascular',
  DiseaseType.musculoskeletal: 'musculoskeletal',
  DiseaseType.digestive: 'digestive',
  DiseaseType.ophthalmology: 'ophthalmology',
  DiseaseType.urinary: 'urinary',
  DiseaseType.respiratory: 'respiratory',
  DiseaseType.otorhinolaryngology: 'otorhinolaryngology',
  DiseaseType.infectiousDisease: 'infectiousDisease',
  DiseaseType.brainNeurology: 'brainNeurology',
  DiseaseType.dentistry: 'dentistry',
  DiseaseType.oncology: 'oncology',
  DiseaseType.dermatology: 'dermatology',
  DiseaseType.endocrinology: 'endocrinology',
  DiseaseType.emergency: 'emergency',
};
