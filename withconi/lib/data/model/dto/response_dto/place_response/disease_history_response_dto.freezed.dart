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
  List<DiseaseHistoryItemResponseDTO> get diseaseHistoryItems =>
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
      _$DiseaseHistoryResponseDTOCopyWithImpl<$Res>;
  $Res call(
      {DiseaseType diseaseType,
      int totalDiseaseType,
      List<DiseaseHistoryItemResponseDTO> diseaseHistoryItems});
}

/// @nodoc
class _$DiseaseHistoryResponseDTOCopyWithImpl<$Res>
    implements $DiseaseHistoryResponseDTOCopyWith<$Res> {
  _$DiseaseHistoryResponseDTOCopyWithImpl(this._value, this._then);

  final DiseaseHistoryResponseDTO _value;
  // ignore: unused_field
  final $Res Function(DiseaseHistoryResponseDTO) _then;

  @override
  $Res call({
    Object? diseaseType = freezed,
    Object? totalDiseaseType = freezed,
    Object? diseaseHistoryItems = freezed,
  }) {
    return _then(_value.copyWith(
      diseaseType: diseaseType == freezed
          ? _value.diseaseType
          : diseaseType // ignore: cast_nullable_to_non_nullable
              as DiseaseType,
      totalDiseaseType: totalDiseaseType == freezed
          ? _value.totalDiseaseType
          : totalDiseaseType // ignore: cast_nullable_to_non_nullable
              as int,
      diseaseHistoryItems: diseaseHistoryItems == freezed
          ? _value.diseaseHistoryItems
          : diseaseHistoryItems // ignore: cast_nullable_to_non_nullable
              as List<DiseaseHistoryItemResponseDTO>,
    ));
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
  $Res call(
      {DiseaseType diseaseType,
      int totalDiseaseType,
      List<DiseaseHistoryItemResponseDTO> diseaseHistoryItems});
}

/// @nodoc
class __$$_DiseaseHistoryResponseDTOCopyWithImpl<$Res>
    extends _$DiseaseHistoryResponseDTOCopyWithImpl<$Res>
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
    Object? diseaseType = freezed,
    Object? totalDiseaseType = freezed,
    Object? diseaseHistoryItems = freezed,
  }) {
    return _then(_$_DiseaseHistoryResponseDTO(
      diseaseType: diseaseType == freezed
          ? _value.diseaseType
          : diseaseType // ignore: cast_nullable_to_non_nullable
              as DiseaseType,
      totalDiseaseType: totalDiseaseType == freezed
          ? _value.totalDiseaseType
          : totalDiseaseType // ignore: cast_nullable_to_non_nullable
              as int,
      diseaseHistoryItems: diseaseHistoryItems == freezed
          ? _value._diseaseHistoryItems
          : diseaseHistoryItems // ignore: cast_nullable_to_non_nullable
              as List<DiseaseHistoryItemResponseDTO>,
    ));
  }
}

/// @nodoc

@JsonSerializable(explicitToJson: true)
class _$_DiseaseHistoryResponseDTO implements _DiseaseHistoryResponseDTO {
  _$_DiseaseHistoryResponseDTO(
      {required this.diseaseType,
      required this.totalDiseaseType,
      required final List<DiseaseHistoryItemResponseDTO> diseaseHistoryItems})
      : _diseaseHistoryItems = diseaseHistoryItems;

  factory _$_DiseaseHistoryResponseDTO.fromJson(Map<String, dynamic> json) =>
      _$$_DiseaseHistoryResponseDTOFromJson(json);

  @override
  final DiseaseType diseaseType;
  @override
  final int totalDiseaseType;
  final List<DiseaseHistoryItemResponseDTO> _diseaseHistoryItems;
  @override
  List<DiseaseHistoryItemResponseDTO> get diseaseHistoryItems {
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_diseaseHistoryItems);
  }

  @override
  String toString() {
    return 'DiseaseHistoryResponseDTO(diseaseType: $diseaseType, totalDiseaseType: $totalDiseaseType, diseaseHistoryItems: $diseaseHistoryItems)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_DiseaseHistoryResponseDTO &&
            const DeepCollectionEquality()
                .equals(other.diseaseType, diseaseType) &&
            const DeepCollectionEquality()
                .equals(other.totalDiseaseType, totalDiseaseType) &&
            const DeepCollectionEquality()
                .equals(other._diseaseHistoryItems, _diseaseHistoryItems));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(diseaseType),
      const DeepCollectionEquality().hash(totalDiseaseType),
      const DeepCollectionEquality().hash(_diseaseHistoryItems));

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

abstract class _DiseaseHistoryResponseDTO implements DiseaseHistoryResponseDTO {
  factory _DiseaseHistoryResponseDTO(
      {required final DiseaseType diseaseType,
      required final int totalDiseaseType,
      required final List<DiseaseHistoryItemResponseDTO>
          diseaseHistoryItems}) = _$_DiseaseHistoryResponseDTO;

  factory _DiseaseHistoryResponseDTO.fromJson(Map<String, dynamic> json) =
      _$_DiseaseHistoryResponseDTO.fromJson;

  @override
  DiseaseType get diseaseType;
  @override
  int get totalDiseaseType;
  @override
  List<DiseaseHistoryItemResponseDTO> get diseaseHistoryItems;
  @override
  @JsonKey(ignore: true)
  _$$_DiseaseHistoryResponseDTOCopyWith<_$_DiseaseHistoryResponseDTO>
      get copyWith => throw _privateConstructorUsedError;
}
