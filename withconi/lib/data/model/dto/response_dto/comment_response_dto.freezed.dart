// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'comment_response_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

CommentResponseDTO _$CommentResponseDTOFromJson(Map<String, dynamic> json) {
  return _CommentResponseDTO.fromJson(json);
}

/// @nodoc
mixin _$CommentResponseDTO {
  String get postId => throw _privateConstructorUsedError;
  String get boardId => throw _privateConstructorUsedError;
  String? get commentId => throw _privateConstructorUsedError;
  String get authorId => throw _privateConstructorUsedError;
  String get nickname => throw _privateConstructorUsedError;
  String get content => throw _privateConstructorUsedError;
  @DateTimeConverter()
  DateTime get createdAt => throw _privateConstructorUsedError;
  bool get isLike => throw _privateConstructorUsedError;
  int get likeNum => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $CommentResponseDTOCopyWith<CommentResponseDTO> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CommentResponseDTOCopyWith<$Res> {
  factory $CommentResponseDTOCopyWith(
          CommentResponseDTO value, $Res Function(CommentResponseDTO) then) =
      _$CommentResponseDTOCopyWithImpl<$Res>;
  $Res call(
      {String postId,
      String boardId,
      String? commentId,
      String authorId,
      String nickname,
      String content,
      @DateTimeConverter() DateTime createdAt,
      bool isLike,
      int likeNum});
}

/// @nodoc
class _$CommentResponseDTOCopyWithImpl<$Res>
    implements $CommentResponseDTOCopyWith<$Res> {
  _$CommentResponseDTOCopyWithImpl(this._value, this._then);

  final CommentResponseDTO _value;
  // ignore: unused_field
  final $Res Function(CommentResponseDTO) _then;

  @override
  $Res call({
    Object? postId = freezed,
    Object? boardId = freezed,
    Object? commentId = freezed,
    Object? authorId = freezed,
    Object? nickname = freezed,
    Object? content = freezed,
    Object? createdAt = freezed,
    Object? isLike = freezed,
    Object? likeNum = freezed,
  }) {
    return _then(_value.copyWith(
      postId: postId == freezed
          ? _value.postId
          : postId // ignore: cast_nullable_to_non_nullable
              as String,
      boardId: boardId == freezed
          ? _value.boardId
          : boardId // ignore: cast_nullable_to_non_nullable
              as String,
      commentId: commentId == freezed
          ? _value.commentId
          : commentId // ignore: cast_nullable_to_non_nullable
              as String?,
      authorId: authorId == freezed
          ? _value.authorId
          : authorId // ignore: cast_nullable_to_non_nullable
              as String,
      nickname: nickname == freezed
          ? _value.nickname
          : nickname // ignore: cast_nullable_to_non_nullable
              as String,
      content: content == freezed
          ? _value.content
          : content // ignore: cast_nullable_to_non_nullable
              as String,
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
    ));
  }
}

/// @nodoc
abstract class _$$_CommentResponseDTOCopyWith<$Res>
    implements $CommentResponseDTOCopyWith<$Res> {
  factory _$$_CommentResponseDTOCopyWith(_$_CommentResponseDTO value,
          $Res Function(_$_CommentResponseDTO) then) =
      __$$_CommentResponseDTOCopyWithImpl<$Res>;
  @override
  $Res call(
      {String postId,
      String boardId,
      String? commentId,
      String authorId,
      String nickname,
      String content,
      @DateTimeConverter() DateTime createdAt,
      bool isLike,
      int likeNum});
}

/// @nodoc
class __$$_CommentResponseDTOCopyWithImpl<$Res>
    extends _$CommentResponseDTOCopyWithImpl<$Res>
    implements _$$_CommentResponseDTOCopyWith<$Res> {
  __$$_CommentResponseDTOCopyWithImpl(
      _$_CommentResponseDTO _value, $Res Function(_$_CommentResponseDTO) _then)
      : super(_value, (v) => _then(v as _$_CommentResponseDTO));

  @override
  _$_CommentResponseDTO get _value => super._value as _$_CommentResponseDTO;

  @override
  $Res call({
    Object? postId = freezed,
    Object? boardId = freezed,
    Object? commentId = freezed,
    Object? authorId = freezed,
    Object? nickname = freezed,
    Object? content = freezed,
    Object? createdAt = freezed,
    Object? isLike = freezed,
    Object? likeNum = freezed,
  }) {
    return _then(_$_CommentResponseDTO(
      postId: postId == freezed
          ? _value.postId
          : postId // ignore: cast_nullable_to_non_nullable
              as String,
      boardId: boardId == freezed
          ? _value.boardId
          : boardId // ignore: cast_nullable_to_non_nullable
              as String,
      commentId: commentId == freezed
          ? _value.commentId
          : commentId // ignore: cast_nullable_to_non_nullable
              as String?,
      authorId: authorId == freezed
          ? _value.authorId
          : authorId // ignore: cast_nullable_to_non_nullable
              as String,
      nickname: nickname == freezed
          ? _value.nickname
          : nickname // ignore: cast_nullable_to_non_nullable
              as String,
      content: content == freezed
          ? _value.content
          : content // ignore: cast_nullable_to_non_nullable
              as String,
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
    ));
  }
}

/// @nodoc

@JsonSerializable(explicitToJson: true)
class _$_CommentResponseDTO implements _CommentResponseDTO {
  _$_CommentResponseDTO(
      {required this.postId,
      required this.boardId,
      required this.commentId,
      required this.authorId,
      required this.nickname,
      required this.content,
      @DateTimeConverter() required this.createdAt,
      required this.isLike,
      this.likeNum = 0});

  factory _$_CommentResponseDTO.fromJson(Map<String, dynamic> json) =>
      _$$_CommentResponseDTOFromJson(json);

  @override
  final String postId;
  @override
  final String boardId;
  @override
  final String? commentId;
  @override
  final String authorId;
  @override
  final String nickname;
  @override
  final String content;
  @override
  @DateTimeConverter()
  final DateTime createdAt;
  @override
  final bool isLike;
  @override
  @JsonKey()
  final int likeNum;

  @override
  String toString() {
    return 'CommentResponseDTO(postId: $postId, boardId: $boardId, commentId: $commentId, authorId: $authorId, nickname: $nickname, content: $content, createdAt: $createdAt, isLike: $isLike, likeNum: $likeNum)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_CommentResponseDTO &&
            const DeepCollectionEquality().equals(other.postId, postId) &&
            const DeepCollectionEquality().equals(other.boardId, boardId) &&
            const DeepCollectionEquality().equals(other.commentId, commentId) &&
            const DeepCollectionEquality().equals(other.authorId, authorId) &&
            const DeepCollectionEquality().equals(other.nickname, nickname) &&
            const DeepCollectionEquality().equals(other.content, content) &&
            const DeepCollectionEquality().equals(other.createdAt, createdAt) &&
            const DeepCollectionEquality().equals(other.isLike, isLike) &&
            const DeepCollectionEquality().equals(other.likeNum, likeNum));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(postId),
      const DeepCollectionEquality().hash(boardId),
      const DeepCollectionEquality().hash(commentId),
      const DeepCollectionEquality().hash(authorId),
      const DeepCollectionEquality().hash(nickname),
      const DeepCollectionEquality().hash(content),
      const DeepCollectionEquality().hash(createdAt),
      const DeepCollectionEquality().hash(isLike),
      const DeepCollectionEquality().hash(likeNum));

  @JsonKey(ignore: true)
  @override
  _$$_CommentResponseDTOCopyWith<_$_CommentResponseDTO> get copyWith =>
      __$$_CommentResponseDTOCopyWithImpl<_$_CommentResponseDTO>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_CommentResponseDTOToJson(
      this,
    );
  }
}

abstract class _CommentResponseDTO implements CommentResponseDTO {
  factory _CommentResponseDTO(
      {required final String postId,
      required final String boardId,
      required final String? commentId,
      required final String authorId,
      required final String nickname,
      required final String content,
      @DateTimeConverter() required final DateTime createdAt,
      required final bool isLike,
      final int likeNum}) = _$_CommentResponseDTO;

  factory _CommentResponseDTO.fromJson(Map<String, dynamic> json) =
      _$_CommentResponseDTO.fromJson;

  @override
  String get postId;
  @override
  String get boardId;
  @override
  String? get commentId;
  @override
  String get authorId;
  @override
  String get nickname;
  @override
  String get content;
  @override
  @DateTimeConverter()
  DateTime get createdAt;
  @override
  bool get isLike;
  @override
  int get likeNum;
  @override
  @JsonKey(ignore: true)
  _$$_CommentResponseDTOCopyWith<_$_CommentResponseDTO> get copyWith =>
      throw _privateConstructorUsedError;
}
