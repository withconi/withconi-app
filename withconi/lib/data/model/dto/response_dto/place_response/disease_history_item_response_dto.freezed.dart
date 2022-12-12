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
      _$DiseaseHistoryItemResponseDTOCopyWithImpl<$Res,
          DiseaseHistoryItemResponseDTO>;
  @useResult
  $Res call({String diseaseName, int diseasePercent});
}

/// @nodoc
class _$DiseaseHistoryItemResponseDTOCopyWithImpl<$Res,
        $Val extends DiseaseHistoryItemResponseDTO>
    implements $DiseaseHistoryItemResponseDTOCopyWith<$Res> {
  _$DiseaseHistoryItemResponseDTOCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? diseaseName = null,
    Object? diseasePercent = null,
  }) {
    return _then(_value.copyWith(
      diseaseName: null == diseaseName
          ? _value.diseaseName
          : diseaseName // ignore: cast_nullable_to_non_nullable
              as String,
      diseasePercent: null == diseasePercent
          ? _value.diseasePercent
          : diseasePercent // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
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
  @useResult
  $Res call({String diseaseName, int diseasePercent});
}

/// @nodoc
class __$$_DiseaseHistoryResponseDTOCopyWithImpl<$Res>
    extends _$DiseaseHistoryItemResponseDTOCopyWithImpl<$Res,
        _$_DiseaseHistoryResponseDTO>
    implements _$$_DiseaseHistoryResponseDTOCopyWith<$Res> {
  __$$_DiseaseHistoryResponseDTOCopyWithImpl(
      _$_DiseaseHistoryResponseDTO _value,
      $Res Function(_$_DiseaseHistoryResponseDTO) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? diseaseName = null,
    Object? diseasePercent = null,
  }) {
    return _then(_$_DiseaseHistoryResponseDTO(
      diseaseName: null == diseaseName
          ? _value.diseaseName
          : diseaseName // ignore: cast_nullable_to_non_nullable
              as String,
      diseasePercent: null == diseasePercent
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
      {this.diseaseName = '구체적인 질병 없음', this.diseasePercent = 0});

  factory _$_DiseaseHistoryResponseDTO.fromJson(Map<String, dynamic> json) =>
      _$$_DiseaseHistoryResponseDTOFromJson(json);

  @override
  @JsonKey()
  final String diseaseName;
  @override
  @JsonKey()
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
            (identical(other.diseaseName, diseaseName) ||
                other.diseaseName == diseaseName) &&
            (identical(other.diseasePercent, diseasePercent) ||
                other.diseasePercent == diseasePercent));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, diseaseName, diseasePercent);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
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
      {final String diseaseName,
      final int diseasePercent}) = _$_DiseaseHistoryResponseDTO;

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
