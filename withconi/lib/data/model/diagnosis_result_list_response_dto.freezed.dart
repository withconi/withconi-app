// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'diagnosis_result_list_response_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

DiagnosisResultListResponseDTO _$DiagnosisResultListResponseDTOFromJson(
    Map<String, dynamic> json) {
  return _DiagnosisResultListResponseDTO.fromJson(json);
}

/// @nodoc
mixin _$DiagnosisResultListResponseDTO {
  List<DiagnosisResultResponseDTO> get list =>
      throw _privateConstructorUsedError;
  int get totalDocuments => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $DiagnosisResultListResponseDTOCopyWith<DiagnosisResultListResponseDTO>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DiagnosisResultListResponseDTOCopyWith<$Res> {
  factory $DiagnosisResultListResponseDTOCopyWith(
          DiagnosisResultListResponseDTO value,
          $Res Function(DiagnosisResultListResponseDTO) then) =
      _$DiagnosisResultListResponseDTOCopyWithImpl<$Res,
          DiagnosisResultListResponseDTO>;
  @useResult
  $Res call({List<DiagnosisResultResponseDTO> list, int totalDocuments});
}

/// @nodoc
class _$DiagnosisResultListResponseDTOCopyWithImpl<$Res,
        $Val extends DiagnosisResultListResponseDTO>
    implements $DiagnosisResultListResponseDTOCopyWith<$Res> {
  _$DiagnosisResultListResponseDTOCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? list = null,
    Object? totalDocuments = null,
  }) {
    return _then(_value.copyWith(
      list: null == list
          ? _value.list
          : list // ignore: cast_nullable_to_non_nullable
              as List<DiagnosisResultResponseDTO>,
      totalDocuments: null == totalDocuments
          ? _value.totalDocuments
          : totalDocuments // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_DiagnosisResultListResponseDTOCopyWith<$Res>
    implements $DiagnosisResultListResponseDTOCopyWith<$Res> {
  factory _$$_DiagnosisResultListResponseDTOCopyWith(
          _$_DiagnosisResultListResponseDTO value,
          $Res Function(_$_DiagnosisResultListResponseDTO) then) =
      __$$_DiagnosisResultListResponseDTOCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({List<DiagnosisResultResponseDTO> list, int totalDocuments});
}

/// @nodoc
class __$$_DiagnosisResultListResponseDTOCopyWithImpl<$Res>
    extends _$DiagnosisResultListResponseDTOCopyWithImpl<$Res,
        _$_DiagnosisResultListResponseDTO>
    implements _$$_DiagnosisResultListResponseDTOCopyWith<$Res> {
  __$$_DiagnosisResultListResponseDTOCopyWithImpl(
      _$_DiagnosisResultListResponseDTO _value,
      $Res Function(_$_DiagnosisResultListResponseDTO) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? list = null,
    Object? totalDocuments = null,
  }) {
    return _then(_$_DiagnosisResultListResponseDTO(
      list: null == list
          ? _value._list
          : list // ignore: cast_nullable_to_non_nullable
              as List<DiagnosisResultResponseDTO>,
      totalDocuments: null == totalDocuments
          ? _value.totalDocuments
          : totalDocuments // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

@JsonSerializable(explicitToJson: true)
class _$_DiagnosisResultListResponseDTO
    implements _DiagnosisResultListResponseDTO {
  _$_DiagnosisResultListResponseDTO(
      {required final List<DiagnosisResultResponseDTO> list,
      required this.totalDocuments})
      : _list = list;

  factory _$_DiagnosisResultListResponseDTO.fromJson(
          Map<String, dynamic> json) =>
      _$$_DiagnosisResultListResponseDTOFromJson(json);

  final List<DiagnosisResultResponseDTO> _list;
  @override
  List<DiagnosisResultResponseDTO> get list {
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_list);
  }

  @override
  final int totalDocuments;

  @override
  String toString() {
    return 'DiagnosisResultListResponseDTO(list: $list, totalDocuments: $totalDocuments)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_DiagnosisResultListResponseDTO &&
            const DeepCollectionEquality().equals(other._list, _list) &&
            (identical(other.totalDocuments, totalDocuments) ||
                other.totalDocuments == totalDocuments));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(_list), totalDocuments);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_DiagnosisResultListResponseDTOCopyWith<_$_DiagnosisResultListResponseDTO>
      get copyWith => __$$_DiagnosisResultListResponseDTOCopyWithImpl<
          _$_DiagnosisResultListResponseDTO>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_DiagnosisResultListResponseDTOToJson(
      this,
    );
  }
}

abstract class _DiagnosisResultListResponseDTO
    implements DiagnosisResultListResponseDTO {
  factory _DiagnosisResultListResponseDTO(
      {required final List<DiagnosisResultResponseDTO> list,
      required final int totalDocuments}) = _$_DiagnosisResultListResponseDTO;

  factory _DiagnosisResultListResponseDTO.fromJson(Map<String, dynamic> json) =
      _$_DiagnosisResultListResponseDTO.fromJson;

  @override
  List<DiagnosisResultResponseDTO> get list;
  @override
  int get totalDocuments;
  @override
  @JsonKey(ignore: true)
  _$$_DiagnosisResultListResponseDTOCopyWith<_$_DiagnosisResultListResponseDTO>
      get copyWith => throw _privateConstructorUsedError;
}
