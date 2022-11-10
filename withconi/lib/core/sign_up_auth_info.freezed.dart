// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'sign_up_auth_info.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$SignUpAuthInfo {
  Provider get provider => throw _privateConstructorUsedError;
  String get email => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            String? customToken, Provider provider, String email)
        tokenAuthInfo,
    required TResult Function(
            OAuthCredential? oAuthCredential, Provider provider, String email)
        credentialAuthInfo,
    required TResult Function(String? password, Provider provider, String email)
        emailPwdAuthInfo,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(String? customToken, Provider provider, String email)?
        tokenAuthInfo,
    TResult Function(
            OAuthCredential? oAuthCredential, Provider provider, String email)?
        credentialAuthInfo,
    TResult Function(String? password, Provider provider, String email)?
        emailPwdAuthInfo,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String? customToken, Provider provider, String email)?
        tokenAuthInfo,
    TResult Function(
            OAuthCredential? oAuthCredential, Provider provider, String email)?
        credentialAuthInfo,
    TResult Function(String? password, Provider provider, String email)?
        emailPwdAuthInfo,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(TokenSignUpAuthInfo value) tokenAuthInfo,
    required TResult Function(CredentialSignUpAuthInfo value)
        credentialAuthInfo,
    required TResult Function(EmailPwdSignUpAuthInfo value) emailPwdAuthInfo,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(TokenSignUpAuthInfo value)? tokenAuthInfo,
    TResult Function(CredentialSignUpAuthInfo value)? credentialAuthInfo,
    TResult Function(EmailPwdSignUpAuthInfo value)? emailPwdAuthInfo,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(TokenSignUpAuthInfo value)? tokenAuthInfo,
    TResult Function(CredentialSignUpAuthInfo value)? credentialAuthInfo,
    TResult Function(EmailPwdSignUpAuthInfo value)? emailPwdAuthInfo,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $SignUpAuthInfoCopyWith<SignUpAuthInfo> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SignUpAuthInfoCopyWith<$Res> {
  factory $SignUpAuthInfoCopyWith(
          SignUpAuthInfo value, $Res Function(SignUpAuthInfo) then) =
      _$SignUpAuthInfoCopyWithImpl<$Res>;
  $Res call({Provider provider, String email});
}

/// @nodoc
class _$SignUpAuthInfoCopyWithImpl<$Res>
    implements $SignUpAuthInfoCopyWith<$Res> {
  _$SignUpAuthInfoCopyWithImpl(this._value, this._then);

  final SignUpAuthInfo _value;
  // ignore: unused_field
  final $Res Function(SignUpAuthInfo) _then;

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
abstract class _$$TokenSignUpAuthInfoCopyWith<$Res>
    implements $SignUpAuthInfoCopyWith<$Res> {
  factory _$$TokenSignUpAuthInfoCopyWith(_$TokenSignUpAuthInfo value,
          $Res Function(_$TokenSignUpAuthInfo) then) =
      __$$TokenSignUpAuthInfoCopyWithImpl<$Res>;
  @override
  $Res call({String? customToken, Provider provider, String email});
}

/// @nodoc
class __$$TokenSignUpAuthInfoCopyWithImpl<$Res>
    extends _$SignUpAuthInfoCopyWithImpl<$Res>
    implements _$$TokenSignUpAuthInfoCopyWith<$Res> {
  __$$TokenSignUpAuthInfoCopyWithImpl(
      _$TokenSignUpAuthInfo _value, $Res Function(_$TokenSignUpAuthInfo) _then)
      : super(_value, (v) => _then(v as _$TokenSignUpAuthInfo));

  @override
  _$TokenSignUpAuthInfo get _value => super._value as _$TokenSignUpAuthInfo;

  @override
  $Res call({
    Object? customToken = freezed,
    Object? provider = freezed,
    Object? email = freezed,
  }) {
    return _then(_$TokenSignUpAuthInfo(
      customToken: customToken == freezed
          ? _value.customToken
          : customToken // ignore: cast_nullable_to_non_nullable
              as String?,
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

class _$TokenSignUpAuthInfo extends TokenSignUpAuthInfo {
  const _$TokenSignUpAuthInfo(
      {this.customToken, required this.provider, required this.email})
      : super._();

  @override
  final String? customToken;
  @override
  final Provider provider;
  @override
  final String email;

  @override
  String toString() {
    return 'SignUpAuthInfo.tokenAuthInfo(customToken: $customToken, provider: $provider, email: $email)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TokenSignUpAuthInfo &&
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
  _$$TokenSignUpAuthInfoCopyWith<_$TokenSignUpAuthInfo> get copyWith =>
      __$$TokenSignUpAuthInfoCopyWithImpl<_$TokenSignUpAuthInfo>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            String? customToken, Provider provider, String email)
        tokenAuthInfo,
    required TResult Function(
            OAuthCredential? oAuthCredential, Provider provider, String email)
        credentialAuthInfo,
    required TResult Function(String? password, Provider provider, String email)
        emailPwdAuthInfo,
  }) {
    return tokenAuthInfo(customToken, provider, email);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(String? customToken, Provider provider, String email)?
        tokenAuthInfo,
    TResult Function(
            OAuthCredential? oAuthCredential, Provider provider, String email)?
        credentialAuthInfo,
    TResult Function(String? password, Provider provider, String email)?
        emailPwdAuthInfo,
  }) {
    return tokenAuthInfo?.call(customToken, provider, email);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String? customToken, Provider provider, String email)?
        tokenAuthInfo,
    TResult Function(
            OAuthCredential? oAuthCredential, Provider provider, String email)?
        credentialAuthInfo,
    TResult Function(String? password, Provider provider, String email)?
        emailPwdAuthInfo,
    required TResult orElse(),
  }) {
    if (tokenAuthInfo != null) {
      return tokenAuthInfo(customToken, provider, email);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(TokenSignUpAuthInfo value) tokenAuthInfo,
    required TResult Function(CredentialSignUpAuthInfo value)
        credentialAuthInfo,
    required TResult Function(EmailPwdSignUpAuthInfo value) emailPwdAuthInfo,
  }) {
    return tokenAuthInfo(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(TokenSignUpAuthInfo value)? tokenAuthInfo,
    TResult Function(CredentialSignUpAuthInfo value)? credentialAuthInfo,
    TResult Function(EmailPwdSignUpAuthInfo value)? emailPwdAuthInfo,
  }) {
    return tokenAuthInfo?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(TokenSignUpAuthInfo value)? tokenAuthInfo,
    TResult Function(CredentialSignUpAuthInfo value)? credentialAuthInfo,
    TResult Function(EmailPwdSignUpAuthInfo value)? emailPwdAuthInfo,
    required TResult orElse(),
  }) {
    if (tokenAuthInfo != null) {
      return tokenAuthInfo(this);
    }
    return orElse();
  }
}

abstract class TokenSignUpAuthInfo extends SignUpAuthInfo {
  const factory TokenSignUpAuthInfo(
      {final String? customToken,
      required final Provider provider,
      required final String email}) = _$TokenSignUpAuthInfo;
  const TokenSignUpAuthInfo._() : super._();

  String? get customToken;
  @override
  Provider get provider;
  @override
  String get email;
  @override
  @JsonKey(ignore: true)
  _$$TokenSignUpAuthInfoCopyWith<_$TokenSignUpAuthInfo> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$CredentialSignUpAuthInfoCopyWith<$Res>
    implements $SignUpAuthInfoCopyWith<$Res> {
  factory _$$CredentialSignUpAuthInfoCopyWith(_$CredentialSignUpAuthInfo value,
          $Res Function(_$CredentialSignUpAuthInfo) then) =
      __$$CredentialSignUpAuthInfoCopyWithImpl<$Res>;
  @override
  $Res call(
      {OAuthCredential? oAuthCredential, Provider provider, String email});
}

/// @nodoc
class __$$CredentialSignUpAuthInfoCopyWithImpl<$Res>
    extends _$SignUpAuthInfoCopyWithImpl<$Res>
    implements _$$CredentialSignUpAuthInfoCopyWith<$Res> {
  __$$CredentialSignUpAuthInfoCopyWithImpl(_$CredentialSignUpAuthInfo _value,
      $Res Function(_$CredentialSignUpAuthInfo) _then)
      : super(_value, (v) => _then(v as _$CredentialSignUpAuthInfo));

  @override
  _$CredentialSignUpAuthInfo get _value =>
      super._value as _$CredentialSignUpAuthInfo;

  @override
  $Res call({
    Object? oAuthCredential = freezed,
    Object? provider = freezed,
    Object? email = freezed,
  }) {
    return _then(_$CredentialSignUpAuthInfo(
      oAuthCredential: oAuthCredential == freezed
          ? _value.oAuthCredential
          : oAuthCredential // ignore: cast_nullable_to_non_nullable
              as OAuthCredential?,
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

class _$CredentialSignUpAuthInfo extends CredentialSignUpAuthInfo {
  const _$CredentialSignUpAuthInfo(
      {this.oAuthCredential, required this.provider, required this.email})
      : super._();

  @override
  final OAuthCredential? oAuthCredential;
  @override
  final Provider provider;
  @override
  final String email;

  @override
  String toString() {
    return 'SignUpAuthInfo.credentialAuthInfo(oAuthCredential: $oAuthCredential, provider: $provider, email: $email)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CredentialSignUpAuthInfo &&
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
  _$$CredentialSignUpAuthInfoCopyWith<_$CredentialSignUpAuthInfo>
      get copyWith =>
          __$$CredentialSignUpAuthInfoCopyWithImpl<_$CredentialSignUpAuthInfo>(
              this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            String? customToken, Provider provider, String email)
        tokenAuthInfo,
    required TResult Function(
            OAuthCredential? oAuthCredential, Provider provider, String email)
        credentialAuthInfo,
    required TResult Function(String? password, Provider provider, String email)
        emailPwdAuthInfo,
  }) {
    return credentialAuthInfo(oAuthCredential, provider, email);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(String? customToken, Provider provider, String email)?
        tokenAuthInfo,
    TResult Function(
            OAuthCredential? oAuthCredential, Provider provider, String email)?
        credentialAuthInfo,
    TResult Function(String? password, Provider provider, String email)?
        emailPwdAuthInfo,
  }) {
    return credentialAuthInfo?.call(oAuthCredential, provider, email);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String? customToken, Provider provider, String email)?
        tokenAuthInfo,
    TResult Function(
            OAuthCredential? oAuthCredential, Provider provider, String email)?
        credentialAuthInfo,
    TResult Function(String? password, Provider provider, String email)?
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
    required TResult Function(TokenSignUpAuthInfo value) tokenAuthInfo,
    required TResult Function(CredentialSignUpAuthInfo value)
        credentialAuthInfo,
    required TResult Function(EmailPwdSignUpAuthInfo value) emailPwdAuthInfo,
  }) {
    return credentialAuthInfo(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(TokenSignUpAuthInfo value)? tokenAuthInfo,
    TResult Function(CredentialSignUpAuthInfo value)? credentialAuthInfo,
    TResult Function(EmailPwdSignUpAuthInfo value)? emailPwdAuthInfo,
  }) {
    return credentialAuthInfo?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(TokenSignUpAuthInfo value)? tokenAuthInfo,
    TResult Function(CredentialSignUpAuthInfo value)? credentialAuthInfo,
    TResult Function(EmailPwdSignUpAuthInfo value)? emailPwdAuthInfo,
    required TResult orElse(),
  }) {
    if (credentialAuthInfo != null) {
      return credentialAuthInfo(this);
    }
    return orElse();
  }
}

abstract class CredentialSignUpAuthInfo extends SignUpAuthInfo {
  const factory CredentialSignUpAuthInfo(
      {final OAuthCredential? oAuthCredential,
      required final Provider provider,
      required final String email}) = _$CredentialSignUpAuthInfo;
  const CredentialSignUpAuthInfo._() : super._();

  OAuthCredential? get oAuthCredential;
  @override
  Provider get provider;
  @override
  String get email;
  @override
  @JsonKey(ignore: true)
  _$$CredentialSignUpAuthInfoCopyWith<_$CredentialSignUpAuthInfo>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$EmailPwdSignUpAuthInfoCopyWith<$Res>
    implements $SignUpAuthInfoCopyWith<$Res> {
  factory _$$EmailPwdSignUpAuthInfoCopyWith(_$EmailPwdSignUpAuthInfo value,
          $Res Function(_$EmailPwdSignUpAuthInfo) then) =
      __$$EmailPwdSignUpAuthInfoCopyWithImpl<$Res>;
  @override
  $Res call({String? password, Provider provider, String email});
}

/// @nodoc
class __$$EmailPwdSignUpAuthInfoCopyWithImpl<$Res>
    extends _$SignUpAuthInfoCopyWithImpl<$Res>
    implements _$$EmailPwdSignUpAuthInfoCopyWith<$Res> {
  __$$EmailPwdSignUpAuthInfoCopyWithImpl(_$EmailPwdSignUpAuthInfo _value,
      $Res Function(_$EmailPwdSignUpAuthInfo) _then)
      : super(_value, (v) => _then(v as _$EmailPwdSignUpAuthInfo));

  @override
  _$EmailPwdSignUpAuthInfo get _value =>
      super._value as _$EmailPwdSignUpAuthInfo;

  @override
  $Res call({
    Object? password = freezed,
    Object? provider = freezed,
    Object? email = freezed,
  }) {
    return _then(_$EmailPwdSignUpAuthInfo(
      password: password == freezed
          ? _value.password
          : password // ignore: cast_nullable_to_non_nullable
              as String?,
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

class _$EmailPwdSignUpAuthInfo extends EmailPwdSignUpAuthInfo {
  const _$EmailPwdSignUpAuthInfo(
      {this.password, required this.provider, required this.email})
      : super._();

  @override
  final String? password;
  @override
  final Provider provider;
  @override
  final String email;

  @override
  String toString() {
    return 'SignUpAuthInfo.emailPwdAuthInfo(password: $password, provider: $provider, email: $email)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$EmailPwdSignUpAuthInfo &&
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
  _$$EmailPwdSignUpAuthInfoCopyWith<_$EmailPwdSignUpAuthInfo> get copyWith =>
      __$$EmailPwdSignUpAuthInfoCopyWithImpl<_$EmailPwdSignUpAuthInfo>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            String? customToken, Provider provider, String email)
        tokenAuthInfo,
    required TResult Function(
            OAuthCredential? oAuthCredential, Provider provider, String email)
        credentialAuthInfo,
    required TResult Function(String? password, Provider provider, String email)
        emailPwdAuthInfo,
  }) {
    return emailPwdAuthInfo(password, provider, email);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(String? customToken, Provider provider, String email)?
        tokenAuthInfo,
    TResult Function(
            OAuthCredential? oAuthCredential, Provider provider, String email)?
        credentialAuthInfo,
    TResult Function(String? password, Provider provider, String email)?
        emailPwdAuthInfo,
  }) {
    return emailPwdAuthInfo?.call(password, provider, email);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String? customToken, Provider provider, String email)?
        tokenAuthInfo,
    TResult Function(
            OAuthCredential? oAuthCredential, Provider provider, String email)?
        credentialAuthInfo,
    TResult Function(String? password, Provider provider, String email)?
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
    required TResult Function(TokenSignUpAuthInfo value) tokenAuthInfo,
    required TResult Function(CredentialSignUpAuthInfo value)
        credentialAuthInfo,
    required TResult Function(EmailPwdSignUpAuthInfo value) emailPwdAuthInfo,
  }) {
    return emailPwdAuthInfo(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(TokenSignUpAuthInfo value)? tokenAuthInfo,
    TResult Function(CredentialSignUpAuthInfo value)? credentialAuthInfo,
    TResult Function(EmailPwdSignUpAuthInfo value)? emailPwdAuthInfo,
  }) {
    return emailPwdAuthInfo?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(TokenSignUpAuthInfo value)? tokenAuthInfo,
    TResult Function(CredentialSignUpAuthInfo value)? credentialAuthInfo,
    TResult Function(EmailPwdSignUpAuthInfo value)? emailPwdAuthInfo,
    required TResult orElse(),
  }) {
    if (emailPwdAuthInfo != null) {
      return emailPwdAuthInfo(this);
    }
    return orElse();
  }
}

abstract class EmailPwdSignUpAuthInfo extends SignUpAuthInfo {
  const factory EmailPwdSignUpAuthInfo(
      {final String? password,
      required final Provider provider,
      required final String email}) = _$EmailPwdSignUpAuthInfo;
  const EmailPwdSignUpAuthInfo._() : super._();

  String? get password;
  @override
  Provider get provider;
  @override
  String get email;
  @override
  @JsonKey(ignore: true)
  _$$EmailPwdSignUpAuthInfoCopyWith<_$EmailPwdSignUpAuthInfo> get copyWith =>
      throw _privateConstructorUsedError;
}
