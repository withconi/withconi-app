// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'custom_token.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

CustomToken _$CustomTokenFromJson(Map<String, dynamic> json) {
  return _CustomToken.fromJson(json);
}

/// @nodoc
mixin _$CustomToken {
  Provider get provider => throw _privateConstructorUsedError;
  String get uid => throw _privateConstructorUsedError;
  String get accessToken => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $CustomTokenCopyWith<CustomToken> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CustomTokenCopyWith<$Res> {
  factory $CustomTokenCopyWith(
          CustomToken value, $Res Function(CustomToken) then) =
      _$CustomTokenCopyWithImpl<$Res>;
  $Res call({Provider provider, String uid, String accessToken});
}

/// @nodoc
class _$CustomTokenCopyWithImpl<$Res> implements $CustomTokenCopyWith<$Res> {
  _$CustomTokenCopyWithImpl(this._value, this._then);

  final CustomToken _value;
  // ignore: unused_field
  final $Res Function(CustomToken) _then;

  @override
  $Res call({
    Object? provider = freezed,
    Object? uid = freezed,
    Object? accessToken = freezed,
  }) {
    return _then(_value.copyWith(
      provider: provider == freezed
          ? _value.provider
          : provider // ignore: cast_nullable_to_non_nullable
              as Provider,
      uid: uid == freezed
          ? _value.uid
          : uid // ignore: cast_nullable_to_non_nullable
              as String,
      accessToken: accessToken == freezed
          ? _value.accessToken
          : accessToken // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
abstract class _$$_CustomTokenCopyWith<$Res>
    implements $CustomTokenCopyWith<$Res> {
  factory _$$_CustomTokenCopyWith(
          _$_CustomToken value, $Res Function(_$_CustomToken) then) =
      __$$_CustomTokenCopyWithImpl<$Res>;
  @override
  $Res call({Provider provider, String uid, String accessToken});
}

/// @nodoc
class __$$_CustomTokenCopyWithImpl<$Res> extends _$CustomTokenCopyWithImpl<$Res>
    implements _$$_CustomTokenCopyWith<$Res> {
  __$$_CustomTokenCopyWithImpl(
      _$_CustomToken _value, $Res Function(_$_CustomToken) _then)
      : super(_value, (v) => _then(v as _$_CustomToken));

  @override
  _$_CustomToken get _value => super._value as _$_CustomToken;

  @override
  $Res call({
    Object? provider = freezed,
    Object? uid = freezed,
    Object? accessToken = freezed,
  }) {
    return _then(_$_CustomToken(
      provider: provider == freezed
          ? _value.provider
          : provider // ignore: cast_nullable_to_non_nullable
              as Provider,
      uid: uid == freezed
          ? _value.uid
          : uid // ignore: cast_nullable_to_non_nullable
              as String,
      accessToken: accessToken == freezed
          ? _value.accessToken
          : accessToken // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_CustomToken implements _CustomToken {
  _$_CustomToken(
      {required this.provider, required this.uid, required this.accessToken});

  factory _$_CustomToken.fromJson(Map<String, dynamic> json) =>
      _$$_CustomTokenFromJson(json);

  @override
  final Provider provider;
  @override
  final String uid;
  @override
  final String accessToken;

  @override
  String toString() {
    return 'CustomToken(provider: $provider, uid: $uid, accessToken: $accessToken)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_CustomToken &&
            const DeepCollectionEquality().equals(other.provider, provider) &&
            const DeepCollectionEquality().equals(other.uid, uid) &&
            const DeepCollectionEquality()
                .equals(other.accessToken, accessToken));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(provider),
      const DeepCollectionEquality().hash(uid),
      const DeepCollectionEquality().hash(accessToken));

  @JsonKey(ignore: true)
  @override
  _$$_CustomTokenCopyWith<_$_CustomToken> get copyWith =>
      __$$_CustomTokenCopyWithImpl<_$_CustomToken>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_CustomTokenToJson(
      this,
    );
  }
}

abstract class _CustomToken implements CustomToken {
  factory _CustomToken(
      {required final Provider provider,
      required final String uid,
      required final String accessToken}) = _$_CustomToken;

  factory _CustomToken.fromJson(Map<String, dynamic> json) =
      _$_CustomToken.fromJson;

  @override
  Provider get provider;
  @override
  String get uid;
  @override
  String get accessToken;
  @override
  @JsonKey(ignore: true)
  _$$_CustomTokenCopyWith<_$_CustomToken> get copyWith =>
      throw _privateConstructorUsedError;
}
