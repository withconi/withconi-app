// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

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
      _$LatLngResponseDTOCopyWithImpl<$Res>;
  $Res call({double lat, double lng});
}

/// @nodoc
class _$LatLngResponseDTOCopyWithImpl<$Res>
    implements $LatLngResponseDTOCopyWith<$Res> {
  _$LatLngResponseDTOCopyWithImpl(this._value, this._then);

  final LatLngResponseDTO _value;
  // ignore: unused_field
  final $Res Function(LatLngResponseDTO) _then;

  @override
  $Res call({
    Object? lat = freezed,
    Object? lng = freezed,
  }) {
    return _then(_value.copyWith(
      lat: lat == freezed
          ? _value.lat
          : lat // ignore: cast_nullable_to_non_nullable
              as double,
      lng: lng == freezed
          ? _value.lng
          : lng // ignore: cast_nullable_to_non_nullable
              as double,
    ));
  }
}

/// @nodoc
abstract class _$$_LatLngResponseDTOCopyWith<$Res>
    implements $LatLngResponseDTOCopyWith<$Res> {
  factory _$$_LatLngResponseDTOCopyWith(_$_LatLngResponseDTO value,
          $Res Function(_$_LatLngResponseDTO) then) =
      __$$_LatLngResponseDTOCopyWithImpl<$Res>;
  @override
  $Res call({double lat, double lng});
}

/// @nodoc
class __$$_LatLngResponseDTOCopyWithImpl<$Res>
    extends _$LatLngResponseDTOCopyWithImpl<$Res>
    implements _$$_LatLngResponseDTOCopyWith<$Res> {
  __$$_LatLngResponseDTOCopyWithImpl(
      _$_LatLngResponseDTO _value, $Res Function(_$_LatLngResponseDTO) _then)
      : super(_value, (v) => _then(v as _$_LatLngResponseDTO));

  @override
  _$_LatLngResponseDTO get _value => super._value as _$_LatLngResponseDTO;

  @override
  $Res call({
    Object? lat = freezed,
    Object? lng = freezed,
  }) {
    return _then(_$_LatLngResponseDTO(
      lat: lat == freezed
          ? _value.lat
          : lat // ignore: cast_nullable_to_non_nullable
              as double,
      lng: lng == freezed
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
            const DeepCollectionEquality().equals(other.lat, lat) &&
            const DeepCollectionEquality().equals(other.lng, lng));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(lat),
      const DeepCollectionEquality().hash(lng));

  @JsonKey(ignore: true)
  @override
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
