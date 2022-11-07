// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'disease_history_group_response_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

DiseaseHistoryGroupResponseDTO _$DiseaseHistoryGroupResponseDTOFromJson(
    Map<String, dynamic> json) {
  return _DiseaseHistoryGroupResponseDTO.fromJson(json);
}

/// @nodoc
mixin _$DiseaseHistoryGroupResponseDTO {
  List<DiseaseHistoryResponseDTO> get historyList =>
      throw _privateConstructorUsedError;
  int get totalHistory => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $DiseaseHistoryGroupResponseDTOCopyWith<DiseaseHistoryGroupResponseDTO>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DiseaseHistoryGroupResponseDTOCopyWith<$Res> {
  factory $DiseaseHistoryGroupResponseDTOCopyWith(
          DiseaseHistoryGroupResponseDTO value,
          $Res Function(DiseaseHistoryGroupResponseDTO) then) =
      _$DiseaseHistoryGroupResponseDTOCopyWithImpl<$Res>;
  $Res call({List<DiseaseHistoryResponseDTO> historyList, int totalHistory});
}

/// @nodoc
class _$DiseaseHistoryGroupResponseDTOCopyWithImpl<$Res>
    implements $DiseaseHistoryGroupResponseDTOCopyWith<$Res> {
  _$DiseaseHistoryGroupResponseDTOCopyWithImpl(this._value, this._then);

  final DiseaseHistoryGroupResponseDTO _value;
  // ignore: unused_field
  final $Res Function(DiseaseHistoryGroupResponseDTO) _then;

  @override
  $Res call({
    Object? historyList = freezed,
    Object? totalHistory = freezed,
  }) {
    return _then(_value.copyWith(
      historyList: historyList == freezed
          ? _value.historyList
          : historyList // ignore: cast_nullable_to_non_nullable
              as List<DiseaseHistoryResponseDTO>,
      totalHistory: totalHistory == freezed
          ? _value.totalHistory
          : totalHistory // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
abstract class _$$_DiseaseHistoryGroupResponseDTOCopyWith<$Res>
    implements $DiseaseHistoryGroupResponseDTOCopyWith<$Res> {
  factory _$$_DiseaseHistoryGroupResponseDTOCopyWith(
          _$_DiseaseHistoryGroupResponseDTO value,
          $Res Function(_$_DiseaseHistoryGroupResponseDTO) then) =
      __$$_DiseaseHistoryGroupResponseDTOCopyWithImpl<$Res>;
  @override
  $Res call({List<DiseaseHistoryResponseDTO> historyList, int totalHistory});
}

/// @nodoc
class __$$_DiseaseHistoryGroupResponseDTOCopyWithImpl<$Res>
    extends _$DiseaseHistoryGroupResponseDTOCopyWithImpl<$Res>
    implements _$$_DiseaseHistoryGroupResponseDTOCopyWith<$Res> {
  __$$_DiseaseHistoryGroupResponseDTOCopyWithImpl(
      _$_DiseaseHistoryGroupResponseDTO _value,
      $Res Function(_$_DiseaseHistoryGroupResponseDTO) _then)
      : super(_value, (v) => _then(v as _$_DiseaseHistoryGroupResponseDTO));

  @override
  _$_DiseaseHistoryGroupResponseDTO get _value =>
      super._value as _$_DiseaseHistoryGroupResponseDTO;

  @override
  $Res call({
    Object? historyList = freezed,
    Object? totalHistory = freezed,
  }) {
    return _then(_$_DiseaseHistoryGroupResponseDTO(
      historyList: historyList == freezed
          ? _value._historyList
          : historyList // ignore: cast_nullable_to_non_nullable
              as List<DiseaseHistoryResponseDTO>,
      totalHistory: totalHistory == freezed
          ? _value.totalHistory
          : totalHistory // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

@JsonSerializable(explicitToJson: true)
class _$_DiseaseHistoryGroupResponseDTO
    implements _DiseaseHistoryGroupResponseDTO {
  _$_DiseaseHistoryGroupResponseDTO(
      {required final List<DiseaseHistoryResponseDTO> historyList,
      required this.totalHistory})
      : _historyList = historyList;

  factory _$_DiseaseHistoryGroupResponseDTO.fromJson(
          Map<String, dynamic> json) =>
      _$$_DiseaseHistoryGroupResponseDTOFromJson(json);

  final List<DiseaseHistoryResponseDTO> _historyList;
  @override
  List<DiseaseHistoryResponseDTO> get historyList {
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_historyList);
  }

  @override
  final int totalHistory;

  @override
  String toString() {
    return 'DiseaseHistoryGroupResponseDTO(historyList: $historyList, totalHistory: $totalHistory)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_DiseaseHistoryGroupResponseDTO &&
            const DeepCollectionEquality()
                .equals(other._historyList, _historyList) &&
            const DeepCollectionEquality()
                .equals(other.totalHistory, totalHistory));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_historyList),
      const DeepCollectionEquality().hash(totalHistory));

  @JsonKey(ignore: true)
  @override
  _$$_DiseaseHistoryGroupResponseDTOCopyWith<_$_DiseaseHistoryGroupResponseDTO>
      get copyWith => __$$_DiseaseHistoryGroupResponseDTOCopyWithImpl<
          _$_DiseaseHistoryGroupResponseDTO>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_DiseaseHistoryGroupResponseDTOToJson(
      this,
    );
  }
}

abstract class _DiseaseHistoryGroupResponseDTO
    implements DiseaseHistoryGroupResponseDTO {
  factory _DiseaseHistoryGroupResponseDTO(
      {required final List<DiseaseHistoryResponseDTO> historyList,
      required final int totalHistory}) = _$_DiseaseHistoryGroupResponseDTO;

  factory _DiseaseHistoryGroupResponseDTO.fromJson(Map<String, dynamic> json) =
      _$_DiseaseHistoryGroupResponseDTO.fromJson;

  @override
  List<DiseaseHistoryResponseDTO> get historyList;
  @override
  int get totalHistory;
  @override
  @JsonKey(ignore: true)
  _$$_DiseaseHistoryGroupResponseDTOCopyWith<_$_DiseaseHistoryGroupResponseDTO>
      get copyWith => throw _privateConstructorUsedError;
}
