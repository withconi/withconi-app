// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'post_list_response_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

PostListResponseDTO _$PostListResponseDTOFromJson(Map<String, dynamic> json) {
  return _PostListResponseDTO.fromJson(json);
}

/// @nodoc
mixin _$PostListResponseDTO {
  List<PostResponseDTO> get results => throw _privateConstructorUsedError;
  int get totalDocuments => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $PostListResponseDTOCopyWith<PostListResponseDTO> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PostListResponseDTOCopyWith<$Res> {
  factory $PostListResponseDTOCopyWith(
          PostListResponseDTO value, $Res Function(PostListResponseDTO) then) =
      _$PostListResponseDTOCopyWithImpl<$Res>;
  $Res call({List<PostResponseDTO> results, int totalDocuments});
}

/// @nodoc
class _$PostListResponseDTOCopyWithImpl<$Res>
    implements $PostListResponseDTOCopyWith<$Res> {
  _$PostListResponseDTOCopyWithImpl(this._value, this._then);

  final PostListResponseDTO _value;
  // ignore: unused_field
  final $Res Function(PostListResponseDTO) _then;

  @override
  $Res call({
    Object? results = freezed,
    Object? totalDocuments = freezed,
  }) {
    return _then(_value.copyWith(
      results: results == freezed
          ? _value.results
          : results // ignore: cast_nullable_to_non_nullable
              as List<PostResponseDTO>,
      totalDocuments: totalDocuments == freezed
          ? _value.totalDocuments
          : totalDocuments // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
abstract class _$$_PostListResponseDTOCopyWith<$Res>
    implements $PostListResponseDTOCopyWith<$Res> {
  factory _$$_PostListResponseDTOCopyWith(_$_PostListResponseDTO value,
          $Res Function(_$_PostListResponseDTO) then) =
      __$$_PostListResponseDTOCopyWithImpl<$Res>;
  @override
  $Res call({List<PostResponseDTO> results, int totalDocuments});
}

/// @nodoc
class __$$_PostListResponseDTOCopyWithImpl<$Res>
    extends _$PostListResponseDTOCopyWithImpl<$Res>
    implements _$$_PostListResponseDTOCopyWith<$Res> {
  __$$_PostListResponseDTOCopyWithImpl(_$_PostListResponseDTO _value,
      $Res Function(_$_PostListResponseDTO) _then)
      : super(_value, (v) => _then(v as _$_PostListResponseDTO));

  @override
  _$_PostListResponseDTO get _value => super._value as _$_PostListResponseDTO;

  @override
  $Res call({
    Object? results = freezed,
    Object? totalDocuments = freezed,
  }) {
    return _then(_$_PostListResponseDTO(
      results: results == freezed
          ? _value._results
          : results // ignore: cast_nullable_to_non_nullable
              as List<PostResponseDTO>,
      totalDocuments: totalDocuments == freezed
          ? _value.totalDocuments
          : totalDocuments // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

@JsonSerializable(explicitToJson: true)
class _$_PostListResponseDTO implements _PostListResponseDTO {
  _$_PostListResponseDTO(
      {required final List<PostResponseDTO> results,
      required this.totalDocuments})
      : _results = results;

  factory _$_PostListResponseDTO.fromJson(Map<String, dynamic> json) =>
      _$$_PostListResponseDTOFromJson(json);

  final List<PostResponseDTO> _results;
  @override
  List<PostResponseDTO> get results {
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_results);
  }

  @override
  final int totalDocuments;

  @override
  String toString() {
    return 'PostListResponseDTO(results: $results, totalDocuments: $totalDocuments)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_PostListResponseDTO &&
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
  _$$_PostListResponseDTOCopyWith<_$_PostListResponseDTO> get copyWith =>
      __$$_PostListResponseDTOCopyWithImpl<_$_PostListResponseDTO>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_PostListResponseDTOToJson(
      this,
    );
  }
}

abstract class _PostListResponseDTO implements PostListResponseDTO {
  factory _PostListResponseDTO(
      {required final List<PostResponseDTO> results,
      required final int totalDocuments}) = _$_PostListResponseDTO;

  factory _PostListResponseDTO.fromJson(Map<String, dynamic> json) =
      _$_PostListResponseDTO.fromJson;

  @override
  List<PostResponseDTO> get results;
  @override
  int get totalDocuments;
  @override
  @JsonKey(ignore: true)
  _$$_PostListResponseDTOCopyWith<_$_PostListResponseDTO> get copyWith =>
      throw _privateConstructorUsedError;
}
