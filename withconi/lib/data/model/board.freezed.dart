// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'board.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

Board _$BoardFromJson(Map<String, dynamic> json) {
  return _Board.fromJson(json);
}

/// @nodoc
mixin _$Board {
  int get boardId => throw _privateConstructorUsedError;
  String get title => throw _privateConstructorUsedError;
  @DateTimeConverter()
  DateTime get createdAt => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $BoardCopyWith<Board> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $BoardCopyWith<$Res> {
  factory $BoardCopyWith(Board value, $Res Function(Board) then) =
      _$BoardCopyWithImpl<$Res>;
  $Res call(
      {int boardId, String title, @DateTimeConverter() DateTime createdAt});
}

/// @nodoc
class _$BoardCopyWithImpl<$Res> implements $BoardCopyWith<$Res> {
  _$BoardCopyWithImpl(this._value, this._then);

  final Board _value;
  // ignore: unused_field
  final $Res Function(Board) _then;

  @override
  $Res call({
    Object? boardId = freezed,
    Object? title = freezed,
    Object? createdAt = freezed,
  }) {
    return _then(_value.copyWith(
      boardId: boardId == freezed
          ? _value.boardId
          : boardId // ignore: cast_nullable_to_non_nullable
              as int,
      title: title == freezed
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      createdAt: createdAt == freezed
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ));
  }
}

/// @nodoc
abstract class _$$_BoardCopyWith<$Res> implements $BoardCopyWith<$Res> {
  factory _$$_BoardCopyWith(_$_Board value, $Res Function(_$_Board) then) =
      __$$_BoardCopyWithImpl<$Res>;
  @override
  $Res call(
      {int boardId, String title, @DateTimeConverter() DateTime createdAt});
}

/// @nodoc
class __$$_BoardCopyWithImpl<$Res> extends _$BoardCopyWithImpl<$Res>
    implements _$$_BoardCopyWith<$Res> {
  __$$_BoardCopyWithImpl(_$_Board _value, $Res Function(_$_Board) _then)
      : super(_value, (v) => _then(v as _$_Board));

  @override
  _$_Board get _value => super._value as _$_Board;

  @override
  $Res call({
    Object? boardId = freezed,
    Object? title = freezed,
    Object? createdAt = freezed,
  }) {
    return _then(_$_Board(
      boardId: boardId == freezed
          ? _value.boardId
          : boardId // ignore: cast_nullable_to_non_nullable
              as int,
      title: title == freezed
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      createdAt: createdAt == freezed
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ));
  }
}

/// @nodoc

@JsonSerializable(explicitToJson: true)
class _$_Board implements _Board {
  _$_Board(
      {required this.boardId,
      required this.title,
      @DateTimeConverter() required this.createdAt});

  factory _$_Board.fromJson(Map<String, dynamic> json) =>
      _$$_BoardFromJson(json);

  @override
  final int boardId;
  @override
  final String title;
  @override
  @DateTimeConverter()
  final DateTime createdAt;

  @override
  String toString() {
    return 'Board(boardId: $boardId, title: $title, createdAt: $createdAt)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Board &&
            const DeepCollectionEquality().equals(other.boardId, boardId) &&
            const DeepCollectionEquality().equals(other.title, title) &&
            const DeepCollectionEquality().equals(other.createdAt, createdAt));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(boardId),
      const DeepCollectionEquality().hash(title),
      const DeepCollectionEquality().hash(createdAt));

  @JsonKey(ignore: true)
  @override
  _$$_BoardCopyWith<_$_Board> get copyWith =>
      __$$_BoardCopyWithImpl<_$_Board>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_BoardToJson(
      this,
    );
  }
}

abstract class _Board implements Board {
  factory _Board(
      {required final int boardId,
      required final String title,
      @DateTimeConverter() required final DateTime createdAt}) = _$_Board;

  factory _Board.fromJson(Map<String, dynamic> json) = _$_Board.fromJson;

  @override
  int get boardId;
  @override
  String get title;
  @override
  @DateTimeConverter()
  DateTime get createdAt;
  @override
  @JsonKey(ignore: true)
  _$$_BoardCopyWith<_$_Board> get copyWith =>
      throw _privateConstructorUsedError;
}
