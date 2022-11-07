// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'disease_history_item_response_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

DiseaseHistoryItemResponseDTO _$DiseaseHistoryItemResponseDTOFromJson(
    Map<String, dynamic> json) {
  return _DiseaseHistoryResponseDTO.fromJson(json);
}

/// @nodoc
mixin _$DiseaseHistoryItemResponseDTO {
  String get diseaseName => throw _privateConstructorUsedError;
  int get diseasePercent => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $DiseaseHistoryItemResponseDTOCopyWith<DiseaseHistoryItemResponseDTO>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DiseaseHistoryItemResponseDTOCopyWith<$Res> {
  factory $DiseaseHistoryItemResponseDTOCopyWith(
          DiseaseHistoryItemResponseDTO value,
          $Res Function(DiseaseHistoryItemResponseDTO) then) =
      _$DiseaseHistoryItemResponseDTOCopyWithImpl<$Res>;
  $Res call({String diseaseName, int diseasePercent});
}

/// @nodoc
class _$DiseaseHistoryItemResponseDTOCopyWithImpl<$Res>
    implements $DiseaseHistoryItemResponseDTOCopyWith<$Res> {
  _$DiseaseHistoryItemResponseDTOCopyWithImpl(this._value, this._then);

  final DiseaseHistoryItemResponseDTO _value;
  // ignore: unused_field
  final $Res Function(DiseaseHistoryItemResponseDTO) _then;

  @override
  $Res call({
    Object? diseaseName = freezed,
    Object? diseasePercent = freezed,
  }) {
    return _then(_value.copyWith(
      diseaseName: diseaseName == freezed
          ? _value.diseaseName
          : diseaseName // ignore: cast_nullable_to_non_nullable
              as String,
      diseasePercent: diseasePercent == freezed
          ? _value.diseasePercent
          : diseasePercent // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
abstract class _$$_DiseaseHistoryResponseDTOCopyWith<$Res>
    implements $DiseaseHistoryItemResponseDTOCopyWith<$Res> {
  factory _$$_DiseaseHistoryResponseDTOCopyWith(
          _$_DiseaseHistoryResponseDTO value,
          $Res Function(_$_DiseaseHistoryResponseDTO) then) =
      __$$_DiseaseHistoryResponseDTOCopyWithImpl<$Res>;
  @override
  $Res call({String diseaseName, int diseasePercent});
}

/// @nodoc
class __$$_DiseaseHistoryResponseDTOCopyWithImpl<$Res>
    extends _$DiseaseHistoryItemResponseDTOCopyWithImpl<$Res>
    implements _$$_DiseaseHistoryResponseDTOCopyWith<$Res> {
  __$$_DiseaseHistoryResponseDTOCopyWithImpl(
      _$_DiseaseHistoryResponseDTO _value,
      $Res Function(_$_DiseaseHistoryResponseDTO) _then)
      : super(_value, (v) => _then(v as _$_DiseaseHistoryResponseDTO));

  @override
  _$_DiseaseHistoryResponseDTO get _value =>
      super._value as _$_DiseaseHistoryResponseDTO;

  @override
  $Res call({
    Object? diseaseName = freezed,
    Object? diseasePercent = freezed,
  }) {
    return _then(_$_DiseaseHistoryResponseDTO(
      diseaseName: diseaseName == freezed
          ? _value.diseaseName
          : diseaseName // ignore: cast_nullable_to_non_nullable
              as String,
      diseasePercent: diseasePercent == freezed
          ? _value.diseasePercent
          : diseasePercent // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

@JsonSerializable(explicitToJson: true)
class _$_DiseaseHistoryResponseDTO implements _DiseaseHistoryResponseDTO {
  _$_DiseaseHistoryResponseDTO(
      {required this.diseaseName, required this.diseasePercent});

  factory _$_DiseaseHistoryResponseDTO.fromJson(Map<String, dynamic> json) =>
      _$$_DiseaseHistoryResponseDTOFromJson(json);

  @override
  final String diseaseName;
  @override
  final int diseasePercent;

  @override
  String toString() {
    return 'DiseaseHistoryItemResponseDTO(diseaseName: $diseaseName, diseasePercent: $diseasePercent)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_DiseaseHistoryResponseDTO &&
            const DeepCollectionEquality()
                .equals(other.diseaseName, diseaseName) &&
            const DeepCollectionEquality()
                .equals(other.diseasePercent, diseasePercent));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(diseaseName),
      const DeepCollectionEquality().hash(diseasePercent));

  @JsonKey(ignore: true)
  @override
  _$$_DiseaseHistoryResponseDTOCopyWith<_$_DiseaseHistoryResponseDTO>
      get copyWith => __$$_DiseaseHistoryResponseDTOCopyWithImpl<
          _$_DiseaseHistoryResponseDTO>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_DiseaseHistoryResponseDTOToJson(
      this,
    );
  }
}

abstract class _DiseaseHistoryResponseDTO
    implements DiseaseHistoryItemResponseDTO {
  factory _DiseaseHistoryResponseDTO(
      {required final String diseaseName,
      required final int diseasePercent}) = _$_DiseaseHistoryResponseDTO;

  factory _DiseaseHistoryResponseDTO.fromJson(Map<String, dynamic> json) =
      _$_DiseaseHistoryResponseDTO.fromJson;

  @override
  String get diseaseName;
  @override
  int get diseasePercent;
  @override
  @JsonKey(ignore: true)
  _$$_DiseaseHistoryResponseDTOCopyWith<_$_DiseaseHistoryResponseDTO>
      get copyWith => throw _privateConstructorUsedError;
}
