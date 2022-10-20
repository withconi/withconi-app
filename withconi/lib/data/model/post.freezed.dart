// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'post.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

Post _$PostFromJson(Map<String, dynamic> json) {
  return _Post.fromJson(json);
}

/// @nodoc
mixin _$Post {
  String get boardId => throw _privateConstructorUsedError;
  String? get postId => throw _privateConstructorUsedError;
  String get authorId => throw _privateConstructorUsedError;
  String get nickname => throw _privateConstructorUsedError;
  PostType get postType => throw _privateConstructorUsedError;
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
  $PostCopyWith<Post> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PostCopyWith<$Res> {
  factory $PostCopyWith(Post value, $Res Function(Post) then) =
      _$PostCopyWithImpl<$Res>;
  $Res call(
      {String boardId,
      String? postId,
      String authorId,
      String nickname,
      PostType postType,
      String content,
      @ImageItemConverter() List<ImageItem> images,
      @DateTimeConverter() DateTime createdAt,
      bool isLike,
      int likeNum,
      int commentNum});
}

/// @nodoc
class _$PostCopyWithImpl<$Res> implements $PostCopyWith<$Res> {
  _$PostCopyWithImpl(this._value, this._then);

  final Post _value;
  // ignore: unused_field
  final $Res Function(Post) _then;

  @override
  $Res call({
    Object? boardId = freezed,
    Object? postId = freezed,
    Object? authorId = freezed,
    Object? nickname = freezed,
    Object? postType = freezed,
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
abstract class _$$_PostCopyWith<$Res> implements $PostCopyWith<$Res> {
  factory _$$_PostCopyWith(_$_Post value, $Res Function(_$_Post) then) =
      __$$_PostCopyWithImpl<$Res>;
  @override
  $Res call(
      {String boardId,
      String? postId,
      String authorId,
      String nickname,
      PostType postType,
      String content,
      @ImageItemConverter() List<ImageItem> images,
      @DateTimeConverter() DateTime createdAt,
      bool isLike,
      int likeNum,
      int commentNum});
}

/// @nodoc
class __$$_PostCopyWithImpl<$Res> extends _$PostCopyWithImpl<$Res>
    implements _$$_PostCopyWith<$Res> {
  __$$_PostCopyWithImpl(_$_Post _value, $Res Function(_$_Post) _then)
      : super(_value, (v) => _then(v as _$_Post));

  @override
  _$_Post get _value => super._value as _$_Post;

  @override
  $Res call({
    Object? boardId = freezed,
    Object? postId = freezed,
    Object? authorId = freezed,
    Object? nickname = freezed,
    Object? postType = freezed,
    Object? content = freezed,
    Object? images = freezed,
    Object? createdAt = freezed,
    Object? isLike = freezed,
    Object? likeNum = freezed,
    Object? commentNum = freezed,
  }) {
    return _then(_$_Post(
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
class _$_Post implements _Post {
  _$_Post(
      {required this.boardId,
      this.postId = '',
      required this.authorId,
      required this.nickname,
      required this.postType,
      required this.content,
      @ImageItemConverter() required final List<ImageItem> images,
      @DateTimeConverter() required this.createdAt,
      this.isLike = false,
      this.likeNum = 12,
      this.commentNum = 3})
      : _images = images;

  factory _$_Post.fromJson(Map<String, dynamic> json) => _$$_PostFromJson(json);

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
    return 'Post(boardId: $boardId, postId: $postId, authorId: $authorId, nickname: $nickname, postType: $postType, content: $content, images: $images, createdAt: $createdAt, isLike: $isLike, likeNum: $likeNum, commentNum: $commentNum)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Post &&
            const DeepCollectionEquality().equals(other.boardId, boardId) &&
            const DeepCollectionEquality().equals(other.postId, postId) &&
            const DeepCollectionEquality().equals(other.authorId, authorId) &&
            const DeepCollectionEquality().equals(other.nickname, nickname) &&
            const DeepCollectionEquality().equals(other.postType, postType) &&
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
      const DeepCollectionEquality().hash(content),
      const DeepCollectionEquality().hash(_images),
      const DeepCollectionEquality().hash(createdAt),
      const DeepCollectionEquality().hash(isLike),
      const DeepCollectionEquality().hash(likeNum),
      const DeepCollectionEquality().hash(commentNum));

  @JsonKey(ignore: true)
  @override
  _$$_PostCopyWith<_$_Post> get copyWith =>
      __$$_PostCopyWithImpl<_$_Post>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_PostToJson(
      this,
    );
  }
}

abstract class _Post implements Post {
  factory _Post(
      {required final String boardId,
      final String? postId,
      required final String authorId,
      required final String nickname,
      required final PostType postType,
      required final String content,
      @ImageItemConverter() required final List<ImageItem> images,
      @DateTimeConverter() required final DateTime createdAt,
      final bool isLike,
      final int likeNum,
      final int commentNum}) = _$_Post;

  factory _Post.fromJson(Map<String, dynamic> json) = _$_Post.fromJson;

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
  _$$_PostCopyWith<_$_Post> get copyWith => throw _privateConstructorUsedError;
}
