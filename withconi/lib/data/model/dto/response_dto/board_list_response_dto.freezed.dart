// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'board_list_response_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

BoardListResponseDTO _$BoardListResponseDTOFromJson(Map<String, dynamic> json) {
  return _BoardListResponseDTO.fromJson(json);
}

/// @nodoc
mixin _$BoardListResponseDTO {
  List<BoardResponseDTO> get results => throw _privateConstructorUsedError;
  int get totalDocuments => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $BoardListResponseDTOCopyWith<BoardListResponseDTO> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $BoardListResponseDTOCopyWith<$Res> {
  factory $BoardListResponseDTOCopyWith(BoardListResponseDTO value,
          $Res Function(BoardListResponseDTO) then) =
      _$BoardListResponseDTOCopyWithImpl<$Res>;
  $Res call({List<BoardResponseDTO> results, int totalDocuments});
}

/// @nodoc
class _$BoardListResponseDTOCopyWithImpl<$Res>
    implements $BoardListResponseDTOCopyWith<$Res> {
  _$BoardListResponseDTOCopyWithImpl(this._value, this._then);

  final BoardListResponseDTO _value;
  // ignore: unused_field
  final $Res Function(BoardListResponseDTO) _then;

  @override
  $Res call({
    Object? results = freezed,
    Object? totalDocuments = freezed,
  }) {
    return _then(_value.copyWith(
      results: results == freezed
          ? _value.results
          : results // ignore: cast_nullable_to_non_nullable
              as List<BoardResponseDTO>,
      totalDocuments: totalDocuments == freezed
          ? _value.totalDocuments
          : totalDocuments // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
abstract class _$$_BoardListResponseDTOCopyWith<$Res>
    implements $BoardListResponseDTOCopyWith<$Res> {
  factory _$$_BoardListResponseDTOCopyWith(_$_BoardListResponseDTO value,
          $Res Function(_$_BoardListResponseDTO) then) =
      __$$_BoardListResponseDTOCopyWithImpl<$Res>;
  @override
  $Res call({List<BoardResponseDTO> results, int totalDocuments});
}

/// @nodoc
class __$$_BoardListResponseDTOCopyWithImpl<$Res>
    extends _$BoardListResponseDTOCopyWithImpl<$Res>
    implements _$$_BoardListResponseDTOCopyWith<$Res> {
  __$$_BoardListResponseDTOCopyWithImpl(_$_BoardListResponseDTO _value,
      $Res Function(_$_BoardListResponseDTO) _then)
      : super(_value, (v) => _then(v as _$_BoardListResponseDTO));

  @override
  _$_BoardListResponseDTO get _value => super._value as _$_BoardListResponseDTO;

  @override
  $Res call({
    Object? results = freezed,
    Object? totalDocuments = freezed,
  }) {
    return _then(_$_BoardListResponseDTO(
      results: results == freezed
          ? _value._results
          : results // ignore: cast_nullable_to_non_nullable
              as List<BoardResponseDTO>,
      totalDocuments: totalDocuments == freezed
          ? _value.totalDocuments
          : totalDocuments // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

@JsonSerializable(explicitToJson: true)
class _$_BoardListResponseDTO implements _BoardListResponseDTO {
  _$_BoardListResponseDTO(
      {required final List<BoardResponseDTO> results,
      required this.totalDocuments})
      : _results = results;

  factory _$_BoardListResponseDTO.fromJson(Map<String, dynamic> json) =>
      _$$_BoardListResponseDTOFromJson(json);

  final List<BoardResponseDTO> _results;
  @override
  List<BoardResponseDTO> get results {
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_results);
  }

  @override
  final int totalDocuments;

  @override
  String toString() {
    return 'BoardListResponseDTO(results: $results, totalDocuments: $totalDocuments)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_BoardListResponseDTO &&
            const DeepCollectionEquality().equals(other._results, _results) &&
            const DeepCollectionEquality()
                .equals(other.totalDocuments, totalDocuments));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_results),
      const DeepCollectionEquality().hash(totalDocuments));

  @JsonKey(ignore: true)
  @override
  _$$_BoardListResponseDTOCopyWith<_$_BoardListResponseDTO> get copyWith =>
      __$$_BoardListResponseDTOCopyWithImpl<_$_BoardListResponseDTO>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_BoardListResponseDTOToJson(
      this,
    );
  }
}

abstract class _BoardListResponseDTO implements BoardListResponseDTO {
  factory _BoardListResponseDTO(
      {required final List<BoardResponseDTO> results,
      required final int totalDocuments}) = _$_BoardListResponseDTO;

  factory _BoardListResponseDTO.fromJson(Map<String, dynamic> json) =
      _$_BoardListResponseDTO.fromJson;

  @override
  List<BoardResponseDTO> get results;
  @override
  int get totalDocuments;
  @override
  @JsonKey(ignore: true)
  _$$_BoardListResponseDTOCopyWith<_$_BoardListResponseDTO> get copyWith =>
      throw _privateConstructorUsedError;
}
