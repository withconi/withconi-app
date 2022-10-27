// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'disease_result.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

DiseaseResult _$DiseaseResultFromJson(Map<String, dynamic> json) {
  return _DiseaseResult.fromJson(json);
}

/// @nodoc
mixin _$DiseaseResult {
  String get diseaseId => throw _privateConstructorUsedError;
  String get diseaseName => throw _privateConstructorUsedError;
  DiseasePosibility get posibility => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $DiseaseResultCopyWith<DiseaseResult> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DiseaseResultCopyWith<$Res> {
  factory $DiseaseResultCopyWith(
          DiseaseResult value, $Res Function(DiseaseResult) then) =
      _$DiseaseResultCopyWithImpl<$Res>;
  $Res call(
      {String diseaseId, String diseaseName, DiseasePosibility posibility});
}

/// @nodoc
class _$DiseaseResultCopyWithImpl<$Res>
    implements $DiseaseResultCopyWith<$Res> {
  _$DiseaseResultCopyWithImpl(this._value, this._then);

  final DiseaseResult _value;
  // ignore: unused_field
  final $Res Function(DiseaseResult) _then;

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
abstract class _$$_DiseaseResultCopyWith<$Res>
    implements $DiseaseResultCopyWith<$Res> {
  factory _$$_DiseaseResultCopyWith(
          _$_DiseaseResult value, $Res Function(_$_DiseaseResult) then) =
      __$$_DiseaseResultCopyWithImpl<$Res>;
  @override
  $Res call(
      {String diseaseId, String diseaseName, DiseasePosibility posibility});
}

/// @nodoc
class __$$_DiseaseResultCopyWithImpl<$Res>
    extends _$DiseaseResultCopyWithImpl<$Res>
    implements _$$_DiseaseResultCopyWith<$Res> {
  __$$_DiseaseResultCopyWithImpl(
      _$_DiseaseResult _value, $Res Function(_$_DiseaseResult) _then)
      : super(_value, (v) => _then(v as _$_DiseaseResult));

  @override
  _$_DiseaseResult get _value => super._value as _$_DiseaseResult;

  @override
  $Res call({
    Object? diseaseId = freezed,
    Object? diseaseName = freezed,
    Object? posibility = freezed,
  }) {
    return _then(_$_DiseaseResult(
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
class _$_DiseaseResult implements _DiseaseResult {
  _$_DiseaseResult(
      {required this.diseaseId,
      required this.diseaseName,
      required this.posibility});

  factory _$_DiseaseResult.fromJson(Map<String, dynamic> json) =>
      _$$_DiseaseResultFromJson(json);

  @override
  final String diseaseId;
  @override
  final String diseaseName;
  @override
  final DiseasePosibility posibility;

  @override
  String toString() {
    return 'DiseaseResult(diseaseId: $diseaseId, diseaseName: $diseaseName, posibility: $posibility)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_DiseaseResult &&
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
  _$$_DiseaseResultCopyWith<_$_DiseaseResult> get copyWith =>
      __$$_DiseaseResultCopyWithImpl<_$_DiseaseResult>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_DiseaseResultToJson(
      this,
    );
  }
}

abstract class _DiseaseResult implements DiseaseResult {
  factory _DiseaseResult(
      {required final String diseaseId,
      required final String diseaseName,
      required final DiseasePosibility posibility}) = _$_DiseaseResult;

  factory _DiseaseResult.fromJson(Map<String, dynamic> json) =
      _$_DiseaseResult.fromJson;

  @override
  String get diseaseId;
  @override
  String get diseaseName;
  @override
  DiseasePosibility get posibility;
  @override
  @JsonKey(ignore: true)
  _$$_DiseaseResultCopyWith<_$_DiseaseResult> get copyWith =>
      throw _privateConstructorUsedError;
}
