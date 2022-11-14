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
  String get diseaseId => throw _privateConstructorUsedError;
  String get diseaseName => throw _privateConstructorUsedError;
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
      _$DiagnosisResultResponseDTOCopyWithImpl<$Res>;
  $Res call(
      {String diseaseId, String diseaseName, DiseasePosibility posibility});
}

/// @nodoc
class _$DiagnosisResultResponseDTOCopyWithImpl<$Res>
    implements $DiagnosisResultResponseDTOCopyWith<$Res> {
  _$DiagnosisResultResponseDTOCopyWithImpl(this._value, this._then);

  final DiagnosisResultResponseDTO _value;
  // ignore: unused_field
  final $Res Function(DiagnosisResultResponseDTO) _then;

  @override
  $Res call({
    Object? diseaseId = freezed,
    Object? diseaseName = freezed,
    Object? posibility = freezed,
  }) {
    return _then(_value.copyWith(
      diseaseId: diseaseId == freezed
          ? _value.diseaseId
          : diseaseId // ignore: cast_nullable_to_non_nullable
              as String,
      diseaseName: diseaseName == freezed
          ? _value.diseaseName
          : diseaseName // ignore: cast_nullable_to_non_nullable
              as String,
      posibility: posibility == freezed
          ? _value.posibility
          : posibility // ignore: cast_nullable_to_non_nullable
              as DiseasePosibility,
    ));
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
  $Res call(
      {String diseaseId, String diseaseName, DiseasePosibility posibility});
}

/// @nodoc
class __$$_DiagnosisResultResponseDTOCopyWithImpl<$Res>
    extends _$DiagnosisResultResponseDTOCopyWithImpl<$Res>
    implements _$$_DiagnosisResultResponseDTOCopyWith<$Res> {
  __$$_DiagnosisResultResponseDTOCopyWithImpl(
      _$_DiagnosisResultResponseDTO _value,
      $Res Function(_$_DiagnosisResultResponseDTO) _then)
      : super(_value, (v) => _then(v as _$_DiagnosisResultResponseDTO));

  @override
  _$_DiagnosisResultResponseDTO get _value =>
      super._value as _$_DiagnosisResultResponseDTO;

  @override
  $Res call({
    Object? diseaseId = freezed,
    Object? diseaseName = freezed,
    Object? posibility = freezed,
  }) {
    return _then(_$_DiagnosisResultResponseDTO(
      diseaseId: diseaseId == freezed
          ? _value.diseaseId
          : diseaseId // ignore: cast_nullable_to_non_nullable
              as String,
      diseaseName: diseaseName == freezed
          ? _value.diseaseName
          : diseaseName // ignore: cast_nullable_to_non_nullable
              as String,
      posibility: posibility == freezed
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
      {required this.diseaseId,
      required this.diseaseName,
      required this.posibility});

  factory _$_DiagnosisResultResponseDTO.fromJson(Map<String, dynamic> json) =>
      _$$_DiagnosisResultResponseDTOFromJson(json);

  @override
  final String diseaseId;
  @override
  final String diseaseName;
  @override
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
            const DeepCollectionEquality().equals(other.diseaseId, diseaseId) &&
            const DeepCollectionEquality()
                .equals(other.diseaseName, diseaseName) &&
            const DeepCollectionEquality()
                .equals(other.posibility, posibility));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(diseaseId),
      const DeepCollectionEquality().hash(diseaseName),
      const DeepCollectionEquality().hash(posibility));

  @JsonKey(ignore: true)
  @override
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
          {required final String diseaseId,
          required final String diseaseName,
          required final DiseasePosibility posibility}) =
      _$_DiagnosisResultResponseDTO;

  factory _DiagnosisResultResponseDTO.fromJson(Map<String, dynamic> json) =
      _$_DiagnosisResultResponseDTO.fromJson;

  @override
  String get diseaseId;
  @override
  String get diseaseName;
  @override
  DiseasePosibility get posibility;
  @override
  @JsonKey(ignore: true)
  _$$_DiagnosisResultResponseDTOCopyWith<_$_DiagnosisResultResponseDTO>
      get copyWith => throw _privateConstructorUsedError;
}