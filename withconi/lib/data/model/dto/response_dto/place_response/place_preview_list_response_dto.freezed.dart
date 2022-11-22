// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'place_preview_list_response_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

PlacePreviewListResponseDTO _$PlacePreviewListResponseDTOFromJson(
    Map<String, dynamic> json) {
  return _PlacePreviewListResponseDTO.fromJson(json);
}

/// @nodoc
mixin _$PlacePreviewListResponseDTO {
  List<PlacePreviewResponseDTO> get list => throw _privateConstructorUsedError;
  int get totalDocuments => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $PlacePreviewListResponseDTOCopyWith<PlacePreviewListResponseDTO>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PlacePreviewListResponseDTOCopyWith<$Res> {
  factory $PlacePreviewListResponseDTOCopyWith(
          PlacePreviewListResponseDTO value,
          $Res Function(PlacePreviewListResponseDTO) then) =
      _$PlacePreviewListResponseDTOCopyWithImpl<$Res,
          PlacePreviewListResponseDTO>;
  @useResult
  $Res call({List<PlacePreviewResponseDTO> list, int totalDocuments});
}

/// @nodoc
class _$PlacePreviewListResponseDTOCopyWithImpl<$Res,
        $Val extends PlacePreviewListResponseDTO>
    implements $PlacePreviewListResponseDTOCopyWith<$Res> {
  _$PlacePreviewListResponseDTOCopyWithImpl(this._value, this._then);

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
              as List<PlacePreviewResponseDTO>,
      totalDocuments: null == totalDocuments
          ? _value.totalDocuments
          : totalDocuments // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_PlacePreviewListResponseDTOCopyWith<$Res>
    implements $PlacePreviewListResponseDTOCopyWith<$Res> {
  factory _$$_PlacePreviewListResponseDTOCopyWith(
          _$_PlacePreviewListResponseDTO value,
          $Res Function(_$_PlacePreviewListResponseDTO) then) =
      __$$_PlacePreviewListResponseDTOCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({List<PlacePreviewResponseDTO> list, int totalDocuments});
}

/// @nodoc
class __$$_PlacePreviewListResponseDTOCopyWithImpl<$Res>
    extends _$PlacePreviewListResponseDTOCopyWithImpl<$Res,
        _$_PlacePreviewListResponseDTO>
    implements _$$_PlacePreviewListResponseDTOCopyWith<$Res> {
  __$$_PlacePreviewListResponseDTOCopyWithImpl(
      _$_PlacePreviewListResponseDTO _value,
      $Res Function(_$_PlacePreviewListResponseDTO) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? list = null,
    Object? totalDocuments = null,
  }) {
    return _then(_$_PlacePreviewListResponseDTO(
      list: null == list
          ? _value._list
          : list // ignore: cast_nullable_to_non_nullable
              as List<PlacePreviewResponseDTO>,
      totalDocuments: null == totalDocuments
          ? _value.totalDocuments
          : totalDocuments // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

@JsonSerializable(explicitToJson: true)
class _$_PlacePreviewListResponseDTO implements _PlacePreviewListResponseDTO {
  _$_PlacePreviewListResponseDTO(
      {required final List<PlacePreviewResponseDTO> list,
      required this.totalDocuments})
      : _list = list;

  factory _$_PlacePreviewListResponseDTO.fromJson(Map<String, dynamic> json) =>
      _$$_PlacePreviewListResponseDTOFromJson(json);

  final List<PlacePreviewResponseDTO> _list;
  @override
  List<PlacePreviewResponseDTO> get list {
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_list);
  }

  @override
  final int totalDocuments;

  @override
  String toString() {
    return 'PlacePreviewListResponseDTO(list: $list, totalDocuments: $totalDocuments)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_PlacePreviewListResponseDTO &&
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
  _$$_PlacePreviewListResponseDTOCopyWith<_$_PlacePreviewListResponseDTO>
      get copyWith => __$$_PlacePreviewListResponseDTOCopyWithImpl<
          _$_PlacePreviewListResponseDTO>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_PlacePreviewListResponseDTOToJson(
      this,
    );
  }
}

abstract class _PlacePreviewListResponseDTO
    implements PlacePreviewListResponseDTO {
  factory _PlacePreviewListResponseDTO(
      {required final List<PlacePreviewResponseDTO> list,
      required final int totalDocuments}) = _$_PlacePreviewListResponseDTO;

  factory _PlacePreviewListResponseDTO.fromJson(Map<String, dynamic> json) =
      _$_PlacePreviewListResponseDTO.fromJson;

  @override
  List<PlacePreviewResponseDTO> get list;
  @override
  int get totalDocuments;
  @override
  @JsonKey(ignore: true)
  _$$_PlacePreviewListResponseDTOCopyWith<_$_PlacePreviewListResponseDTO>
      get copyWith => throw _privateConstructorUsedError;
}
