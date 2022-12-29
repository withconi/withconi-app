// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'diagnosis_result_response_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

DiagnosisResultResponseDTO _$DiagnosisResultResponseDTOFromJson(
    Map<String, dynamic> json) {
  return _DiagnosisResultResponseDTO.fromJson(json);
}

/// @nodoc
mixin _$DiagnosisResultResponseDTO {
  @JsonKey(name: '_id')
  String get diseaseId => throw _privateConstructorUsedError;
  @JsonKey(name: 'name')
  String get diseaseName => throw _privateConstructorUsedError;
  @JsonKey(name: 'status')
  DiseasePosibility get posibility => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $DiagnosisResultResponseDTOCopyWith<DiagnosisResultResponseDTO>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DiagnosisResultResponseDTOCopyWith<$Res> {
  factory $DiagnosisResultResponseDTOCopyWith(DiagnosisResultResponseDTO value,
          $Res Function(DiagnosisResultResponseDTO) then) =
      _$DiagnosisResultResponseDTOCopyWithImpl<$Res,
          DiagnosisResultResponseDTO>;
  @useResult
  $Res call(
      {@JsonKey(name: '_id') String diseaseId,
      @JsonKey(name: 'name') String diseaseName,
      @JsonKey(name: 'status') DiseasePosibility posibility});
}

/// @nodoc
class _$DiagnosisResultResponseDTOCopyWithImpl<$Res,
        $Val extends DiagnosisResultResponseDTO>
    implements $DiagnosisResultResponseDTOCopyWith<$Res> {
  _$DiagnosisResultResponseDTOCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? diseaseId = null,
    Object? diseaseName = null,
    Object? posibility = null,
  }) {
    return _then(_value.copyWith(
      diseaseId: null == diseaseId
          ? _value.diseaseId
          : diseaseId // ignore: cast_nullable_to_non_nullable
              as String,
      diseaseName: null == diseaseName
          ? _value.diseaseName
          : diseaseName // ignore: cast_nullable_to_non_nullable
              as String,
      posibility: null == posibility
          ? _value.posibility
          : posibility // ignore: cast_nullable_to_non_nullable
              as DiseasePosibility,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_DiagnosisResultResponseDTOCopyWith<$Res>
    implements $DiagnosisResultResponseDTOCopyWith<$Res> {
  factory _$$_DiagnosisResultResponseDTOCopyWith(
          _$_DiagnosisResultResponseDTO value,
          $Res Function(_$_DiagnosisResultResponseDTO) then) =
      __$$_DiagnosisResultResponseDTOCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: '_id') String diseaseId,
      @JsonKey(name: 'name') String diseaseName,
      @JsonKey(name: 'status') DiseasePosibility posibility});
}

/// @nodoc
class __$$_DiagnosisResultResponseDTOCopyWithImpl<$Res>
    extends _$DiagnosisResultResponseDTOCopyWithImpl<$Res,
        _$_DiagnosisResultResponseDTO>
    implements _$$_DiagnosisResultResponseDTOCopyWith<$Res> {
  __$$_DiagnosisResultResponseDTOCopyWithImpl(
      _$_DiagnosisResultResponseDTO _value,
      $Res Function(_$_DiagnosisResultResponseDTO) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? diseaseId = null,
    Object? diseaseName = null,
    Object? posibility = null,
  }) {
    return _then(_$_DiagnosisResultResponseDTO(
      diseaseId: null == diseaseId
          ? _value.diseaseId
          : diseaseId // ignore: cast_nullable_to_non_nullable
              as String,
      diseaseName: null == diseaseName
          ? _value.diseaseName
          : diseaseName // ignore: cast_nullable_to_non_nullable
              as String,
      posibility: null == posibility
          ? _value.posibility
          : posibility // ignore: cast_nullable_to_non_nullable
              as DiseasePosibility,
    ));
  }
}

/// @nodoc

@JsonSerializable(explicitToJson: true)
class _$_DiagnosisResultResponseDTO implements _DiagnosisResultResponseDTO {
  _$_DiagnosisResultResponseDTO(
      {@JsonKey(name: '_id') this.diseaseId = '',
      @JsonKey(name: 'name') required this.diseaseName,
      @JsonKey(name: 'status') required this.posibility});

  factory _$_DiagnosisResultResponseDTO.fromJson(Map<String, dynamic> json) =>
      _$$_DiagnosisResultResponseDTOFromJson(json);

  @override
  @JsonKey(name: '_id')
  final String diseaseId;
  @override
  @JsonKey(name: 'name')
  final String diseaseName;
  @override
  @JsonKey(name: 'status')
  final DiseasePosibility posibility;

  @override
  String toString() {
    return 'DiagnosisResultResponseDTO(diseaseId: $diseaseId, diseaseName: $diseaseName, posibility: $posibility)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_DiagnosisResultResponseDTO &&
            (identical(other.diseaseId, diseaseId) ||
                other.diseaseId == diseaseId) &&
            (identical(other.diseaseName, diseaseName) ||
                other.diseaseName == diseaseName) &&
            (identical(other.posibility, posibility) ||
                other.posibility == posibility));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, diseaseId, diseaseName, posibility);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_DiagnosisResultResponseDTOCopyWith<_$_DiagnosisResultResponseDTO>
      get copyWith => __$$_DiagnosisResultResponseDTOCopyWithImpl<
          _$_DiagnosisResultResponseDTO>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_DiagnosisResultResponseDTOToJson(
      this,
    );
  }
}

abstract class _DiagnosisResultResponseDTO
    implements DiagnosisResultResponseDTO {
  factory _DiagnosisResultResponseDTO(
          {@JsonKey(name: '_id')
              final String diseaseId,
          @JsonKey(name: 'name')
              required final String diseaseName,
          @JsonKey(name: 'status')
              required final DiseasePosibility posibility}) =
      _$_DiagnosisResultResponseDTO;

  factory _DiagnosisResultResponseDTO.fromJson(Map<String, dynamic> json) =
      _$_DiagnosisResultResponseDTO.fromJson;

  @override
  @JsonKey(name: '_id')
  String get diseaseId;
  @override
  @JsonKey(name: 'name')
  String get diseaseName;
  @override
  @JsonKey(name: 'status')
  DiseasePosibility get posibility;
  @override
  @JsonKey(ignore: true)
  _$$_DiagnosisResultResponseDTOCopyWith<_$_DiagnosisResultResponseDTO>
      get copyWith => throw _privateConstructorUsedError;
}
