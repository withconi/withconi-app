// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'board_response_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

BoardResponseDTO _$BoardResponseDTOFromJson(Map<String, dynamic> json) {
  return _BoardResponseDTO.fromJson(json);
}

/// @nodoc
mixin _$BoardResponseDTO {
  int get boardId => throw _privateConstructorUsedError;
  String get title => throw _privateConstructorUsedError;
  @DateTimeConverter()
  DateTime get createdAt => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $BoardResponseDTOCopyWith<BoardResponseDTO> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $BoardResponseDTOCopyWith<$Res> {
  factory $BoardResponseDTOCopyWith(
          BoardResponseDTO value, $Res Function(BoardResponseDTO) then) =
      _$BoardResponseDTOCopyWithImpl<$Res>;
  $Res call(
      {int boardId, String title, @DateTimeConverter() DateTime createdAt});
}

/// @nodoc
class _$BoardResponseDTOCopyWithImpl<$Res>
    implements $BoardResponseDTOCopyWith<$Res> {
  _$BoardResponseDTOCopyWithImpl(this._value, this._then);

  final BoardResponseDTO _value;
  // ignore: unused_field
  final $Res Function(BoardResponseDTO) _then;

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
abstract class _$$_BoardResponseDTOCopyWith<$Res>
    implements $BoardResponseDTOCopyWith<$Res> {
  factory _$$_BoardResponseDTOCopyWith(
          _$_BoardResponseDTO value, $Res Function(_$_BoardResponseDTO) then) =
      __$$_BoardResponseDTOCopyWithImpl<$Res>;
  @override
  $Res call(
      {int boardId, String title, @DateTimeConverter() DateTime createdAt});
}

/// @nodoc
class __$$_BoardResponseDTOCopyWithImpl<$Res>
    extends _$BoardResponseDTOCopyWithImpl<$Res>
    implements _$$_BoardResponseDTOCopyWith<$Res> {
  __$$_BoardResponseDTOCopyWithImpl(
      _$_BoardResponseDTO _value, $Res Function(_$_BoardResponseDTO) _then)
      : super(_value, (v) => _then(v as _$_BoardResponseDTO));

  @override
  _$_BoardResponseDTO get _value => super._value as _$_BoardResponseDTO;

  @override
  $Res call({
    Object? boardId = freezed,
    Object? title = freezed,
    Object? createdAt = freezed,
  }) {
    return _then(_$_BoardResponseDTO(
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
class _$_BoardResponseDTO implements _BoardResponseDTO {
  _$_BoardResponseDTO(
      {required this.boardId,
      required this.title,
      @DateTimeConverter() required this.createdAt});

  factory _$_BoardResponseDTO.fromJson(Map<String, dynamic> json) =>
      _$$_BoardResponseDTOFromJson(json);

  @override
  final int boardId;
  @override
  final String title;
  @override
  @DateTimeConverter()
  final DateTime createdAt;

  @override
  String toString() {
    return 'BoardResponseDTO(boardId: $boardId, title: $title, createdAt: $createdAt)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_BoardResponseDTO &&
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
  _$$_BoardResponseDTOCopyWith<_$_BoardResponseDTO> get copyWith =>
      __$$_BoardResponseDTOCopyWithImpl<_$_BoardResponseDTO>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_BoardResponseDTOToJson(
      this,
    );
  }
}

abstract class _BoardResponseDTO implements BoardResponseDTO {
  factory _BoardResponseDTO(
          {required final int boardId,
          required final String title,
          @DateTimeConverter() required final DateTime createdAt}) =
      _$_BoardResponseDTO;

  factory _BoardResponseDTO.fromJson(Map<String, dynamic> json) =
      _$_BoardResponseDTO.fromJson;

  @override
  int get boardId;
  @override
  String get title;
  @override
  @DateTimeConverter()
  DateTime get createdAt;
  @override
  @JsonKey(ignore: true)
  _$$_BoardResponseDTOCopyWith<_$_BoardResponseDTO> get copyWith =>
      throw _privateConstructorUsedError;
}
