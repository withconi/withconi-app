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

DiseaseHistoryListResponseDTO _$DiseaseHistoryListResponseDTOFromJson(
    Map<String, dynamic> json) {
  return _DiseaseHistoryListResponseDTO.fromJson(json);
}

/// @nodoc
mixin _$DiseaseHistoryListResponseDTO {
  List<DiseaseHistoryResponseDTO> get diseaseHistoryList =>
      throw _privateConstructorUsedError;
  @JsonKey(name: 'totalDiseases')
  int get totalDiseaseHistoryCount => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $DiseaseHistoryListResponseDTOCopyWith<DiseaseHistoryListResponseDTO>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DiseaseHistoryListResponseDTOCopyWith<$Res> {
  factory $DiseaseHistoryListResponseDTOCopyWith(
          DiseaseHistoryListResponseDTO value,
          $Res Function(DiseaseHistoryListResponseDTO) then) =
      _$DiseaseHistoryListResponseDTOCopyWithImpl<$Res,
          DiseaseHistoryListResponseDTO>;
  @useResult
  $Res call(
      {List<DiseaseHistoryResponseDTO> diseaseHistoryList,
      @JsonKey(name: 'totalDiseases') int totalDiseaseHistoryCount});
}

/// @nodoc
class _$DiseaseHistoryListResponseDTOCopyWithImpl<$Res,
        $Val extends DiseaseHistoryListResponseDTO>
    implements $DiseaseHistoryListResponseDTOCopyWith<$Res> {
  _$DiseaseHistoryListResponseDTOCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? diseaseHistoryList = null,
    Object? totalDiseaseHistoryCount = null,
  }) {
    return _then(_value.copyWith(
      diseaseHistoryList: null == diseaseHistoryList
          ? _value.diseaseHistoryList
          : diseaseHistoryList // ignore: cast_nullable_to_non_nullable
              as List<DiseaseHistoryResponseDTO>,
      totalDiseaseHistoryCount: null == totalDiseaseHistoryCount
          ? _value.totalDiseaseHistoryCount
          : totalDiseaseHistoryCount // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_DiseaseHistoryListResponseDTOCopyWith<$Res>
    implements $DiseaseHistoryListResponseDTOCopyWith<$Res> {
  factory _$$_DiseaseHistoryListResponseDTOCopyWith(
          _$_DiseaseHistoryListResponseDTO value,
          $Res Function(_$_DiseaseHistoryListResponseDTO) then) =
      __$$_DiseaseHistoryListResponseDTOCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {List<DiseaseHistoryResponseDTO> diseaseHistoryList,
      @JsonKey(name: 'totalDiseases') int totalDiseaseHistoryCount});
}

/// @nodoc
class __$$_DiseaseHistoryListResponseDTOCopyWithImpl<$Res>
    extends _$DiseaseHistoryListResponseDTOCopyWithImpl<$Res,
        _$_DiseaseHistoryListResponseDTO>
    implements _$$_DiseaseHistoryListResponseDTOCopyWith<$Res> {
  __$$_DiseaseHistoryListResponseDTOCopyWithImpl(
      _$_DiseaseHistoryListResponseDTO _value,
      $Res Function(_$_DiseaseHistoryListResponseDTO) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? diseaseHistoryList = null,
    Object? totalDiseaseHistoryCount = null,
  }) {
    return _then(_$_DiseaseHistoryListResponseDTO(
      diseaseHistoryList: null == diseaseHistoryList
          ? _value._diseaseHistoryList
          : diseaseHistoryList // ignore: cast_nullable_to_non_nullable
              as List<DiseaseHistoryResponseDTO>,
      totalDiseaseHistoryCount: null == totalDiseaseHistoryCount
          ? _value.totalDiseaseHistoryCount
          : totalDiseaseHistoryCount // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

@JsonSerializable(explicitToJson: true)
class _$_DiseaseHistoryListResponseDTO
    implements _DiseaseHistoryListResponseDTO {
  _$_DiseaseHistoryListResponseDTO(
      {required final List<DiseaseHistoryResponseDTO> diseaseHistoryList,
      @JsonKey(name: 'totalDiseases') required this.totalDiseaseHistoryCount})
      : _diseaseHistoryList = diseaseHistoryList;

  factory _$_DiseaseHistoryListResponseDTO.fromJson(
          Map<String, dynamic> json) =>
      _$$_DiseaseHistoryListResponseDTOFromJson(json);

  final List<DiseaseHistoryResponseDTO> _diseaseHistoryList;
  @override
  List<DiseaseHistoryResponseDTO> get diseaseHistoryList {
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_diseaseHistoryList);
  }

  @override
  @JsonKey(name: 'totalDiseases')
  final int totalDiseaseHistoryCount;

  @override
  String toString() {
    return 'DiseaseHistoryListResponseDTO(diseaseHistoryList: $diseaseHistoryList, totalDiseaseHistoryCount: $totalDiseaseHistoryCount)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_DiseaseHistoryListResponseDTO &&
            const DeepCollectionEquality()
                .equals(other._diseaseHistoryList, _diseaseHistoryList) &&
            (identical(
                    other.totalDiseaseHistoryCount, totalDiseaseHistoryCount) ||
                other.totalDiseaseHistoryCount == totalDiseaseHistoryCount));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_diseaseHistoryList),
      totalDiseaseHistoryCount);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_DiseaseHistoryListResponseDTOCopyWith<_$_DiseaseHistoryListResponseDTO>
      get copyWith => __$$_DiseaseHistoryListResponseDTOCopyWithImpl<
          _$_DiseaseHistoryListResponseDTO>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_DiseaseHistoryListResponseDTOToJson(
      this,
    );
  }
}

abstract class _DiseaseHistoryListResponseDTO
    implements DiseaseHistoryListResponseDTO {
  factory _DiseaseHistoryListResponseDTO(
          {required final List<DiseaseHistoryResponseDTO> diseaseHistoryList,
          @JsonKey(name: 'totalDiseases')
              required final int totalDiseaseHistoryCount}) =
      _$_DiseaseHistoryListResponseDTO;

  factory _DiseaseHistoryListResponseDTO.fromJson(Map<String, dynamic> json) =
      _$_DiseaseHistoryListResponseDTO.fromJson;

  @override
  List<DiseaseHistoryResponseDTO> get diseaseHistoryList;
  @override
  @JsonKey(name: 'totalDiseases')
  int get totalDiseaseHistoryCount;
  @override
  @JsonKey(ignore: true)
  _$$_DiseaseHistoryListResponseDTOCopyWith<_$_DiseaseHistoryListResponseDTO>
      get copyWith => throw _privateConstructorUsedError;
}
