// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

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
  @JsonKey(name: 'profileImageUrl')
  String get profileImageUrl => throw _privateConstructorUsedError;
  String get postId => throw _privateConstructorUsedError;
  String get boardId => throw _privateConstructorUsedError;
  @JsonKey(name: '_id')
  String get commentId => throw _privateConstructorUsedError;
  String get authorId => throw _privateConstructorUsedError;
  String get userId => throw _privateConstructorUsedError;
  String get nickname => throw _privateConstructorUsedError;
  String get content => throw _privateConstructorUsedError;
  @DateTimeConverter()
  DateTime get createdAt => throw _privateConstructorUsedError;
  bool get isLike => throw _privateConstructorUsedError;
  @JsonKey(name: 'totalLike')
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
      _$CommentResponseDTOCopyWithImpl<$Res, CommentResponseDTO>;
  @useResult
  $Res call(
      {@JsonKey(name: 'profileImageUrl') String profileImageUrl,
      String postId,
      String boardId,
      @JsonKey(name: '_id') String commentId,
      String authorId,
      String userId,
      String nickname,
      String content,
      @DateTimeConverter() DateTime createdAt,
      bool isLike,
      @JsonKey(name: 'totalLike') int likeNum});
}

/// @nodoc
class _$CommentResponseDTOCopyWithImpl<$Res, $Val extends CommentResponseDTO>
    implements $CommentResponseDTOCopyWith<$Res> {
  _$CommentResponseDTOCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? profileImageUrl = null,
    Object? postId = null,
    Object? boardId = null,
    Object? commentId = null,
    Object? authorId = null,
    Object? userId = null,
    Object? nickname = null,
    Object? content = null,
    Object? createdAt = null,
    Object? isLike = null,
    Object? likeNum = null,
  }) {
    return _then(_value.copyWith(
      profileImageUrl: null == profileImageUrl
          ? _value.profileImageUrl
          : profileImageUrl // ignore: cast_nullable_to_non_nullable
              as String,
      postId: null == postId
          ? _value.postId
          : postId // ignore: cast_nullable_to_non_nullable
              as String,
      boardId: null == boardId
          ? _value.boardId
          : boardId // ignore: cast_nullable_to_non_nullable
              as String,
      commentId: null == commentId
          ? _value.commentId
          : commentId // ignore: cast_nullable_to_non_nullable
              as String,
      authorId: null == authorId
          ? _value.authorId
          : authorId // ignore: cast_nullable_to_non_nullable
              as String,
      userId: null == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String,
      nickname: null == nickname
          ? _value.nickname
          : nickname // ignore: cast_nullable_to_non_nullable
              as String,
      content: null == content
          ? _value.content
          : content // ignore: cast_nullable_to_non_nullable
              as String,
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
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_CommentResponseDTOCopyWith<$Res>
    implements $CommentResponseDTOCopyWith<$Res> {
  factory _$$_CommentResponseDTOCopyWith(_$_CommentResponseDTO value,
          $Res Function(_$_CommentResponseDTO) then) =
      __$$_CommentResponseDTOCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'profileImageUrl') String profileImageUrl,
      String postId,
      String boardId,
      @JsonKey(name: '_id') String commentId,
      String authorId,
      String userId,
      String nickname,
      String content,
      @DateTimeConverter() DateTime createdAt,
      bool isLike,
      @JsonKey(name: 'totalLike') int likeNum});
}

/// @nodoc
class __$$_CommentResponseDTOCopyWithImpl<$Res>
    extends _$CommentResponseDTOCopyWithImpl<$Res, _$_CommentResponseDTO>
    implements _$$_CommentResponseDTOCopyWith<$Res> {
  __$$_CommentResponseDTOCopyWithImpl(
      _$_CommentResponseDTO _value, $Res Function(_$_CommentResponseDTO) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? profileImageUrl = null,
    Object? postId = null,
    Object? boardId = null,
    Object? commentId = null,
    Object? authorId = null,
    Object? userId = null,
    Object? nickname = null,
    Object? content = null,
    Object? createdAt = null,
    Object? isLike = null,
    Object? likeNum = null,
  }) {
    return _then(_$_CommentResponseDTO(
      profileImageUrl: null == profileImageUrl
          ? _value.profileImageUrl
          : profileImageUrl // ignore: cast_nullable_to_non_nullable
              as String,
      postId: null == postId
          ? _value.postId
          : postId // ignore: cast_nullable_to_non_nullable
              as String,
      boardId: null == boardId
          ? _value.boardId
          : boardId // ignore: cast_nullable_to_non_nullable
              as String,
      commentId: null == commentId
          ? _value.commentId
          : commentId // ignore: cast_nullable_to_non_nullable
              as String,
      authorId: null == authorId
          ? _value.authorId
          : authorId // ignore: cast_nullable_to_non_nullable
              as String,
      userId: null == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String,
      nickname: null == nickname
          ? _value.nickname
          : nickname // ignore: cast_nullable_to_non_nullable
              as String,
      content: null == content
          ? _value.content
          : content // ignore: cast_nullable_to_non_nullable
              as String,
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
    ));
  }
}

/// @nodoc

@JsonSerializable(explicitToJson: true)
class _$_CommentResponseDTO implements _CommentResponseDTO {
  _$_CommentResponseDTO(
      {@JsonKey(name: 'profileImageUrl') this.profileImageUrl = '',
      required this.postId,
      required this.boardId,
      @JsonKey(name: '_id') required this.commentId,
      this.authorId = '',
      this.userId = '',
      this.nickname = '사용자 없음',
      required this.content,
      @DateTimeConverter() required this.createdAt,
      this.isLike = false,
      @JsonKey(name: 'totalLike') this.likeNum = 0});

  factory _$_CommentResponseDTO.fromJson(Map<String, dynamic> json) =>
      _$$_CommentResponseDTOFromJson(json);

  @override
  @JsonKey(name: 'profileImageUrl')
  final String profileImageUrl;
  @override
  final String postId;
  @override
  final String boardId;
  @override
  @JsonKey(name: '_id')
  final String commentId;
  @override
  @JsonKey()
  final String authorId;
  @override
  @JsonKey()
  final String userId;
  @override
  @JsonKey()
  final String nickname;
  @override
  final String content;
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
  String toString() {
    return 'CommentResponseDTO(profileImageUrl: $profileImageUrl, postId: $postId, boardId: $boardId, commentId: $commentId, authorId: $authorId, userId: $userId, nickname: $nickname, content: $content, createdAt: $createdAt, isLike: $isLike, likeNum: $likeNum)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_CommentResponseDTO &&
            (identical(other.profileImageUrl, profileImageUrl) ||
                other.profileImageUrl == profileImageUrl) &&
            (identical(other.postId, postId) || other.postId == postId) &&
            (identical(other.boardId, boardId) || other.boardId == boardId) &&
            (identical(other.commentId, commentId) ||
                other.commentId == commentId) &&
            (identical(other.authorId, authorId) ||
                other.authorId == authorId) &&
            (identical(other.userId, userId) || other.userId == userId) &&
            (identical(other.nickname, nickname) ||
                other.nickname == nickname) &&
            (identical(other.content, content) || other.content == content) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.isLike, isLike) || other.isLike == isLike) &&
            (identical(other.likeNum, likeNum) || other.likeNum == likeNum));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      profileImageUrl,
      postId,
      boardId,
      commentId,
      authorId,
      userId,
      nickname,
      content,
      createdAt,
      isLike,
      likeNum);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
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
      {@JsonKey(name: 'profileImageUrl') final String profileImageUrl,
      required final String postId,
      required final String boardId,
      @JsonKey(name: '_id') required final String commentId,
      final String authorId,
      final String userId,
      final String nickname,
      required final String content,
      @DateTimeConverter() required final DateTime createdAt,
      final bool isLike,
      @JsonKey(name: 'totalLike') final int likeNum}) = _$_CommentResponseDTO;

  factory _CommentResponseDTO.fromJson(Map<String, dynamic> json) =
      _$_CommentResponseDTO.fromJson;

  @override
  @JsonKey(name: 'profileImageUrl')
  String get profileImageUrl;
  @override
  String get postId;
  @override
  String get boardId;
  @override
  @JsonKey(name: '_id')
  String get commentId;
  @override
  String get authorId;
  @override
  String get userId;
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
  @JsonKey(name: 'totalLike')
  int get likeNum;
  @override
  @JsonKey(ignore: true)
  _$$_CommentResponseDTOCopyWith<_$_CommentResponseDTO> get copyWith =>
      throw _privateConstructorUsedError;
}
