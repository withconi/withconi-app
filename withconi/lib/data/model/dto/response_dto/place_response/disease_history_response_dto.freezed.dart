// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'disease_history_response_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

DiseaseHistoryResponseDTO _$DiseaseHistoryResponseDTOFromJson(
    Map<String, dynamic> json) {
  return _DiseaseHistoryResponseDTO.fromJson(json);
}

/// @nodoc
mixin _$DiseaseHistoryResponseDTO {
  DiseaseType get diseaseType => throw _privateConstructorUsedError;
  int get totalDiseaseType => throw _privateConstructorUsedError;
  List<DiseaseHistoryItemResponseDTO> get diseaseTypeItemList =>
      throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $DiseaseHistoryResponseDTOCopyWith<DiseaseHistoryResponseDTO> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DiseaseHistoryResponseDTOCopyWith<$Res> {
  factory $DiseaseHistoryResponseDTOCopyWith(DiseaseHistoryResponseDTO value,
          $Res Function(DiseaseHistoryResponseDTO) then) =
      _$DiseaseHistoryResponseDTOCopyWithImpl<$Res, DiseaseHistoryResponseDTO>;
  @useResult
  $Res call(
      {DiseaseType diseaseType,
      int totalDiseaseType,
      List<DiseaseHistoryItemResponseDTO> diseaseTypeItemList});
}

/// @nodoc
class _$DiseaseHistoryResponseDTOCopyWithImpl<$Res,
        $Val extends DiseaseHistoryResponseDTO>
    implements $DiseaseHistoryResponseDTOCopyWith<$Res> {
  _$DiseaseHistoryResponseDTOCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? diseaseType = null,
    Object? totalDiseaseType = null,
    Object? diseaseTypeItemList = null,
  }) {
    return _then(_value.copyWith(
      diseaseType: null == diseaseType
          ? _value.diseaseType
          : diseaseType // ignore: cast_nullable_to_non_nullable
              as DiseaseType,
      totalDiseaseType: null == totalDiseaseType
          ? _value.totalDiseaseType
          : totalDiseaseType // ignore: cast_nullable_to_non_nullable
              as int,
      diseaseTypeItemList: null == diseaseTypeItemList
          ? _value.diseaseTypeItemList
          : diseaseTypeItemList // ignore: cast_nullable_to_non_nullable
              as List<DiseaseHistoryItemResponseDTO>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_DiseaseHistoryResponseDTOCopyWith<$Res>
    implements $DiseaseHistoryResponseDTOCopyWith<$Res> {
  factory _$$_DiseaseHistoryResponseDTOCopyWith(
          _$_DiseaseHistoryResponseDTO value,
          $Res Function(_$_DiseaseHistoryResponseDTO) then) =
      __$$_DiseaseHistoryResponseDTOCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {DiseaseType diseaseType,
      int totalDiseaseType,
      List<DiseaseHistoryItemResponseDTO> diseaseTypeItemList});
}

/// @nodoc
class __$$_DiseaseHistoryResponseDTOCopyWithImpl<$Res>
    extends _$DiseaseHistoryResponseDTOCopyWithImpl<$Res,
        _$_DiseaseHistoryResponseDTO>
    implements _$$_DiseaseHistoryResponseDTOCopyWith<$Res> {
  __$$_DiseaseHistoryResponseDTOCopyWithImpl(
      _$_DiseaseHistoryResponseDTO _value,
      $Res Function(_$_DiseaseHistoryResponseDTO) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? diseaseType = null,
    Object? totalDiseaseType = null,
    Object? diseaseTypeItemList = null,
  }) {
    return _then(_$_DiseaseHistoryResponseDTO(
      diseaseType: null == diseaseType
          ? _value.diseaseType
          : diseaseType // ignore: cast_nullable_to_non_nullable
              as DiseaseType,
      totalDiseaseType: null == totalDiseaseType
          ? _value.totalDiseaseType
          : totalDiseaseType // ignore: cast_nullable_to_non_nullable
              as int,
      diseaseTypeItemList: null == diseaseTypeItemList
          ? _value._diseaseTypeItemList
          : diseaseTypeItemList // ignore: cast_nullable_to_non_nullable
              as List<DiseaseHistoryItemResponseDTO>,
    ));
  }
}

/// @nodoc

@JsonSerializable(explicitToJson: true)
class _$_DiseaseHistoryResponseDTO implements _DiseaseHistoryResponseDTO {
  _$_DiseaseHistoryResponseDTO(
      {this.diseaseType = DiseaseType.undefined,
      this.totalDiseaseType = 0,
      final List<DiseaseHistoryItemResponseDTO> diseaseTypeItemList = const []})
      : _diseaseTypeItemList = diseaseTypeItemList;

  factory _$_DiseaseHistoryResponseDTO.fromJson(Map<String, dynamic> json) =>
      _$$_DiseaseHistoryResponseDTOFromJson(json);

  @override
  @JsonKey()
  final DiseaseType diseaseType;
  @override
  @JsonKey()
  final int totalDiseaseType;
  final List<DiseaseHistoryItemResponseDTO> _diseaseTypeItemList;
  @override
  @JsonKey()
  List<DiseaseHistoryItemResponseDTO> get diseaseTypeItemList {
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_diseaseTypeItemList);
  }

  @override
  String toString() {
    return 'DiseaseHistoryResponseDTO(diseaseType: $diseaseType, totalDiseaseType: $totalDiseaseType, diseaseTypeItemList: $diseaseTypeItemList)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_DiseaseHistoryResponseDTO &&
            (identical(other.diseaseType, diseaseType) ||
                other.diseaseType == diseaseType) &&
            (identical(other.totalDiseaseType, totalDiseaseType) ||
                other.totalDiseaseType == totalDiseaseType) &&
            const DeepCollectionEquality()
                .equals(other._diseaseTypeItemList, _diseaseTypeItemList));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, diseaseType, totalDiseaseType,
      const DeepCollectionEquality().hash(_diseaseTypeItemList));

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

abstract class _DiseaseHistoryResponseDTO implements DiseaseHistoryResponseDTO {
  factory _DiseaseHistoryResponseDTO(
          {final DiseaseType diseaseType,
          final int totalDiseaseType,
          final List<DiseaseHistoryItemResponseDTO> diseaseTypeItemList}) =
      _$_DiseaseHistoryResponseDTO;

  factory _DiseaseHistoryResponseDTO.fromJson(Map<String, dynamic> json) =
      _$_DiseaseHistoryResponseDTO.fromJson;

  @override
  DiseaseType get diseaseType;
  @override
  int get totalDiseaseType;
  @override
  List<DiseaseHistoryItemResponseDTO> get diseaseTypeItemList;
  @override
  @JsonKey(ignore: true)
  _$$_DiseaseHistoryResponseDTOCopyWith<_$_DiseaseHistoryResponseDTO>
      get copyWith => throw _privateConstructorUsedError;
}
