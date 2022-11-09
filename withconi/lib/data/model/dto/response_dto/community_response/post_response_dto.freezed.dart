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
  String get boardId => throw _privateConstructorUsedError;
  String? get postId => throw _privateConstructorUsedError;
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
  int get likeNum => throw _privateConstructorUsedError;
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
      _$PostResponseDTOCopyWithImpl<$Res>;
  $Res call(
      {String boardId,
      String? postId,
      String authorId,
      String nickname,
      PostType postType,
      DiseaseType diseaseType,
      String content,
      @ImageItemConverter() List<ImageItem> images,
      @DateTimeConverter() DateTime createdAt,
      bool isLike,
      int likeNum,
      int commentNum});
}

/// @nodoc
class _$PostResponseDTOCopyWithImpl<$Res>
    implements $PostResponseDTOCopyWith<$Res> {
  _$PostResponseDTOCopyWithImpl(this._value, this._then);

  final PostResponseDTO _value;
  // ignore: unused_field
  final $Res Function(PostResponseDTO) _then;

  @override
  $Res call({
    Object? boardId = freezed,
    Object? postId = freezed,
    Object? authorId = freezed,
    Object? nickname = freezed,
    Object? postType = freezed,
    Object? diseaseType = freezed,
    Object? content = freezed,
    Object? images = freezed,
    Object? createdAt = freezed,
    Object? isLike = freezed,
    Object? likeNum = freezed,
    Object? commentNum = freezed,
  }) {
    return _then(_value.copyWith(
      boardId: boardId == freezed
          ? _value.boardId
          : boardId // ignore: cast_nullable_to_non_nullable
              as String,
      postId: postId == freezed
          ? _value.postId
          : postId // ignore: cast_nullable_to_non_nullable
              as String?,
      authorId: authorId == freezed
          ? _value.authorId
          : authorId // ignore: cast_nullable_to_non_nullable
              as String,
      nickname: nickname == freezed
          ? _value.nickname
          : nickname // ignore: cast_nullable_to_non_nullable
              as String,
      postType: postType == freezed
          ? _value.postType
          : postType // ignore: cast_nullable_to_non_nullable
              as PostType,
      diseaseType: diseaseType == freezed
          ? _value.diseaseType
          : diseaseType // ignore: cast_nullable_to_non_nullable
              as DiseaseType,
      content: content == freezed
          ? _value.content
          : content // ignore: cast_nullable_to_non_nullable
              as String,
      images: images == freezed
          ? _value.images
          : images // ignore: cast_nullable_to_non_nullable
              as List<ImageItem>,
      createdAt: createdAt == freezed
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      isLike: isLike == freezed
          ? _value.isLike
          : isLike // ignore: cast_nullable_to_non_nullable
              as bool,
      likeNum: likeNum == freezed
          ? _value.likeNum
          : likeNum // ignore: cast_nullable_to_non_nullable
              as int,
      commentNum: commentNum == freezed
          ? _value.commentNum
          : commentNum // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
abstract class _$$_PostResponseDTOCopyWith<$Res>
    implements $PostResponseDTOCopyWith<$Res> {
  factory _$$_PostResponseDTOCopyWith(
          _$_PostResponseDTO value, $Res Function(_$_PostResponseDTO) then) =
      __$$_PostResponseDTOCopyWithImpl<$Res>;
  @override
  $Res call(
      {String boardId,
      String? postId,
      String authorId,
      String nickname,
      PostType postType,
      DiseaseType diseaseType,
      String content,
      @ImageItemConverter() List<ImageItem> images,
      @DateTimeConverter() DateTime createdAt,
      bool isLike,
      int likeNum,
      int commentNum});
}

/// @nodoc
class __$$_PostResponseDTOCopyWithImpl<$Res>
    extends _$PostResponseDTOCopyWithImpl<$Res>
    implements _$$_PostResponseDTOCopyWith<$Res> {
  __$$_PostResponseDTOCopyWithImpl(
      _$_PostResponseDTO _value, $Res Function(_$_PostResponseDTO) _then)
      : super(_value, (v) => _then(v as _$_PostResponseDTO));

  @override
  _$_PostResponseDTO get _value => super._value as _$_PostResponseDTO;

  @override
  $Res call({
    Object? boardId = freezed,
    Object? postId = freezed,
    Object? authorId = freezed,
    Object? nickname = freezed,
    Object? postType = freezed,
    Object? diseaseType = freezed,
    Object? content = freezed,
    Object? images = freezed,
    Object? createdAt = freezed,
    Object? isLike = freezed,
    Object? likeNum = freezed,
    Object? commentNum = freezed,
  }) {
    return _then(_$_PostResponseDTO(
      boardId: boardId == freezed
          ? _value.boardId
          : boardId // ignore: cast_nullable_to_non_nullable
              as String,
      postId: postId == freezed
          ? _value.postId
          : postId // ignore: cast_nullable_to_non_nullable
              as String?,
      authorId: authorId == freezed
          ? _value.authorId
          : authorId // ignore: cast_nullable_to_non_nullable
              as String,
      nickname: nickname == freezed
          ? _value.nickname
          : nickname // ignore: cast_nullable_to_non_nullable
              as String,
      postType: postType == freezed
          ? _value.postType
          : postType // ignore: cast_nullable_to_non_nullable
              as PostType,
      diseaseType: diseaseType == freezed
          ? _value.diseaseType
          : diseaseType // ignore: cast_nullable_to_non_nullable
              as DiseaseType,
      content: content == freezed
          ? _value.content
          : content // ignore: cast_nullable_to_non_nullable
              as String,
      images: images == freezed
          ? _value._images
          : images // ignore: cast_nullable_to_non_nullable
              as List<ImageItem>,
      createdAt: createdAt == freezed
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      isLike: isLike == freezed
          ? _value.isLike
          : isLike // ignore: cast_nullable_to_non_nullable
              as bool,
      likeNum: likeNum == freezed
          ? _value.likeNum
          : likeNum // ignore: cast_nullable_to_non_nullable
              as int,
      commentNum: commentNum == freezed
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
      this.postId = '',
      required this.authorId,
      required this.nickname,
      required this.postType,
      required this.diseaseType,
      required this.content,
      @ImageItemConverter() required final List<ImageItem> images,
      @DateTimeConverter() required this.createdAt,
      this.isLike = false,
      this.likeNum = 12,
      this.commentNum = 3})
      : _images = images;

  factory _$_PostResponseDTO.fromJson(Map<String, dynamic> json) =>
      _$$_PostResponseDTOFromJson(json);

  @override
  final String boardId;
  @override
  @JsonKey()
  final String? postId;
  @override
  final String authorId;
  @override
  final String nickname;
  @override
  final PostType postType;
  @override
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
  @JsonKey()
  final int likeNum;
  @override
  @JsonKey()
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
            const DeepCollectionEquality().equals(other.boardId, boardId) &&
            const DeepCollectionEquality().equals(other.postId, postId) &&
            const DeepCollectionEquality().equals(other.authorId, authorId) &&
            const DeepCollectionEquality().equals(other.nickname, nickname) &&
            const DeepCollectionEquality().equals(other.postType, postType) &&
            const DeepCollectionEquality()
                .equals(other.diseaseType, diseaseType) &&
            const DeepCollectionEquality().equals(other.content, content) &&
            const DeepCollectionEquality().equals(other._images, _images) &&
            const DeepCollectionEquality().equals(other.createdAt, createdAt) &&
            const DeepCollectionEquality().equals(other.isLike, isLike) &&
            const DeepCollectionEquality().equals(other.likeNum, likeNum) &&
            const DeepCollectionEquality()
                .equals(other.commentNum, commentNum));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(boardId),
      const DeepCollectionEquality().hash(postId),
      const DeepCollectionEquality().hash(authorId),
      const DeepCollectionEquality().hash(nickname),
      const DeepCollectionEquality().hash(postType),
      const DeepCollectionEquality().hash(diseaseType),
      const DeepCollectionEquality().hash(content),
      const DeepCollectionEquality().hash(_images),
      const DeepCollectionEquality().hash(createdAt),
      const DeepCollectionEquality().hash(isLike),
      const DeepCollectionEquality().hash(likeNum),
      const DeepCollectionEquality().hash(commentNum));

  @JsonKey(ignore: true)
  @override
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
      final String? postId,
      required final String authorId,
      required final String nickname,
      required final PostType postType,
      required final DiseaseType diseaseType,
      required final String content,
      @ImageItemConverter() required final List<ImageItem> images,
      @DateTimeConverter() required final DateTime createdAt,
      final bool isLike,
      final int likeNum,
      final int commentNum}) = _$_PostResponseDTO;

  factory _PostResponseDTO.fromJson(Map<String, dynamic> json) =
      _$_PostResponseDTO.fromJson;

  @override
  String get boardId;
  @override
  String? get postId;
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
  int get likeNum;
  @override
  int get commentNum;
  @override
  @JsonKey(ignore: true)
  _$$_PostResponseDTOCopyWith<_$_PostResponseDTO> get copyWith =>
      throw _privateConstructorUsedError;
}
