// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'lat_lng_response_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

LatLngResponseDTO _$LatLngResponseDTOFromJson(Map<String, dynamic> json) {
  return _LatLngResponseDTO.fromJson(json);
}

/// @nodoc
mixin _$LatLngResponseDTO {
  double get lat => throw _privateConstructorUsedError;
  double get lng => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $LatLngResponseDTOCopyWith<LatLngResponseDTO> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LatLngResponseDTOCopyWith<$Res> {
  factory $LatLngResponseDTOCopyWith(
          LatLngResponseDTO value, $Res Function(LatLngResponseDTO) then) =
      _$LatLngResponseDTOCopyWithImpl<$Res, LatLngResponseDTO>;
  @useResult
  $Res call({double lat, double lng});
}

/// @nodoc
class _$LatLngResponseDTOCopyWithImpl<$Res, $Val extends LatLngResponseDTO>
    implements $LatLngResponseDTOCopyWith<$Res> {
  _$LatLngResponseDTOCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? lat = null,
    Object? lng = null,
  }) {
    return _then(_value.copyWith(
      lat: null == lat
          ? _value.lat
          : lat // ignore: cast_nullable_to_non_nullable
              as double,
      lng: null == lng
          ? _value.lng
          : lng // ignore: cast_nullable_to_non_nullable
              as double,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_LatLngResponseDTOCopyWith<$Res>
    implements $LatLngResponseDTOCopyWith<$Res> {
  factory _$$_LatLngResponseDTOCopyWith(_$_LatLngResponseDTO value,
          $Res Function(_$_LatLngResponseDTO) then) =
      __$$_LatLngResponseDTOCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({double lat, double lng});
}

/// @nodoc
class __$$_LatLngResponseDTOCopyWithImpl<$Res>
    extends _$LatLngResponseDTOCopyWithImpl<$Res, _$_LatLngResponseDTO>
    implements _$$_LatLngResponseDTOCopyWith<$Res> {
  __$$_LatLngResponseDTOCopyWithImpl(
      _$_LatLngResponseDTO _value, $Res Function(_$_LatLngResponseDTO) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? lat = null,
    Object? lng = null,
  }) {
    return _then(_$_LatLngResponseDTO(
      lat: null == lat
          ? _value.lat
          : lat // ignore: cast_nullable_to_non_nullable
              as double,
      lng: null == lng
          ? _value.lng
          : lng // ignore: cast_nullable_to_non_nullable
              as double,
    ));
  }
}

/// @nodoc

@JsonSerializable(explicitToJson: true)
class _$_LatLngResponseDTO implements _LatLngResponseDTO {
  _$_LatLngResponseDTO({required this.lat, required this.lng});

  factory _$_LatLngResponseDTO.fromJson(Map<String, dynamic> json) =>
      _$$_LatLngResponseDTOFromJson(json);

  @override
  final double lat;
  @override
  final double lng;

  @override
  String toString() {
    return 'LatLngResponseDTO(lat: $lat, lng: $lng)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_LatLngResponseDTO &&
            (identical(other.lat, lat) || other.lat == lat) &&
            (identical(other.lng, lng) || other.lng == lng));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, lat, lng);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_LatLngResponseDTOCopyWith<_$_LatLngResponseDTO> get copyWith =>
      __$$_LatLngResponseDTOCopyWithImpl<_$_LatLngResponseDTO>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_LatLngResponseDTOToJson(
      this,
    );
  }
}

abstract class _LatLngResponseDTO implements LatLngResponseDTO {
  factory _LatLngResponseDTO(
      {required final double lat,
      required final double lng}) = _$_LatLngResponseDTO;

  factory _LatLngResponseDTO.fromJson(Map<String, dynamic> json) =
      _$_LatLngResponseDTO.fromJson;

  @override
  double get lat;
  @override
  double get lng;
  @override
  @JsonKey(ignore: true)
  _$$_LatLngResponseDTOCopyWith<_$_LatLngResponseDTO> get copyWith =>
      throw _privateConstructorUsedError;
}
