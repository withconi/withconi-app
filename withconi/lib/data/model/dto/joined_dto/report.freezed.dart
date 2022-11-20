// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'report.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

Report _$ReportFromJson(Map<String, dynamic> json) {
  return _Report.fromJson(json);
}

/// @nodoc
mixin _$Report {
  String get boardId => throw _privateConstructorUsedError;
  String get postId => throw _privateConstructorUsedError;
  String get userId => throw _privateConstructorUsedError;
  @ReportItemConverter()
  List<ReportItem> get reviewDesc => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ReportCopyWith<Report> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ReportCopyWith<$Res> {
  factory $ReportCopyWith(Report value, $Res Function(Report) then) =
      _$ReportCopyWithImpl<$Res, Report>;
  @useResult
  $Res call(
      {String boardId,
      String postId,
      String userId,
      @ReportItemConverter() List<ReportItem> reviewDesc});
}

/// @nodoc
class _$ReportCopyWithImpl<$Res, $Val extends Report>
    implements $ReportCopyWith<$Res> {
  _$ReportCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? boardId = null,
    Object? postId = null,
    Object? userId = null,
    Object? reviewDesc = null,
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
      userId: null == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String,
      reviewDesc: null == reviewDesc
          ? _value.reviewDesc
          : reviewDesc // ignore: cast_nullable_to_non_nullable
              as List<ReportItem>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_ReportCopyWith<$Res> implements $ReportCopyWith<$Res> {
  factory _$$_ReportCopyWith(_$_Report value, $Res Function(_$_Report) then) =
      __$$_ReportCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String boardId,
      String postId,
      String userId,
      @ReportItemConverter() List<ReportItem> reviewDesc});
}

/// @nodoc
class __$$_ReportCopyWithImpl<$Res>
    extends _$ReportCopyWithImpl<$Res, _$_Report>
    implements _$$_ReportCopyWith<$Res> {
  __$$_ReportCopyWithImpl(_$_Report _value, $Res Function(_$_Report) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? boardId = null,
    Object? postId = null,
    Object? userId = null,
    Object? reviewDesc = null,
  }) {
    return _then(_$_Report(
      boardId: null == boardId
          ? _value.boardId
          : boardId // ignore: cast_nullable_to_non_nullable
              as String,
      postId: null == postId
          ? _value.postId
          : postId // ignore: cast_nullable_to_non_nullable
              as String,
      userId: null == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String,
      reviewDesc: null == reviewDesc
          ? _value._reviewDesc
          : reviewDesc // ignore: cast_nullable_to_non_nullable
              as List<ReportItem>,
    ));
  }
}

/// @nodoc

@JsonSerializable(explicitToJson: true)
class _$_Report implements _Report {
  _$_Report(
      {required this.boardId,
      required this.postId,
      required this.userId,
      @ReportItemConverter() required final List<ReportItem> reviewDesc})
      : _reviewDesc = reviewDesc;

  factory _$_Report.fromJson(Map<String, dynamic> json) =>
      _$$_ReportFromJson(json);

  @override
  final String boardId;
  @override
  final String postId;
  @override
  final String userId;
  final List<ReportItem> _reviewDesc;
  @override
  @ReportItemConverter()
  List<ReportItem> get reviewDesc {
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_reviewDesc);
  }

  @override
  String toString() {
    return 'Report(boardId: $boardId, postId: $postId, userId: $userId, reviewDesc: $reviewDesc)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Report &&
            (identical(other.boardId, boardId) || other.boardId == boardId) &&
            (identical(other.postId, postId) || other.postId == postId) &&
            (identical(other.userId, userId) || other.userId == userId) &&
            const DeepCollectionEquality()
                .equals(other._reviewDesc, _reviewDesc));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, boardId, postId, userId,
      const DeepCollectionEquality().hash(_reviewDesc));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_ReportCopyWith<_$_Report> get copyWith =>
      __$$_ReportCopyWithImpl<_$_Report>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_ReportToJson(
      this,
    );
  }
}

abstract class _Report implements Report {
  factory _Report(
          {required final String boardId,
          required final String postId,
          required final String userId,
          @ReportItemConverter() required final List<ReportItem> reviewDesc}) =
      _$_Report;

  factory _Report.fromJson(Map<String, dynamic> json) = _$_Report.fromJson;

  @override
  String get boardId;
  @override
  String get postId;
  @override
  String get userId;
  @override
  @ReportItemConverter()
  List<ReportItem> get reviewDesc;
  @override
  @JsonKey(ignore: true)
  _$$_ReportCopyWith<_$_Report> get copyWith =>
      throw _privateConstructorUsedError;
}
