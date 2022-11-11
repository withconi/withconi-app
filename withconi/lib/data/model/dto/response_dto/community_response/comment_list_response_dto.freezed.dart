// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'comment_list_response_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

CommentListResponseDTO _$CommentListResponseDTOFromJson(
    Map<String, dynamic> json) {
  return _CommentListResponseDTO.fromJson(json);
}

/// @nodoc
mixin _$CommentListResponseDTO {
  List<CommentResponseDTO> get results => throw _privateConstructorUsedError;
  int get totalDocuments => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $CommentListResponseDTOCopyWith<CommentListResponseDTO> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CommentListResponseDTOCopyWith<$Res> {
  factory $CommentListResponseDTOCopyWith(CommentListResponseDTO value,
          $Res Function(CommentListResponseDTO) then) =
      _$CommentListResponseDTOCopyWithImpl<$Res>;
  $Res call({List<CommentResponseDTO> results, int totalDocuments});
}

/// @nodoc
class _$CommentListResponseDTOCopyWithImpl<$Res>
    implements $CommentListResponseDTOCopyWith<$Res> {
  _$CommentListResponseDTOCopyWithImpl(this._value, this._then);

  final CommentListResponseDTO _value;
  // ignore: unused_field
  final $Res Function(CommentListResponseDTO) _then;

  @override
  $Res call({
    Object? results = freezed,
    Object? totalDocuments = freezed,
  }) {
    return _then(_value.copyWith(
      results: results == freezed
          ? _value.results
          : results // ignore: cast_nullable_to_non_nullable
              as List<CommentResponseDTO>,
      totalDocuments: totalDocuments == freezed
          ? _value.totalDocuments
          : totalDocuments // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
abstract class _$$_CommentListResponseDTOCopyWith<$Res>
    implements $CommentListResponseDTOCopyWith<$Res> {
  factory _$$_CommentListResponseDTOCopyWith(_$_CommentListResponseDTO value,
          $Res Function(_$_CommentListResponseDTO) then) =
      __$$_CommentListResponseDTOCopyWithImpl<$Res>;
  @override
  $Res call({List<CommentResponseDTO> results, int totalDocuments});
}

/// @nodoc
class __$$_CommentListResponseDTOCopyWithImpl<$Res>
    extends _$CommentListResponseDTOCopyWithImpl<$Res>
    implements _$$_CommentListResponseDTOCopyWith<$Res> {
  __$$_CommentListResponseDTOCopyWithImpl(_$_CommentListResponseDTO _value,
      $Res Function(_$_CommentListResponseDTO) _then)
      : super(_value, (v) => _then(v as _$_CommentListResponseDTO));

  @override
  _$_CommentListResponseDTO get _value =>
      super._value as _$_CommentListResponseDTO;

  @override
  $Res call({
    Object? results = freezed,
    Object? totalDocuments = freezed,
  }) {
    return _then(_$_CommentListResponseDTO(
      results: results == freezed
          ? _value._results
          : results // ignore: cast_nullable_to_non_nullable
              as List<CommentResponseDTO>,
      totalDocuments: totalDocuments == freezed
          ? _value.totalDocuments
          : totalDocuments // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

@JsonSerializable(explicitToJson: true)
class _$_CommentListResponseDTO implements _CommentListResponseDTO {
  _$_CommentListResponseDTO(
      {required final List<CommentResponseDTO> results,
      required this.totalDocuments})
      : _results = results;

  factory _$_CommentListResponseDTO.fromJson(Map<String, dynamic> json) =>
      _$$_CommentListResponseDTOFromJson(json);

  final List<CommentResponseDTO> _results;
  @override
  List<CommentResponseDTO> get results {
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_results);
  }

  @override
  final int totalDocuments;

  @override
  String toString() {
    return 'CommentListResponseDTO(results: $results, totalDocuments: $totalDocuments)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_CommentListResponseDTO &&
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
  _$$_CommentListResponseDTOCopyWith<_$_CommentListResponseDTO> get copyWith =>
      __$$_CommentListResponseDTOCopyWithImpl<_$_CommentListResponseDTO>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_CommentListResponseDTOToJson(
      this,
    );
  }
}

abstract class _CommentListResponseDTO implements CommentListResponseDTO {
  factory _CommentListResponseDTO(
      {required final List<CommentResponseDTO> results,
      required final int totalDocuments}) = _$_CommentListResponseDTO;

  factory _CommentListResponseDTO.fromJson(Map<String, dynamic> json) =
      _$_CommentListResponseDTO.fromJson;

  @override
  List<CommentResponseDTO> get results;
  @override
  int get totalDocuments;
  @override
  @JsonKey(ignore: true)
  _$$_CommentListResponseDTOCopyWith<_$_CommentListResponseDTO> get copyWith =>
      throw _privateConstructorUsedError;
}
