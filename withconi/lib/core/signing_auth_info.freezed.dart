// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'signing_auth_info.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$SigningAuthInfo {
  Provider get provider => throw _privateConstructorUsedError;
  String get email => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            String platformToken, Provider provider, String email)
        tokenAuthInfo,
    required TResult Function(
            OAuthCredential oAuthCredential, Provider provider, String email)
        credentialAuthInfo,
    required TResult Function(String password, Provider provider, String email)
        emailPwdAuthInfo,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String platformToken, Provider provider, String email)?
        tokenAuthInfo,
    TResult? Function(
            OAuthCredential oAuthCredential, Provider provider, String email)?
        credentialAuthInfo,
    TResult? Function(String password, Provider provider, String email)?
        emailPwdAuthInfo,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String platformToken, Provider provider, String email)?
        tokenAuthInfo,
    TResult Function(
            OAuthCredential oAuthCredential, Provider provider, String email)?
        credentialAuthInfo,
    TResult Function(String password, Provider provider, String email)?
        emailPwdAuthInfo,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(TokenSigningAuthInfo value) tokenAuthInfo,
    required TResult Function(CredentialSigningAuthInfo value)
        credentialAuthInfo,
    required TResult Function(EmailPwdSigningAuthInfo value) emailPwdAuthInfo,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(TokenSigningAuthInfo value)? tokenAuthInfo,
    TResult? Function(CredentialSigningAuthInfo value)? credentialAuthInfo,
    TResult? Function(EmailPwdSigningAuthInfo value)? emailPwdAuthInfo,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(TokenSigningAuthInfo value)? tokenAuthInfo,
    TResult Function(CredentialSigningAuthInfo value)? credentialAuthInfo,
    TResult Function(EmailPwdSigningAuthInfo value)? emailPwdAuthInfo,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $SigningAuthInfoCopyWith<SigningAuthInfo> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SigningAuthInfoCopyWith<$Res> {
  factory $SigningAuthInfoCopyWith(
          SigningAuthInfo value, $Res Function(SigningAuthInfo) then) =
      _$SigningAuthInfoCopyWithImpl<$Res, SigningAuthInfo>;
  @useResult
  $Res call({Provider provider, String email});
}

/// @nodoc
class _$SigningAuthInfoCopyWithImpl<$Res, $Val extends SigningAuthInfo>
    implements $SigningAuthInfoCopyWith<$Res> {
  _$SigningAuthInfoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? provider = null,
    Object? email = null,
  }) {
    return _then(_value.copyWith(
      provider: null == provider
          ? _value.provider
          : provider // ignore: cast_nullable_to_non_nullable
              as Provider,
      email: null == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$TokenSigningAuthInfoCopyWith<$Res>
    implements $SigningAuthInfoCopyWith<$Res> {
  factory _$$TokenSigningAuthInfoCopyWith(_$TokenSigningAuthInfo value,
          $Res Function(_$TokenSigningAuthInfo) then) =
      __$$TokenSigningAuthInfoCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String platformToken, Provider provider, String email});
}

/// @nodoc
class __$$TokenSigningAuthInfoCopyWithImpl<$Res>
    extends _$SigningAuthInfoCopyWithImpl<$Res, _$TokenSigningAuthInfo>
    implements _$$TokenSigningAuthInfoCopyWith<$Res> {
  __$$TokenSigningAuthInfoCopyWithImpl(_$TokenSigningAuthInfo _value,
      $Res Function(_$TokenSigningAuthInfo) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? platformToken = null,
    Object? provider = null,
    Object? email = null,
  }) {
    return _then(_$TokenSigningAuthInfo(
      platformToken: null == platformToken
          ? _value.platformToken
          : platformToken // ignore: cast_nullable_to_non_nullable
              as String,
      provider: null == provider
          ? _value.provider
          : provider // ignore: cast_nullable_to_non_nullable
              as Provider,
      email: null == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$TokenSigningAuthInfo extends TokenSigningAuthInfo {
  const _$TokenSigningAuthInfo(
      {required this.platformToken,
      required this.provider,
      required this.email})
      : super._();

  @override
  final String platformToken;
  @override
  final Provider provider;
  @override
  final String email;

  @override
  String toString() {
    return 'SigningAuthInfo.tokenAuthInfo(platformToken: $platformToken, provider: $provider, email: $email)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TokenSigningAuthInfo &&
            (identical(other.platformToken, platformToken) ||
                other.platformToken == platformToken) &&
            (identical(other.provider, provider) ||
                other.provider == provider) &&
            (identical(other.email, email) || other.email == email));
  }

  @override
  int get hashCode => Object.hash(runtimeType, platformToken, provider, email);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$TokenSigningAuthInfoCopyWith<_$TokenSigningAuthInfo> get copyWith =>
      __$$TokenSigningAuthInfoCopyWithImpl<_$TokenSigningAuthInfo>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            String platformToken, Provider provider, String email)
        tokenAuthInfo,
    required TResult Function(
            OAuthCredential oAuthCredential, Provider provider, String email)
        credentialAuthInfo,
    required TResult Function(String password, Provider provider, String email)
        emailPwdAuthInfo,
  }) {
    return tokenAuthInfo(platformToken, provider, email);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String platformToken, Provider provider, String email)?
        tokenAuthInfo,
    TResult? Function(
            OAuthCredential oAuthCredential, Provider provider, String email)?
        credentialAuthInfo,
    TResult? Function(String password, Provider provider, String email)?
        emailPwdAuthInfo,
  }) {
    return tokenAuthInfo?.call(platformToken, provider, email);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String platformToken, Provider provider, String email)?
        tokenAuthInfo,
    TResult Function(
            OAuthCredential oAuthCredential, Provider provider, String email)?
        credentialAuthInfo,
    TResult Function(String password, Provider provider, String email)?
        emailPwdAuthInfo,
    required TResult orElse(),
  }) {
    if (tokenAuthInfo != null) {
      return tokenAuthInfo(platformToken, provider, email);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(TokenSigningAuthInfo value) tokenAuthInfo,
    required TResult Function(CredentialSigningAuthInfo value)
        credentialAuthInfo,
    required TResult Function(EmailPwdSigningAuthInfo value) emailPwdAuthInfo,
  }) {
    return tokenAuthInfo(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(TokenSigningAuthInfo value)? tokenAuthInfo,
    TResult? Function(CredentialSigningAuthInfo value)? credentialAuthInfo,
    TResult? Function(EmailPwdSigningAuthInfo value)? emailPwdAuthInfo,
  }) {
    return tokenAuthInfo?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(TokenSigningAuthInfo value)? tokenAuthInfo,
    TResult Function(CredentialSigningAuthInfo value)? credentialAuthInfo,
    TResult Function(EmailPwdSigningAuthInfo value)? emailPwdAuthInfo,
    required TResult orElse(),
  }) {
    if (tokenAuthInfo != null) {
      return tokenAuthInfo(this);
    }
    return orElse();
  }
}

abstract class TokenSigningAuthInfo extends SigningAuthInfo {
  const factory TokenSigningAuthInfo(
      {required final String platformToken,
      required final Provider provider,
      required final String email}) = _$TokenSigningAuthInfo;
  const TokenSigningAuthInfo._() : super._();

  String get platformToken;
  @override
  Provider get provider;
  @override
  String get email;
  @override
  @JsonKey(ignore: true)
  _$$TokenSigningAuthInfoCopyWith<_$TokenSigningAuthInfo> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$CredentialSigningAuthInfoCopyWith<$Res>
    implements $SigningAuthInfoCopyWith<$Res> {
  factory _$$CredentialSigningAuthInfoCopyWith(
          _$CredentialSigningAuthInfo value,
          $Res Function(_$CredentialSigningAuthInfo) then) =
      __$$CredentialSigningAuthInfoCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({OAuthCredential oAuthCredential, Provider provider, String email});
}

/// @nodoc
class __$$CredentialSigningAuthInfoCopyWithImpl<$Res>
    extends _$SigningAuthInfoCopyWithImpl<$Res, _$CredentialSigningAuthInfo>
    implements _$$CredentialSigningAuthInfoCopyWith<$Res> {
  __$$CredentialSigningAuthInfoCopyWithImpl(_$CredentialSigningAuthInfo _value,
      $Res Function(_$CredentialSigningAuthInfo) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? oAuthCredential = null,
    Object? provider = null,
    Object? email = null,
  }) {
    return _then(_$CredentialSigningAuthInfo(
      oAuthCredential: null == oAuthCredential
          ? _value.oAuthCredential
          : oAuthCredential // ignore: cast_nullable_to_non_nullable
              as OAuthCredential,
      provider: null == provider
          ? _value.provider
          : provider // ignore: cast_nullable_to_non_nullable
              as Provider,
      email: null == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$CredentialSigningAuthInfo extends CredentialSigningAuthInfo {
  const _$CredentialSigningAuthInfo(
      {required this.oAuthCredential,
      required this.provider,
      required this.email})
      : super._();

  @override
  final OAuthCredential oAuthCredential;
  @override
  final Provider provider;
  @override
  final String email;

  @override
  String toString() {
    return 'SigningAuthInfo.credentialAuthInfo(oAuthCredential: $oAuthCredential, provider: $provider, email: $email)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CredentialSigningAuthInfo &&
            (identical(other.oAuthCredential, oAuthCredential) ||
                other.oAuthCredential == oAuthCredential) &&
            (identical(other.provider, provider) ||
                other.provider == provider) &&
            (identical(other.email, email) || other.email == email));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, oAuthCredential, provider, email);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$CredentialSigningAuthInfoCopyWith<_$CredentialSigningAuthInfo>
      get copyWith => __$$CredentialSigningAuthInfoCopyWithImpl<
          _$CredentialSigningAuthInfo>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            String platformToken, Provider provider, String email)
        tokenAuthInfo,
    required TResult Function(
            OAuthCredential oAuthCredential, Provider provider, String email)
        credentialAuthInfo,
    required TResult Function(String password, Provider provider, String email)
        emailPwdAuthInfo,
  }) {
    return credentialAuthInfo(oAuthCredential, provider, email);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String platformToken, Provider provider, String email)?
        tokenAuthInfo,
    TResult? Function(
            OAuthCredential oAuthCredential, Provider provider, String email)?
        credentialAuthInfo,
    TResult? Function(String password, Provider provider, String email)?
        emailPwdAuthInfo,
  }) {
    return credentialAuthInfo?.call(oAuthCredential, provider, email);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String platformToken, Provider provider, String email)?
        tokenAuthInfo,
    TResult Function(
            OAuthCredential oAuthCredential, Provider provider, String email)?
        credentialAuthInfo,
    TResult Function(String password, Provider provider, String email)?
        emailPwdAuthInfo,
    required TResult orElse(),
  }) {
    if (credentialAuthInfo != null) {
      return credentialAuthInfo(oAuthCredential, provider, email);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(TokenSigningAuthInfo value) tokenAuthInfo,
    required TResult Function(CredentialSigningAuthInfo value)
        credentialAuthInfo,
    required TResult Function(EmailPwdSigningAuthInfo value) emailPwdAuthInfo,
  }) {
    return credentialAuthInfo(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(TokenSigningAuthInfo value)? tokenAuthInfo,
    TResult? Function(CredentialSigningAuthInfo value)? credentialAuthInfo,
    TResult? Function(EmailPwdSigningAuthInfo value)? emailPwdAuthInfo,
  }) {
    return credentialAuthInfo?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(TokenSigningAuthInfo value)? tokenAuthInfo,
    TResult Function(CredentialSigningAuthInfo value)? credentialAuthInfo,
    TResult Function(EmailPwdSigningAuthInfo value)? emailPwdAuthInfo,
    required TResult orElse(),
  }) {
    if (credentialAuthInfo != null) {
      return credentialAuthInfo(this);
    }
    return orElse();
  }
}

abstract class CredentialSigningAuthInfo extends SigningAuthInfo {
  const factory CredentialSigningAuthInfo(
      {required final OAuthCredential oAuthCredential,
      required final Provider provider,
      required final String email}) = _$CredentialSigningAuthInfo;
  const CredentialSigningAuthInfo._() : super._();

  OAuthCredential get oAuthCredential;
  @override
  Provider get provider;
  @override
  String get email;
  @override
  @JsonKey(ignore: true)
  _$$CredentialSigningAuthInfoCopyWith<_$CredentialSigningAuthInfo>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$EmailPwdSigningAuthInfoCopyWith<$Res>
    implements $SigningAuthInfoCopyWith<$Res> {
  factory _$$EmailPwdSigningAuthInfoCopyWith(_$EmailPwdSigningAuthInfo value,
          $Res Function(_$EmailPwdSigningAuthInfo) then) =
      __$$EmailPwdSigningAuthInfoCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String password, Provider provider, String email});
}

/// @nodoc
class __$$EmailPwdSigningAuthInfoCopyWithImpl<$Res>
    extends _$SigningAuthInfoCopyWithImpl<$Res, _$EmailPwdSigningAuthInfo>
    implements _$$EmailPwdSigningAuthInfoCopyWith<$Res> {
  __$$EmailPwdSigningAuthInfoCopyWithImpl(_$EmailPwdSigningAuthInfo _value,
      $Res Function(_$EmailPwdSigningAuthInfo) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? password = null,
    Object? provider = null,
    Object? email = null,
  }) {
    return _then(_$EmailPwdSigningAuthInfo(
      password: null == password
          ? _value.password
          : password // ignore: cast_nullable_to_non_nullable
              as String,
      provider: null == provider
          ? _value.provider
          : provider // ignore: cast_nullable_to_non_nullable
              as Provider,
      email: null == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$EmailPwdSigningAuthInfo extends EmailPwdSigningAuthInfo {
  const _$EmailPwdSigningAuthInfo(
      {required this.password, required this.provider, required this.email})
      : super._();

  @override
  final String password;
  @override
  final Provider provider;
  @override
  final String email;

  @override
  String toString() {
    return 'SigningAuthInfo.emailPwdAuthInfo(password: $password, provider: $provider, email: $email)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$EmailPwdSigningAuthInfo &&
            (identical(other.password, password) ||
                other.password == password) &&
            (identical(other.provider, provider) ||
                other.provider == provider) &&
            (identical(other.email, email) || other.email == email));
  }

  @override
  int get hashCode => Object.hash(runtimeType, password, provider, email);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$EmailPwdSigningAuthInfoCopyWith<_$EmailPwdSigningAuthInfo> get copyWith =>
      __$$EmailPwdSigningAuthInfoCopyWithImpl<_$EmailPwdSigningAuthInfo>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            String platformToken, Provider provider, String email)
        tokenAuthInfo,
    required TResult Function(
            OAuthCredential oAuthCredential, Provider provider, String email)
        credentialAuthInfo,
    required TResult Function(String password, Provider provider, String email)
        emailPwdAuthInfo,
  }) {
    return emailPwdAuthInfo(password, provider, email);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String platformToken, Provider provider, String email)?
        tokenAuthInfo,
    TResult? Function(
            OAuthCredential oAuthCredential, Provider provider, String email)?
        credentialAuthInfo,
    TResult? Function(String password, Provider provider, String email)?
        emailPwdAuthInfo,
  }) {
    return emailPwdAuthInfo?.call(password, provider, email);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String platformToken, Provider provider, String email)?
        tokenAuthInfo,
    TResult Function(
            OAuthCredential oAuthCredential, Provider provider, String email)?
        credentialAuthInfo,
    TResult Function(String password, Provider provider, String email)?
        emailPwdAuthInfo,
    required TResult orElse(),
  }) {
    if (emailPwdAuthInfo != null) {
      return emailPwdAuthInfo(password, provider, email);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(TokenSigningAuthInfo value) tokenAuthInfo,
    required TResult Function(CredentialSigningAuthInfo value)
        credentialAuthInfo,
    required TResult Function(EmailPwdSigningAuthInfo value) emailPwdAuthInfo,
  }) {
    return emailPwdAuthInfo(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(TokenSigningAuthInfo value)? tokenAuthInfo,
    TResult? Function(CredentialSigningAuthInfo value)? credentialAuthInfo,
    TResult? Function(EmailPwdSigningAuthInfo value)? emailPwdAuthInfo,
  }) {
    return emailPwdAuthInfo?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(TokenSigningAuthInfo value)? tokenAuthInfo,
    TResult Function(CredentialSigningAuthInfo value)? credentialAuthInfo,
    TResult Function(EmailPwdSigningAuthInfo value)? emailPwdAuthInfo,
    required TResult orElse(),
  }) {
    if (emailPwdAuthInfo != null) {
      return emailPwdAuthInfo(this);
    }
    return orElse();
  }
}

abstract class EmailPwdSigningAuthInfo extends SigningAuthInfo {
  const factory EmailPwdSigningAuthInfo(
      {required final String password,
      required final Provider provider,
      required final String email}) = _$EmailPwdSigningAuthInfo;
  const EmailPwdSigningAuthInfo._() : super._();

  String get password;
  @override
  Provider get provider;
  @override
  String get email;
  @override
  @JsonKey(ignore: true)
  _$$EmailPwdSigningAuthInfoCopyWith<_$EmailPwdSigningAuthInfo> get copyWith =>
      throw _privateConstructorUsedError;
}
