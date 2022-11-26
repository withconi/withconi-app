// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'post_response_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

PostResponseDTO _$PostResponseDTOFromJson(Map<String, dynamic> json) {
  return _PostResponseDTO.fromJson(json);
}

/// @nodoc
mixin _$PostResponseDTO {
// @JsonKey(name: '_id') required String id,
  String get boardId => throw _privateConstructorUsedError;
  @JsonKey(name: '_id')
  String get postId => throw _privateConstructorUsedError;
  String get authorId => throw _privateConstructorUsedError;
  String get nickname => throw _privateConstructorUsedError;
  PostType get postType => throw _privateConstructorUsedError;
  DiseaseType get diseaseType => throw _privateConstructorUsedError;
  String get content => throw _privateConstructorUsedError;
  @ImageItemConverter()
  List<ImageItem> get images => throw _privateConstructorUsedError;
  @DateTimeConverter()
  DateTime get createdAt => throw _privateConstructorUsedError;
  bool get isLike => throw _privateConstructorUsedError;
  @JsonKey(name: 'totalLike')
  int get likeNum => throw _privateConstructorUsedError;
  @JsonKey(name: 'totalComment')
  int get commentNum => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $PostResponseDTOCopyWith<PostResponseDTO> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PostResponseDTOCopyWith<$Res> {
  factory $PostResponseDTOCopyWith(
          PostResponseDTO value, $Res Function(PostResponseDTO) then) =
      _$PostResponseDTOCopyWithImpl<$Res, PostResponseDTO>;
  @useResult
  $Res call(
      {String boardId,
      @JsonKey(name: '_id') String postId,
      String authorId,
      String nickname,
      PostType postType,
      DiseaseType diseaseType,
      String content,
      @ImageItemConverter() List<ImageItem> images,
      @DateTimeConverter() DateTime createdAt,
      bool isLike,
      @JsonKey(name: 'totalLike') int likeNum,
      @JsonKey(name: 'totalComment') int commentNum});
}

/// @nodoc
class _$PostResponseDTOCopyWithImpl<$Res, $Val extends PostResponseDTO>
    implements $PostResponseDTOCopyWith<$Res> {
  _$PostResponseDTOCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? boardId = null,
    Object? postId = null,
    Object? authorId = null,
    Object? nickname = null,
    Object? postType = null,
    Object? diseaseType = null,
    Object? content = null,
    Object? images = null,
    Object? createdAt = null,
    Object? isLike = null,
    Object? likeNum = null,
    Object? commentNum = null,
  }) {
    return _then(_value.copyWith(
      boardId: null == boardId
          ? _value.boardId
          : boardId // ignore: cast_nullable_to_non_nullable
              as String,
      postId: null == postId
          ? _value.postId
          : postId // ignore: cast_nullable_to_non_nullable
              as String,
      authorId: null == authorId
          ? _value.authorId
          : authorId // ignore: cast_nullable_to_non_nullable
              as String,
      nickname: null == nickname
          ? _value.nickname
          : nickname // ignore: cast_nullable_to_non_nullable
              as String,
      postType: null == postType
          ? _value.postType
          : postType // ignore: cast_nullable_to_non_nullable
              as PostType,
      diseaseType: null == diseaseType
          ? _value.diseaseType
          : diseaseType // ignore: cast_nullable_to_non_nullable
              as DiseaseType,
      content: null == content
          ? _value.content
          : content // ignore: cast_nullable_to_non_nullable
              as String,
      images: null == images
          ? _value.images
          : images // ignore: cast_nullable_to_non_nullable
              as List<ImageItem>,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      isLike: null == isLike
          ? _value.isLike
          : isLike // ignore: cast_nullable_to_non_nullable
              as bool,
      likeNum: null == likeNum
          ? _value.likeNum
          : likeNum // ignore: cast_nullable_to_non_nullable
              as int,
      commentNum: null == commentNum
          ? _value.commentNum
          : commentNum // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_PostResponseDTOCopyWith<$Res>
    implements $PostResponseDTOCopyWith<$Res> {
  factory _$$_PostResponseDTOCopyWith(
          _$_PostResponseDTO value, $Res Function(_$_PostResponseDTO) then) =
      __$$_PostResponseDTOCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String boardId,
      @JsonKey(name: '_id') String postId,
      String authorId,
      String nickname,
      PostType postType,
      DiseaseType diseaseType,
      String content,
      @ImageItemConverter() List<ImageItem> images,
      @DateTimeConverter() DateTime createdAt,
      bool isLike,
      @JsonKey(name: 'totalLike') int likeNum,
      @JsonKey(name: 'totalComment') int commentNum});
}

/// @nodoc
class __$$_PostResponseDTOCopyWithImpl<$Res>
    extends _$PostResponseDTOCopyWithImpl<$Res, _$_PostResponseDTO>
    implements _$$_PostResponseDTOCopyWith<$Res> {
  __$$_PostResponseDTOCopyWithImpl(
      _$_PostResponseDTO _value, $Res Function(_$_PostResponseDTO) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? boardId = null,
    Object? postId = null,
    Object? authorId = null,
    Object? nickname = null,
    Object? postType = null,
    Object? diseaseType = null,
    Object? content = null,
    Object? images = null,
    Object? createdAt = null,
    Object? isLike = null,
    Object? likeNum = null,
    Object? commentNum = null,
  }) {
    return _then(_$_PostResponseDTO(
      boardId: null == boardId
          ? _value.boardId
          : boardId // ignore: cast_nullable_to_non_nullable
              as String,
      postId: null == postId
          ? _value.postId
          : postId // ignore: cast_nullable_to_non_nullable
              as String,
      authorId: null == authorId
          ? _value.authorId
          : authorId // ignore: cast_nullable_to_non_nullable
              as String,
      nickname: null == nickname
          ? _value.nickname
          : nickname // ignore: cast_nullable_to_non_nullable
              as String,
      postType: null == postType
          ? _value.postType
          : postType // ignore: cast_nullable_to_non_nullable
              as PostType,
      diseaseType: null == diseaseType
          ? _value.diseaseType
          : diseaseType // ignore: cast_nullable_to_non_nullable
              as DiseaseType,
      content: null == content
          ? _value.content
          : content // ignore: cast_nullable_to_non_nullable
              as String,
      images: null == images
          ? _value._images
          : images // ignore: cast_nullable_to_non_nullable
              as List<ImageItem>,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      isLike: null == isLike
          ? _value.isLike
          : isLike // ignore: cast_nullable_to_non_nullable
              as bool,
      likeNum: null == likeNum
          ? _value.likeNum
          : likeNum // ignore: cast_nullable_to_non_nullable
              as int,
      commentNum: null == commentNum
          ? _value.commentNum
          : commentNum // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

@JsonSerializable(explicitToJson: true)
class _$_PostResponseDTO implements _PostResponseDTO {
  _$_PostResponseDTO(
      {required this.boardId,
      @JsonKey(name: '_id') required this.postId,
      required this.authorId,
      this.nickname = '글 닉네임 없음',
      this.postType = PostType.cat,
      this.diseaseType = DiseaseType.dentistry,
      required this.content,
      @ImageItemConverter() required final List<ImageItem> images,
      @DateTimeConverter() required this.createdAt,
      this.isLike = false,
      @JsonKey(name: 'totalLike') this.likeNum = 0,
      @JsonKey(name: 'totalComment') this.commentNum = 0})
      : _images = images;

  factory _$_PostResponseDTO.fromJson(Map<String, dynamic> json) =>
      _$$_PostResponseDTOFromJson(json);

// @JsonKey(name: '_id') required String id,
  @override
  final String boardId;
  @override
  @JsonKey(name: '_id')
  final String postId;
  @override
  final String authorId;
  @override
  @JsonKey()
  final String nickname;
  @override
  @JsonKey()
  final PostType postType;
  @override
  @JsonKey()
  final DiseaseType diseaseType;
  @override
  final String content;
  final List<ImageItem> _images;
  @override
  @ImageItemConverter()
  List<ImageItem> get images {
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_images);
  }

  @override
  @DateTimeConverter()
  final DateTime createdAt;
  @override
  @JsonKey()
  final bool isLike;
  @override
  @JsonKey(name: 'totalLike')
  final int likeNum;
  @override
  @JsonKey(name: 'totalComment')
  final int commentNum;

  @override
  String toString() {
    return 'PostResponseDTO(boardId: $boardId, postId: $postId, authorId: $authorId, nickname: $nickname, postType: $postType, diseaseType: $diseaseType, content: $content, images: $images, createdAt: $createdAt, isLike: $isLike, likeNum: $likeNum, commentNum: $commentNum)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_PostResponseDTO &&
            (identical(other.boardId, boardId) || other.boardId == boardId) &&
            (identical(other.postId, postId) || other.postId == postId) &&
            (identical(other.authorId, authorId) ||
                other.authorId == authorId) &&
            (identical(other.nickname, nickname) ||
                other.nickname == nickname) &&
            (identical(other.postType, postType) ||
                other.postType == postType) &&
            (identical(other.diseaseType, diseaseType) ||
                other.diseaseType == diseaseType) &&
            (identical(other.content, content) || other.content == content) &&
            const DeepCollectionEquality().equals(other._images, _images) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.isLike, isLike) || other.isLike == isLike) &&
            (identical(other.likeNum, likeNum) || other.likeNum == likeNum) &&
            (identical(other.commentNum, commentNum) ||
                other.commentNum == commentNum));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      boardId,
      postId,
      authorId,
      nickname,
      postType,
      diseaseType,
      content,
      const DeepCollectionEquality().hash(_images),
      createdAt,
      isLike,
      likeNum,
      commentNum);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_PostResponseDTOCopyWith<_$_PostResponseDTO> get copyWith =>
      __$$_PostResponseDTOCopyWithImpl<_$_PostResponseDTO>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_PostResponseDTOToJson(
      this,
    );
  }
}

abstract class _PostResponseDTO implements PostResponseDTO {
  factory _PostResponseDTO(
          {required final String boardId,
          @JsonKey(name: '_id') required final String postId,
          required final String authorId,
          final String nickname,
          final PostType postType,
          final DiseaseType diseaseType,
          required final String content,
          @ImageItemConverter() required final List<ImageItem> images,
          @DateTimeConverter() required final DateTime createdAt,
          final bool isLike,
          @JsonKey(name: 'totalLike') final int likeNum,
          @JsonKey(name: 'totalComment') final int commentNum}) =
      _$_PostResponseDTO;

  factory _PostResponseDTO.fromJson(Map<String, dynamic> json) =
      _$_PostResponseDTO.fromJson;

  @override // @JsonKey(name: '_id') required String id,
  String get boardId;
  @override
  @JsonKey(name: '_id')
  String get postId;
  @override
  String get authorId;
  @override
  String get nickname;
  @override
  PostType get postType;
  @override
  DiseaseType get diseaseType;
  @override
  String get content;
  @override
  @ImageItemConverter()
  List<ImageItem> get images;
  @override
  @DateTimeConverter()
  DateTime get createdAt;
  @override
  bool get isLike;
  @override
  @JsonKey(name: 'totalLike')
  int get likeNum;
  @override
  @JsonKey(name: 'totalComment')
  int get commentNum;
  @override
  @JsonKey(ignore: true)
  _$$_PostResponseDTOCopyWith<_$_PostResponseDTO> get copyWith =>
      throw _privateConstructorUsedError;
}
