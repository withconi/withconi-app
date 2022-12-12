// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'post_response_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_PostResponseDTO _$$_PostResponseDTOFromJson(Map<String, dynamic> json) =>
    _$_PostResponseDTO(
      profileImageUrl: json['profileImageUrl'] as String? ?? '',
      boardId: json['boardId'] as String,
      postId: json['_id'] as String,
      authorId: json['authorId'] as String,
      nickname: json['nickname'] as String? ?? '알수없음',
      postType: $enumDecodeNullable(_$PostTypeEnumMap, json['postType']) ??
          PostType.cat,
      diseaseType:
          $enumDecodeNullable(_$DiseaseTypeEnumMap, json['diseaseType']) ??
              DiseaseType.dentistry,
      content: json['content'] as String,
      createdAt: const DateTimeConverter().fromJson(json['createdAt'] as int),
      isLike: json['isLike'] as bool? ?? false,
      likeNum: json['totalLike'] as int? ?? 0,
      commentNum: json['totalComment'] as int? ?? 0,
      images: json['postImageUrls'] == null
          ? const []
          : const ImageItemConverter().fromJson(json['postImageUrls'] as List),
    );

Map<String, dynamic> _$$_PostResponseDTOToJson(_$_PostResponseDTO instance) =>
    <String, dynamic>{
      'profileImageUrl': instance.profileImageUrl,
      'boardId': instance.boardId,
      '_id': instance.postId,
      'authorId': instance.authorId,
      'nickname': instance.nickname,
      'postType': _$PostTypeEnumMap[instance.postType]!,
      'diseaseType': _$DiseaseTypeEnumMap[instance.diseaseType]!,
      'content': instance.content,
      'createdAt': const DateTimeConverter().toJson(instance.createdAt),
      'isLike': instance.isLike,
      'totalLike': instance.likeNum,
      'totalComment': instance.commentNum,
      'postImageUrls': const ImageItemConverter().toJson(instance.images),
    };

const _$PostTypeEnumMap = {
  PostType.all: 'all',
  PostType.cat: 'cat',
  PostType.dog: 'dog',
};

const _$DiseaseTypeEnumMap = {
  DiseaseType.all: 'all',
  DiseaseType.oncology: 'oncology',
  DiseaseType.endocrinology: 'endocrinology',
  DiseaseType.urinary: 'urinary',
  DiseaseType.cardiovacular: 'cardiovacular',
  DiseaseType.digestive: 'digestive',
  DiseaseType.infectiousDisease: 'infectiousDisease',
  DiseaseType.musculoskeletal: 'musculoskeletal',
  DiseaseType.brainNeurology: 'brainNeurology',
  DiseaseType.dermatology: 'dermatology',
  DiseaseType.otorhinolaryngology: 'otorhinolaryngology',
  DiseaseType.respiratory: 'respiratory',
  DiseaseType.dentistry: 'dentistry',
  DiseaseType.ophthalmology: 'ophthalmology',
  DiseaseType.emergency: 'emergency',
  DiseaseType.undefined: '',
};
