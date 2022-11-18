// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'disease_list_response_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

DiseaseListResponseDTO _$DiseaseListResponseDTOFromJson(
    Map<String, dynamic> json) {
  return _DiseaseListResponseDTO.fromJson(json);
}

/// @nodoc
mixin _$DiseaseListResponseDTO {
  List<DiseaseResponseDTO> get list => throw _privateConstructorUsedError;
  int get totalDocuments => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $DiseaseListResponseDTOCopyWith<DiseaseListResponseDTO> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DiseaseListResponseDTOCopyWith<$Res> {
  factory $DiseaseListResponseDTOCopyWith(DiseaseListResponseDTO value,
          $Res Function(DiseaseListResponseDTO) then) =
      _$DiseaseListResponseDTOCopyWithImpl<$Res, DiseaseListResponseDTO>;
  @useResult
  $Res call({List<DiseaseResponseDTO> list, int totalDocuments});
}

/// @nodoc
class _$DiseaseListResponseDTOCopyWithImpl<$Res,
        $Val extends DiseaseListResponseDTO>
    implements $DiseaseListResponseDTOCopyWith<$Res> {
  _$DiseaseListResponseDTOCopyWithImpl(this._value, this._then);

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
              as List<DiseaseResponseDTO>,
      totalDocuments: null == totalDocuments
          ? _value.totalDocuments
          : totalDocuments // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_DiseaseListResponseDTOCopyWith<$Res>
    implements $DiseaseListResponseDTOCopyWith<$Res> {
  factory _$$_DiseaseListResponseDTOCopyWith(_$_DiseaseListResponseDTO value,
          $Res Function(_$_DiseaseListResponseDTO) then) =
      __$$_DiseaseListResponseDTOCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({List<DiseaseResponseDTO> list, int totalDocuments});
}

/// @nodoc
class __$$_DiseaseListResponseDTOCopyWithImpl<$Res>
    extends _$DiseaseListResponseDTOCopyWithImpl<$Res,
        _$_DiseaseListResponseDTO>
    implements _$$_DiseaseListResponseDTOCopyWith<$Res> {
  __$$_DiseaseListResponseDTOCopyWithImpl(_$_DiseaseListResponseDTO _value,
      $Res Function(_$_DiseaseListResponseDTO) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? list = null,
    Object? totalDocuments = null,
  }) {
    return _then(_$_DiseaseListResponseDTO(
      list: null == list
          ? _value._list
          : list // ignore: cast_nullable_to_non_nullable
              as List<DiseaseResponseDTO>,
      totalDocuments: null == totalDocuments
          ? _value.totalDocuments
          : totalDocuments // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

@JsonSerializable(explicitToJson: true)
class _$_DiseaseListResponseDTO implements _DiseaseListResponseDTO {
  _$_DiseaseListResponseDTO(
      {required final List<DiseaseResponseDTO> list,
      required this.totalDocuments})
      : _list = list;

  factory _$_DiseaseListResponseDTO.fromJson(Map<String, dynamic> json) =>
      _$$_DiseaseListResponseDTOFromJson(json);

  final List<DiseaseResponseDTO> _list;
  @override
  List<DiseaseResponseDTO> get list {
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_list);
  }

  @override
  final int totalDocuments;

  @override
  String toString() {
    return 'DiseaseListResponseDTO(list: $list, totalDocuments: $totalDocuments)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_DiseaseListResponseDTO &&
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
  _$$_DiseaseListResponseDTOCopyWith<_$_DiseaseListResponseDTO> get copyWith =>
      __$$_DiseaseListResponseDTOCopyWithImpl<_$_DiseaseListResponseDTO>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_DiseaseListResponseDTOToJson(
      this,
    );
  }
}

abstract class _DiseaseListResponseDTO implements DiseaseListResponseDTO {
  factory _DiseaseListResponseDTO(
      {required final List<DiseaseResponseDTO> list,
      required final int totalDocuments}) = _$_DiseaseListResponseDTO;

  factory _DiseaseListResponseDTO.fromJson(Map<String, dynamic> json) =
      _$_DiseaseListResponseDTO.fromJson;

  @override
  List<DiseaseResponseDTO> get list;
  @override
  int get totalDocuments;
  @override
  @JsonKey(ignore: true)
  _$$_DiseaseListResponseDTOCopyWith<_$_DiseaseListResponseDTO> get copyWith =>
      throw _privateConstructorUsedError;
}
