// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'review_list_response_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

ReviewListResponseDTO _$ReviewListResponseDTOFromJson(
    Map<String, dynamic> json) {
  return _ReviewListResponseDTO.fromJson(json);
}

/// @nodoc
mixin _$ReviewListResponseDTO {
  List<ReviewDetailResponseDTO> get results =>
      throw _privateConstructorUsedError;
  int get totalDocuments => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ReviewListResponseDTOCopyWith<ReviewListResponseDTO> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ReviewListResponseDTOCopyWith<$Res> {
  factory $ReviewListResponseDTOCopyWith(ReviewListResponseDTO value,
          $Res Function(ReviewListResponseDTO) then) =
      _$ReviewListResponseDTOCopyWithImpl<$Res>;
  $Res call({List<ReviewDetailResponseDTO> results, int totalDocuments});
}

/// @nodoc
class _$ReviewListResponseDTOCopyWithImpl<$Res>
    implements $ReviewListResponseDTOCopyWith<$Res> {
  _$ReviewListResponseDTOCopyWithImpl(this._value, this._then);

  final ReviewListResponseDTO _value;
  // ignore: unused_field
  final $Res Function(ReviewListResponseDTO) _then;

  @override
  $Res call({
    Object? results = freezed,
    Object? totalDocuments = freezed,
  }) {
    return _then(_value.copyWith(
      results: results == freezed
          ? _value.results
          : results // ignore: cast_nullable_to_non_nullable
              as List<ReviewDetailResponseDTO>,
      totalDocuments: totalDocuments == freezed
          ? _value.totalDocuments
          : totalDocuments // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
abstract class _$$_ReviewListResponseDTOCopyWith<$Res>
    implements $ReviewListResponseDTOCopyWith<$Res> {
  factory _$$_ReviewListResponseDTOCopyWith(_$_ReviewListResponseDTO value,
          $Res Function(_$_ReviewListResponseDTO) then) =
      __$$_ReviewListResponseDTOCopyWithImpl<$Res>;
  @override
  $Res call({List<ReviewDetailResponseDTO> results, int totalDocuments});
}

/// @nodoc
class __$$_ReviewListResponseDTOCopyWithImpl<$Res>
    extends _$ReviewListResponseDTOCopyWithImpl<$Res>
    implements _$$_ReviewListResponseDTOCopyWith<$Res> {
  __$$_ReviewListResponseDTOCopyWithImpl(_$_ReviewListResponseDTO _value,
      $Res Function(_$_ReviewListResponseDTO) _then)
      : super(_value, (v) => _then(v as _$_ReviewListResponseDTO));

  @override
  _$_ReviewListResponseDTO get _value =>
      super._value as _$_ReviewListResponseDTO;

  @override
  $Res call({
    Object? results = freezed,
    Object? totalDocuments = freezed,
  }) {
    return _then(_$_ReviewListResponseDTO(
      results: results == freezed
          ? _value._results
          : results // ignore: cast_nullable_to_non_nullable
              as List<ReviewDetailResponseDTO>,
      totalDocuments: totalDocuments == freezed
          ? _value.totalDocuments
          : totalDocuments // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

@JsonSerializable(explicitToJson: true)
class _$_ReviewListResponseDTO implements _ReviewListResponseDTO {
  _$_ReviewListResponseDTO(
      {required final List<ReviewDetailResponseDTO> results,
      required this.totalDocuments})
      : _results = results;

  factory _$_ReviewListResponseDTO.fromJson(Map<String, dynamic> json) =>
      _$$_ReviewListResponseDTOFromJson(json);

  final List<ReviewDetailResponseDTO> _results;
  @override
  List<ReviewDetailResponseDTO> get results {
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_results);
  }

  @override
  final int totalDocuments;

  @override
  String toString() {
    return 'ReviewListResponseDTO(results: $results, totalDocuments: $totalDocuments)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_ReviewListResponseDTO &&
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
  _$$_ReviewListResponseDTOCopyWith<_$_ReviewListResponseDTO> get copyWith =>
      __$$_ReviewListResponseDTOCopyWithImpl<_$_ReviewListResponseDTO>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_ReviewListResponseDTOToJson(
      this,
    );
  }
}

abstract class _ReviewListResponseDTO implements ReviewListResponseDTO {
  factory _ReviewListResponseDTO(
      {required final List<ReviewDetailResponseDTO> results,
      required final int totalDocuments}) = _$_ReviewListResponseDTO;

  factory _ReviewListResponseDTO.fromJson(Map<String, dynamic> json) =
      _$_ReviewListResponseDTO.fromJson;

  @override
  List<ReviewDetailResponseDTO> get results;
  @override
  int get totalDocuments;
  @override
  @JsonKey(ignore: true)
  _$$_ReviewListResponseDTOCopyWith<_$_ReviewListResponseDTO> get copyWith =>
      throw _privateConstructorUsedError;
}
