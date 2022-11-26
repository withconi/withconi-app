// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'post_response_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_PostResponseDTO _$$_PostResponseDTOFromJson(Map<String, dynamic> json) =>
    _$_PostResponseDTO(
      boardId: json['boardId'] as String,
      postId: json['_id'] as String,
      authorId: json['authorId'] as String,
      nickname: json['nickname'] as String? ?? '글 닉네임 없음',
      postType: $enumDecodeNullable(_$PostTypeEnumMap, json['postType']) ??
          PostType.cat,
      diseaseType:
          $enumDecodeNullable(_$DiseaseTypeEnumMap, json['diseaseType']) ??
              DiseaseType.dentistry,
      content: json['content'] as String,
      images: const ImageItemConverter().fromJson(json['images'] as Null),
      createdAt: const DateTimeConverter().fromJson(json['createdAt'] as int),
      isLike: json['isLike'] as bool? ?? false,
      likeNum: json['totalLike'] as int? ?? 0,
      commentNum: json['totalComment'] as int? ?? 0,
    );

Map<String, dynamic> _$$_PostResponseDTOToJson(_$_PostResponseDTO instance) =>
    <String, dynamic>{
      'boardId': instance.boardId,
      '_id': instance.postId,
      'authorId': instance.authorId,
      'nickname': instance.nickname,
      'postType': _$PostTypeEnumMap[instance.postType]!,
      'diseaseType': _$DiseaseTypeEnumMap[instance.diseaseType]!,
      'content': instance.content,
      'images': const ImageItemConverter().toJson(instance.images),
      'createdAt': const DateTimeConverter().toJson(instance.createdAt),
      'isLike': instance.isLike,
      'totalLike': instance.likeNum,
      'totalComment': instance.commentNum,
    };

const _$PostTypeEnumMap = {
  PostType.all: 'all',
  PostType.cat: 'cat',
  PostType.dog: 'dog',
};

const _$DiseaseTypeEnumMap = {
  DiseaseType.all: '',
  DiseaseType.cardiovacular: 'cardiovacular',
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
  DiseaseType.undefined: 'undefined',
};
