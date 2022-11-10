// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'sign_in_auth_info.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$SignInAuthInfo {
  Provider get provider => throw _privateConstructorUsedError;
  String get email => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            String customToken, Provider provider, String email)
        tokenSignInAuthInfo,
    required TResult Function(
            OAuthCredential oAuthCredential, Provider provider, String email)
        credentialSignInAuthInfo,
    required TResult Function(String password, Provider provider, String email)
        emailPwdAuthInfo,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(String customToken, Provider provider, String email)?
        tokenSignInAuthInfo,
    TResult Function(
            OAuthCredential oAuthCredential, Provider provider, String email)?
        credentialSignInAuthInfo,
    TResult Function(String password, Provider provider, String email)?
        emailPwdAuthInfo,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String customToken, Provider provider, String email)?
        tokenSignInAuthInfo,
    TResult Function(
            OAuthCredential oAuthCredential, Provider provider, String email)?
        credentialSignInAuthInfo,
    TResult Function(String password, Provider provider, String email)?
        emailPwdAuthInfo,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(TokenSignInAuthInfo value) tokenSignInAuthInfo,
    required TResult Function(CredentialSignInAuthInfo value)
        credentialSignInAuthInfo,
    required TResult Function(EmailPwdSignInAuthInfo value) emailPwdAuthInfo,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(TokenSignInAuthInfo value)? tokenSignInAuthInfo,
    TResult Function(CredentialSignInAuthInfo value)? credentialSignInAuthInfo,
    TResult Function(EmailPwdSignInAuthInfo value)? emailPwdAuthInfo,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(TokenSignInAuthInfo value)? tokenSignInAuthInfo,
    TResult Function(CredentialSignInAuthInfo value)? credentialSignInAuthInfo,
    TResult Function(EmailPwdSignInAuthInfo value)? emailPwdAuthInfo,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $SignInAuthInfoCopyWith<SignInAuthInfo> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SignInAuthInfoCopyWith<$Res> {
  factory $SignInAuthInfoCopyWith(
          SignInAuthInfo value, $Res Function(SignInAuthInfo) then) =
      _$SignInAuthInfoCopyWithImpl<$Res>;
  $Res call({Provider provider, String email});
}

/// @nodoc
class _$SignInAuthInfoCopyWithImpl<$Res>
    implements $SignInAuthInfoCopyWith<$Res> {
  _$SignInAuthInfoCopyWithImpl(this._value, this._then);

  final SignInAuthInfo _value;
  // ignore: unused_field
  final $Res Function(SignInAuthInfo) _then;

  @override
  $Res call({
    Object? provider = freezed,
    Object? email = freezed,
  }) {
    return _then(_value.copyWith(
      provider: provider == freezed
          ? _value.provider
          : provider // ignore: cast_nullable_to_non_nullable
              as Provider,
      email: email == freezed
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
abstract class _$$TokenSignInAuthInfoCopyWith<$Res>
    implements $SignInAuthInfoCopyWith<$Res> {
  factory _$$TokenSignInAuthInfoCopyWith(_$TokenSignInAuthInfo value,
          $Res Function(_$TokenSignInAuthInfo) then) =
      __$$TokenSignInAuthInfoCopyWithImpl<$Res>;
  @override
  $Res call({String customToken, Provider provider, String email});
}

/// @nodoc
class __$$TokenSignInAuthInfoCopyWithImpl<$Res>
    extends _$SignInAuthInfoCopyWithImpl<$Res>
    implements _$$TokenSignInAuthInfoCopyWith<$Res> {
  __$$TokenSignInAuthInfoCopyWithImpl(
      _$TokenSignInAuthInfo _value, $Res Function(_$TokenSignInAuthInfo) _then)
      : super(_value, (v) => _then(v as _$TokenSignInAuthInfo));

  @override
  _$TokenSignInAuthInfo get _value => super._value as _$TokenSignInAuthInfo;

  @override
  $Res call({
    Object? customToken = freezed,
    Object? provider = freezed,
    Object? email = freezed,
  }) {
    return _then(_$TokenSignInAuthInfo(
      customToken == freezed
          ? _value.customToken
          : customToken // ignore: cast_nullable_to_non_nullable
              as String,
      provider == freezed
          ? _value.provider
          : provider // ignore: cast_nullable_to_non_nullable
              as Provider,
      email == freezed
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$TokenSignInAuthInfo extends TokenSignInAuthInfo {
  const _$TokenSignInAuthInfo(this.customToken, this.provider, this.email)
      : super._();

  @override
  final String customToken;
  @override
  final Provider provider;
  @override
  final String email;

  @override
  String toString() {
    return 'SignInAuthInfo.tokenSignInAuthInfo(customToken: $customToken, provider: $provider, email: $email)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TokenSignInAuthInfo &&
            const DeepCollectionEquality()
                .equals(other.customToken, customToken) &&
            const DeepCollectionEquality().equals(other.provider, provider) &&
            const DeepCollectionEquality().equals(other.email, email));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(customToken),
      const DeepCollectionEquality().hash(provider),
      const DeepCollectionEquality().hash(email));

  @JsonKey(ignore: true)
  @override
  _$$TokenSignInAuthInfoCopyWith<_$TokenSignInAuthInfo> get copyWith =>
      __$$TokenSignInAuthInfoCopyWithImpl<_$TokenSignInAuthInfo>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            String customToken, Provider provider, String email)
        tokenSignInAuthInfo,
    required TResult Function(
            OAuthCredential oAuthCredential, Provider provider, String email)
        credentialSignInAuthInfo,
    required TResult Function(String password, Provider provider, String email)
        emailPwdAuthInfo,
  }) {
    return tokenSignInAuthInfo(customToken, provider, email);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(String customToken, Provider provider, String email)?
        tokenSignInAuthInfo,
    TResult Function(
            OAuthCredential oAuthCredential, Provider provider, String email)?
        credentialSignInAuthInfo,
    TResult Function(String password, Provider provider, String email)?
        emailPwdAuthInfo,
  }) {
    return tokenSignInAuthInfo?.call(customToken, provider, email);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String customToken, Provider provider, String email)?
        tokenSignInAuthInfo,
    TResult Function(
            OAuthCredential oAuthCredential, Provider provider, String email)?
        credentialSignInAuthInfo,
    TResult Function(String password, Provider provider, String email)?
        emailPwdAuthInfo,
    required TResult orElse(),
  }) {
    if (tokenSignInAuthInfo != null) {
      return tokenSignInAuthInfo(customToken, provider, email);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(TokenSignInAuthInfo value) tokenSignInAuthInfo,
    required TResult Function(CredentialSignInAuthInfo value)
        credentialSignInAuthInfo,
    required TResult Function(EmailPwdSignInAuthInfo value) emailPwdAuthInfo,
  }) {
    return tokenSignInAuthInfo(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(TokenSignInAuthInfo value)? tokenSignInAuthInfo,
    TResult Function(CredentialSignInAuthInfo value)? credentialSignInAuthInfo,
    TResult Function(EmailPwdSignInAuthInfo value)? emailPwdAuthInfo,
  }) {
    return tokenSignInAuthInfo?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(TokenSignInAuthInfo value)? tokenSignInAuthInfo,
    TResult Function(CredentialSignInAuthInfo value)? credentialSignInAuthInfo,
    TResult Function(EmailPwdSignInAuthInfo value)? emailPwdAuthInfo,
    required TResult orElse(),
  }) {
    if (tokenSignInAuthInfo != null) {
      return tokenSignInAuthInfo(this);
    }
    return orElse();
  }
}

abstract class TokenSignInAuthInfo extends SignInAuthInfo {
  const factory TokenSignInAuthInfo(final String customToken,
      final Provider provider, final String email) = _$TokenSignInAuthInfo;
  const TokenSignInAuthInfo._() : super._();

  String get customToken;
  @override
  Provider get provider;
  @override
  String get email;
  @override
  @JsonKey(ignore: true)
  _$$TokenSignInAuthInfoCopyWith<_$TokenSignInAuthInfo> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$CredentialSignInAuthInfoCopyWith<$Res>
    implements $SignInAuthInfoCopyWith<$Res> {
  factory _$$CredentialSignInAuthInfoCopyWith(_$CredentialSignInAuthInfo value,
          $Res Function(_$CredentialSignInAuthInfo) then) =
      __$$CredentialSignInAuthInfoCopyWithImpl<$Res>;
  @override
  $Res call({OAuthCredential oAuthCredential, Provider provider, String email});
}

/// @nodoc
class __$$CredentialSignInAuthInfoCopyWithImpl<$Res>
    extends _$SignInAuthInfoCopyWithImpl<$Res>
    implements _$$CredentialSignInAuthInfoCopyWith<$Res> {
  __$$CredentialSignInAuthInfoCopyWithImpl(_$CredentialSignInAuthInfo _value,
      $Res Function(_$CredentialSignInAuthInfo) _then)
      : super(_value, (v) => _then(v as _$CredentialSignInAuthInfo));

  @override
  _$CredentialSignInAuthInfo get _value =>
      super._value as _$CredentialSignInAuthInfo;

  @override
  $Res call({
    Object? oAuthCredential = freezed,
    Object? provider = freezed,
    Object? email = freezed,
  }) {
    return _then(_$CredentialSignInAuthInfo(
      oAuthCredential == freezed
          ? _value.oAuthCredential
          : oAuthCredential // ignore: cast_nullable_to_non_nullable
              as OAuthCredential,
      provider == freezed
          ? _value.provider
          : provider // ignore: cast_nullable_to_non_nullable
              as Provider,
      email == freezed
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$CredentialSignInAuthInfo extends CredentialSignInAuthInfo {
  const _$CredentialSignInAuthInfo(
      this.oAuthCredential, this.provider, this.email)
      : super._();

  @override
  final OAuthCredential oAuthCredential;
  @override
  final Provider provider;
  @override
  final String email;

  @override
  String toString() {
    return 'SignInAuthInfo.credentialSignInAuthInfo(oAuthCredential: $oAuthCredential, provider: $provider, email: $email)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CredentialSignInAuthInfo &&
            const DeepCollectionEquality()
                .equals(other.oAuthCredential, oAuthCredential) &&
            const DeepCollectionEquality().equals(other.provider, provider) &&
            const DeepCollectionEquality().equals(other.email, email));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(oAuthCredential),
      const DeepCollectionEquality().hash(provider),
      const DeepCollectionEquality().hash(email));

  @JsonKey(ignore: true)
  @override
  _$$CredentialSignInAuthInfoCopyWith<_$CredentialSignInAuthInfo>
      get copyWith =>
          __$$CredentialSignInAuthInfoCopyWithImpl<_$CredentialSignInAuthInfo>(
              this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            String customToken, Provider provider, String email)
        tokenSignInAuthInfo,
    required TResult Function(
            OAuthCredential oAuthCredential, Provider provider, String email)
        credentialSignInAuthInfo,
    required TResult Function(String password, Provider provider, String email)
        emailPwdAuthInfo,
  }) {
    return credentialSignInAuthInfo(oAuthCredential, provider, email);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(String customToken, Provider provider, String email)?
        tokenSignInAuthInfo,
    TResult Function(
            OAuthCredential oAuthCredential, Provider provider, String email)?
        credentialSignInAuthInfo,
    TResult Function(String password, Provider provider, String email)?
        emailPwdAuthInfo,
  }) {
    return credentialSignInAuthInfo?.call(oAuthCredential, provider, email);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String customToken, Provider provider, String email)?
        tokenSignInAuthInfo,
    TResult Function(
            OAuthCredential oAuthCredential, Provider provider, String email)?
        credentialSignInAuthInfo,
    TResult Function(String password, Provider provider, String email)?
        emailPwdAuthInfo,
    required TResult orElse(),
  }) {
    if (credentialSignInAuthInfo != null) {
      return credentialSignInAuthInfo(oAuthCredential, provider, email);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(TokenSignInAuthInfo value) tokenSignInAuthInfo,
    required TResult Function(CredentialSignInAuthInfo value)
        credentialSignInAuthInfo,
    required TResult Function(EmailPwdSignInAuthInfo value) emailPwdAuthInfo,
  }) {
    return credentialSignInAuthInfo(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(TokenSignInAuthInfo value)? tokenSignInAuthInfo,
    TResult Function(CredentialSignInAuthInfo value)? credentialSignInAuthInfo,
    TResult Function(EmailPwdSignInAuthInfo value)? emailPwdAuthInfo,
  }) {
    return credentialSignInAuthInfo?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(TokenSignInAuthInfo value)? tokenSignInAuthInfo,
    TResult Function(CredentialSignInAuthInfo value)? credentialSignInAuthInfo,
    TResult Function(EmailPwdSignInAuthInfo value)? emailPwdAuthInfo,
    required TResult orElse(),
  }) {
    if (credentialSignInAuthInfo != null) {
      return credentialSignInAuthInfo(this);
    }
    return orElse();
  }
}

abstract class CredentialSignInAuthInfo extends SignInAuthInfo {
  const factory CredentialSignInAuthInfo(final OAuthCredential oAuthCredential,
      final Provider provider, final String email) = _$CredentialSignInAuthInfo;
  const CredentialSignInAuthInfo._() : super._();

  OAuthCredential get oAuthCredential;
  @override
  Provider get provider;
  @override
  String get email;
  @override
  @JsonKey(ignore: true)
  _$$CredentialSignInAuthInfoCopyWith<_$CredentialSignInAuthInfo>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$EmailPwdSignInAuthInfoCopyWith<$Res>
    implements $SignInAuthInfoCopyWith<$Res> {
  factory _$$EmailPwdSignInAuthInfoCopyWith(_$EmailPwdSignInAuthInfo value,
          $Res Function(_$EmailPwdSignInAuthInfo) then) =
      __$$EmailPwdSignInAuthInfoCopyWithImpl<$Res>;
  @override
  $Res call({String password, Provider provider, String email});
}

/// @nodoc
class __$$EmailPwdSignInAuthInfoCopyWithImpl<$Res>
    extends _$SignInAuthInfoCopyWithImpl<$Res>
    implements _$$EmailPwdSignInAuthInfoCopyWith<$Res> {
  __$$EmailPwdSignInAuthInfoCopyWithImpl(_$EmailPwdSignInAuthInfo _value,
      $Res Function(_$EmailPwdSignInAuthInfo) _then)
      : super(_value, (v) => _then(v as _$EmailPwdSignInAuthInfo));

  @override
  _$EmailPwdSignInAuthInfo get _value =>
      super._value as _$EmailPwdSignInAuthInfo;

  @override
  $Res call({
    Object? password = freezed,
    Object? provider = freezed,
    Object? email = freezed,
  }) {
    return _then(_$EmailPwdSignInAuthInfo(
      password == freezed
          ? _value.password
          : password // ignore: cast_nullable_to_non_nullable
              as String,
      provider == freezed
          ? _value.provider
          : provider // ignore: cast_nullable_to_non_nullable
              as Provider,
      email == freezed
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$EmailPwdSignInAuthInfo extends EmailPwdSignInAuthInfo {
  const _$EmailPwdSignInAuthInfo(this.password, this.provider, this.email)
      : super._();

  @override
  final String password;
  @override
  final Provider provider;
  @override
  final String email;

  @override
  String toString() {
    return 'SignInAuthInfo.emailPwdAuthInfo(password: $password, provider: $provider, email: $email)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$EmailPwdSignInAuthInfo &&
            const DeepCollectionEquality().equals(other.password, password) &&
            const DeepCollectionEquality().equals(other.provider, provider) &&
            const DeepCollectionEquality().equals(other.email, email));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(password),
      const DeepCollectionEquality().hash(provider),
      const DeepCollectionEquality().hash(email));

  @JsonKey(ignore: true)
  @override
  _$$EmailPwdSignInAuthInfoCopyWith<_$EmailPwdSignInAuthInfo> get copyWith =>
      __$$EmailPwdSignInAuthInfoCopyWithImpl<_$EmailPwdSignInAuthInfo>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            String customToken, Provider provider, String email)
        tokenSignInAuthInfo,
    required TResult Function(
            OAuthCredential oAuthCredential, Provider provider, String email)
        credentialSignInAuthInfo,
    required TResult Function(String password, Provider provider, String email)
        emailPwdAuthInfo,
  }) {
    return emailPwdAuthInfo(password, provider, email);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(String customToken, Provider provider, String email)?
        tokenSignInAuthInfo,
    TResult Function(
            OAuthCredential oAuthCredential, Provider provider, String email)?
        credentialSignInAuthInfo,
    TResult Function(String password, Provider provider, String email)?
        emailPwdAuthInfo,
  }) {
    return emailPwdAuthInfo?.call(password, provider, email);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String customToken, Provider provider, String email)?
        tokenSignInAuthInfo,
    TResult Function(
            OAuthCredential oAuthCredential, Provider provider, String email)?
        credentialSignInAuthInfo,
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
    required TResult Function(TokenSignInAuthInfo value) tokenSignInAuthInfo,
    required TResult Function(CredentialSignInAuthInfo value)
        credentialSignInAuthInfo,
    required TResult Function(EmailPwdSignInAuthInfo value) emailPwdAuthInfo,
  }) {
    return emailPwdAuthInfo(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(TokenSignInAuthInfo value)? tokenSignInAuthInfo,
    TResult Function(CredentialSignInAuthInfo value)? credentialSignInAuthInfo,
    TResult Function(EmailPwdSignInAuthInfo value)? emailPwdAuthInfo,
  }) {
    return emailPwdAuthInfo?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(TokenSignInAuthInfo value)? tokenSignInAuthInfo,
    TResult Function(CredentialSignInAuthInfo value)? credentialSignInAuthInfo,
    TResult Function(EmailPwdSignInAuthInfo value)? emailPwdAuthInfo,
    required TResult orElse(),
  }) {
    if (emailPwdAuthInfo != null) {
      return emailPwdAuthInfo(this);
    }
    return orElse();
  }
}

abstract class EmailPwdSignInAuthInfo extends SignInAuthInfo {
  const factory EmailPwdSignInAuthInfo(
          final String password, final Provider provider, final String email) =
      _$EmailPwdSignInAuthInfo;
  const EmailPwdSignInAuthInfo._() : super._();

  String get password;
  @override
  Provider get provider;
  @override
  String get email;
  @override
  @JsonKey(ignore: true)
  _$$EmailPwdSignInAuthInfoCopyWith<_$EmailPwdSignInAuthInfo> get copyWith =>
      throw _privateConstructorUsedError;
}
