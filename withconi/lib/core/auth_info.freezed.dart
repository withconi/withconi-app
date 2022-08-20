// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'auth_info.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

AuthInfo _$AuthInfoFromJson(Map<String, dynamic> json) {
  return _AuthInfo.fromJson(json);
}

/// @nodoc
mixin _$AuthInfo {
  dynamic get authObject => throw _privateConstructorUsedError;
  String get email => throw _privateConstructorUsedError;
  Provider get provider => throw _privateConstructorUsedError;
  bool? get isEmailVerified => throw _privateConstructorUsedError;
  bool? get isEmailVerifySkipped => throw _privateConstructorUsedError;
  dynamic get required => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $AuthInfoCopyWith<AuthInfo> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AuthInfoCopyWith<$Res> {
  factory $AuthInfoCopyWith(AuthInfo value, $Res Function(AuthInfo) then) =
      _$AuthInfoCopyWithImpl<$Res>;
  $Res call(
      {dynamic authObject,
      String email,
      Provider provider,
      bool? isEmailVerified,
      bool? isEmailVerifySkipped,
      dynamic required});
}

/// @nodoc
class _$AuthInfoCopyWithImpl<$Res> implements $AuthInfoCopyWith<$Res> {
  _$AuthInfoCopyWithImpl(this._value, this._then);

  final AuthInfo _value;
  // ignore: unused_field
  final $Res Function(AuthInfo) _then;

  @override
  $Res call({
    Object? authObject = freezed,
    Object? email = freezed,
    Object? provider = freezed,
    Object? isEmailVerified = freezed,
    Object? isEmailVerifySkipped = freezed,
    Object? required = freezed,
  }) {
    return _then(_value.copyWith(
      authObject: authObject == freezed
          ? _value.authObject
          : authObject // ignore: cast_nullable_to_non_nullable
              as dynamic,
      email: email == freezed
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      provider: provider == freezed
          ? _value.provider
          : provider // ignore: cast_nullable_to_non_nullable
              as Provider,
      isEmailVerified: isEmailVerified == freezed
          ? _value.isEmailVerified
          : isEmailVerified // ignore: cast_nullable_to_non_nullable
              as bool?,
      isEmailVerifySkipped: isEmailVerifySkipped == freezed
          ? _value.isEmailVerifySkipped
          : isEmailVerifySkipped // ignore: cast_nullable_to_non_nullable
              as bool?,
      required: required == freezed
          ? _value.required
          : required // ignore: cast_nullable_to_non_nullable
              as dynamic,
    ));
  }
}

/// @nodoc
abstract class _$$_AuthInfoCopyWith<$Res> implements $AuthInfoCopyWith<$Res> {
  factory _$$_AuthInfoCopyWith(
          _$_AuthInfo value, $Res Function(_$_AuthInfo) then) =
      __$$_AuthInfoCopyWithImpl<$Res>;
  @override
  $Res call(
      {dynamic authObject,
      String email,
      Provider provider,
      bool? isEmailVerified,
      bool? isEmailVerifySkipped,
      dynamic required});
}

/// @nodoc
class __$$_AuthInfoCopyWithImpl<$Res> extends _$AuthInfoCopyWithImpl<$Res>
    implements _$$_AuthInfoCopyWith<$Res> {
  __$$_AuthInfoCopyWithImpl(
      _$_AuthInfo _value, $Res Function(_$_AuthInfo) _then)
      : super(_value, (v) => _then(v as _$_AuthInfo));

  @override
  _$_AuthInfo get _value => super._value as _$_AuthInfo;

  @override
  $Res call({
    Object? authObject = freezed,
    Object? email = freezed,
    Object? provider = freezed,
    Object? isEmailVerified = freezed,
    Object? isEmailVerifySkipped = freezed,
    Object? required = freezed,
  }) {
    return _then(_$_AuthInfo(
      authObject: authObject == freezed
          ? _value.authObject
          : authObject // ignore: cast_nullable_to_non_nullable
              as dynamic,
      email: email == freezed
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      provider: provider == freezed
          ? _value.provider
          : provider // ignore: cast_nullable_to_non_nullable
              as Provider,
      isEmailVerified: isEmailVerified == freezed
          ? _value.isEmailVerified
          : isEmailVerified // ignore: cast_nullable_to_non_nullable
              as bool?,
      isEmailVerifySkipped: isEmailVerifySkipped == freezed
          ? _value.isEmailVerifySkipped
          : isEmailVerifySkipped // ignore: cast_nullable_to_non_nullable
              as bool?,
      required: required == freezed ? _value.required : required,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_AuthInfo implements _AuthInfo {
  _$_AuthInfo(
      {required this.authObject,
      required this.email,
      required this.provider,
      this.isEmailVerified = false,
      this.isEmailVerifySkipped = false,
      this.required});

  factory _$_AuthInfo.fromJson(Map<String, dynamic> json) =>
      _$$_AuthInfoFromJson(json);

  @override
  final dynamic authObject;
  @override
  final String email;
  @override
  final Provider provider;
  @override
  @JsonKey()
  final bool? isEmailVerified;
  @override
  @JsonKey()
  final bool? isEmailVerifySkipped;
  @override
  final dynamic required;

  @override
  String toString() {
    return 'AuthInfo(authObject: $authObject, email: $email, provider: $provider, isEmailVerified: $isEmailVerified, isEmailVerifySkipped: $isEmailVerifySkipped, required: $required)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_AuthInfo &&
            const DeepCollectionEquality()
                .equals(other.authObject, authObject) &&
            const DeepCollectionEquality().equals(other.email, email) &&
            const DeepCollectionEquality().equals(other.provider, provider) &&
            const DeepCollectionEquality()
                .equals(other.isEmailVerified, isEmailVerified) &&
            const DeepCollectionEquality()
                .equals(other.isEmailVerifySkipped, isEmailVerifySkipped) &&
            const DeepCollectionEquality().equals(other.required, required));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(authObject),
      const DeepCollectionEquality().hash(email),
      const DeepCollectionEquality().hash(provider),
      const DeepCollectionEquality().hash(isEmailVerified),
      const DeepCollectionEquality().hash(isEmailVerifySkipped),
      const DeepCollectionEquality().hash(required));

  @JsonKey(ignore: true)
  @override
  _$$_AuthInfoCopyWith<_$_AuthInfo> get copyWith =>
      __$$_AuthInfoCopyWithImpl<_$_AuthInfo>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_AuthInfoToJson(this);
  }
}

abstract class _AuthInfo implements AuthInfo {
  factory _AuthInfo(
      {required final dynamic authObject,
      required final String email,
      required final Provider provider,
      final bool? isEmailVerified,
      final bool? isEmailVerifySkipped,
      final dynamic required}) = _$_AuthInfo;

  factory _AuthInfo.fromJson(Map<String, dynamic> json) = _$_AuthInfo.fromJson;

  @override
  dynamic get authObject => throw _privateConstructorUsedError;
  @override
  String get email => throw _privateConstructorUsedError;
  @override
  Provider get provider => throw _privateConstructorUsedError;
  @override
  bool? get isEmailVerified => throw _privateConstructorUsedError;
  @override
  bool? get isEmailVerifySkipped => throw _privateConstructorUsedError;
  @override
  dynamic get required => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$$_AuthInfoCopyWith<_$_AuthInfo> get copyWith =>
      throw _privateConstructorUsedError;
}
