// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'email_duplication_check_response_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

UserInfoExistenceResponseDTO _$UserInfoExistenceResponseDTOFromJson(
    Map<String, dynamic> json) {
  return _UserInfoExistenceResponseDTO.fromJson(json);
}

/// @nodoc
mixin _$UserInfoExistenceResponseDTO {
  bool get isAuth => throw _privateConstructorUsedError;
  bool get isDB => throw _privateConstructorUsedError;
  Provider? get provider => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $UserInfoExistenceResponseDTOCopyWith<UserInfoExistenceResponseDTO>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UserInfoExistenceResponseDTOCopyWith<$Res> {
  factory $UserInfoExistenceResponseDTOCopyWith(
          UserInfoExistenceResponseDTO value,
          $Res Function(UserInfoExistenceResponseDTO) then) =
      _$UserInfoExistenceResponseDTOCopyWithImpl<$Res,
          UserInfoExistenceResponseDTO>;
  @useResult
  $Res call({bool isAuth, bool isDB, Provider? provider});
}

/// @nodoc
class _$UserInfoExistenceResponseDTOCopyWithImpl<$Res,
        $Val extends UserInfoExistenceResponseDTO>
    implements $UserInfoExistenceResponseDTOCopyWith<$Res> {
  _$UserInfoExistenceResponseDTOCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isAuth = null,
    Object? isDB = null,
    Object? provider = freezed,
  }) {
    return _then(_value.copyWith(
      isAuth: null == isAuth
          ? _value.isAuth
          : isAuth // ignore: cast_nullable_to_non_nullable
              as bool,
      isDB: null == isDB
          ? _value.isDB
          : isDB // ignore: cast_nullable_to_non_nullable
              as bool,
      provider: freezed == provider
          ? _value.provider
          : provider // ignore: cast_nullable_to_non_nullable
              as Provider?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_UserInfoExistenceResponseDTOCopyWith<$Res>
    implements $UserInfoExistenceResponseDTOCopyWith<$Res> {
  factory _$$_UserInfoExistenceResponseDTOCopyWith(
          _$_UserInfoExistenceResponseDTO value,
          $Res Function(_$_UserInfoExistenceResponseDTO) then) =
      __$$_UserInfoExistenceResponseDTOCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({bool isAuth, bool isDB, Provider? provider});
}

/// @nodoc
class __$$_UserInfoExistenceResponseDTOCopyWithImpl<$Res>
    extends _$UserInfoExistenceResponseDTOCopyWithImpl<$Res,
        _$_UserInfoExistenceResponseDTO>
    implements _$$_UserInfoExistenceResponseDTOCopyWith<$Res> {
  __$$_UserInfoExistenceResponseDTOCopyWithImpl(
      _$_UserInfoExistenceResponseDTO _value,
      $Res Function(_$_UserInfoExistenceResponseDTO) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isAuth = null,
    Object? isDB = null,
    Object? provider = freezed,
  }) {
    return _then(_$_UserInfoExistenceResponseDTO(
      isAuth: null == isAuth
          ? _value.isAuth
          : isAuth // ignore: cast_nullable_to_non_nullable
              as bool,
      isDB: null == isDB
          ? _value.isDB
          : isDB // ignore: cast_nullable_to_non_nullable
              as bool,
      provider: freezed == provider
          ? _value.provider
          : provider // ignore: cast_nullable_to_non_nullable
              as Provider?,
    ));
  }
}

/// @nodoc

@JsonSerializable(explicitToJson: true)
class _$_UserInfoExistenceResponseDTO implements _UserInfoExistenceResponseDTO {
  _$_UserInfoExistenceResponseDTO(
      {this.isAuth = false, this.isDB = false, this.provider});

  factory _$_UserInfoExistenceResponseDTO.fromJson(Map<String, dynamic> json) =>
      _$$_UserInfoExistenceResponseDTOFromJson(json);

  @override
  @JsonKey()
  final bool isAuth;
  @override
  @JsonKey()
  final bool isDB;
  @override
  final Provider? provider;

  @override
  String toString() {
    return 'UserInfoExistenceResponseDTO(isAuth: $isAuth, isDB: $isDB, provider: $provider)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_UserInfoExistenceResponseDTO &&
            (identical(other.isAuth, isAuth) || other.isAuth == isAuth) &&
            (identical(other.isDB, isDB) || other.isDB == isDB) &&
            (identical(other.provider, provider) ||
                other.provider == provider));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, isAuth, isDB, provider);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_UserInfoExistenceResponseDTOCopyWith<_$_UserInfoExistenceResponseDTO>
      get copyWith => __$$_UserInfoExistenceResponseDTOCopyWithImpl<
          _$_UserInfoExistenceResponseDTO>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_UserInfoExistenceResponseDTOToJson(
      this,
    );
  }
}

abstract class _UserInfoExistenceResponseDTO
    implements UserInfoExistenceResponseDTO {
  factory _UserInfoExistenceResponseDTO(
      {final bool isAuth,
      final bool isDB,
      final Provider? provider}) = _$_UserInfoExistenceResponseDTO;

  factory _UserInfoExistenceResponseDTO.fromJson(Map<String, dynamic> json) =
      _$_UserInfoExistenceResponseDTO.fromJson;

  @override
  bool get isAuth;
  @override
  bool get isDB;
  @override
  Provider? get provider;
  @override
  @JsonKey(ignore: true)
  _$$_UserInfoExistenceResponseDTOCopyWith<_$_UserInfoExistenceResponseDTO>
      get copyWith => throw _privateConstructorUsedError;
}
