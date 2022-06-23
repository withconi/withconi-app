// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'user.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

WcUser _$WcUserFromJson(Map<String, dynamic> json) {
  return _WcUser.fromJson(json);
}

/// @nodoc
mixin _$WcUser {
  String get uid => throw _privateConstructorUsedError;
  String get email => throw _privateConstructorUsedError;
  String get displayName => throw _privateConstructorUsedError;
  String get nickname => throw _privateConstructorUsedError;
  ProviderOptions get provider => throw _privateConstructorUsedError;
  String? get photoURL => throw _privateConstructorUsedError;
  List<Conimal> get conimals => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $WcUserCopyWith<WcUser> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $WcUserCopyWith<$Res> {
  factory $WcUserCopyWith(WcUser value, $Res Function(WcUser) then) =
      _$WcUserCopyWithImpl<$Res>;
  $Res call(
      {String uid,
      String email,
      String displayName,
      String nickname,
      ProviderOptions provider,
      String? photoURL,
      List<Conimal> conimals});
}

/// @nodoc
class _$WcUserCopyWithImpl<$Res> implements $WcUserCopyWith<$Res> {
  _$WcUserCopyWithImpl(this._value, this._then);

  final WcUser _value;
  // ignore: unused_field
  final $Res Function(WcUser) _then;

  @override
  $Res call({
    Object? uid = freezed,
    Object? email = freezed,
    Object? displayName = freezed,
    Object? nickname = freezed,
    Object? provider = freezed,
    Object? photoURL = freezed,
    Object? conimals = freezed,
  }) {
    return _then(_value.copyWith(
      uid: uid == freezed
          ? _value.uid
          : uid // ignore: cast_nullable_to_non_nullable
              as String,
      email: email == freezed
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      displayName: displayName == freezed
          ? _value.displayName
          : displayName // ignore: cast_nullable_to_non_nullable
              as String,
      nickname: nickname == freezed
          ? _value.nickname
          : nickname // ignore: cast_nullable_to_non_nullable
              as String,
      provider: provider == freezed
          ? _value.provider
          : provider // ignore: cast_nullable_to_non_nullable
              as ProviderOptions,
      photoURL: photoURL == freezed
          ? _value.photoURL
          : photoURL // ignore: cast_nullable_to_non_nullable
              as String?,
      conimals: conimals == freezed
          ? _value.conimals
          : conimals // ignore: cast_nullable_to_non_nullable
              as List<Conimal>,
    ));
  }
}

/// @nodoc
abstract class _$$_WcUserCopyWith<$Res> implements $WcUserCopyWith<$Res> {
  factory _$$_WcUserCopyWith(_$_WcUser value, $Res Function(_$_WcUser) then) =
      __$$_WcUserCopyWithImpl<$Res>;
  @override
  $Res call(
      {String uid,
      String email,
      String displayName,
      String nickname,
      ProviderOptions provider,
      String? photoURL,
      List<Conimal> conimals});
}

/// @nodoc
class __$$_WcUserCopyWithImpl<$Res> extends _$WcUserCopyWithImpl<$Res>
    implements _$$_WcUserCopyWith<$Res> {
  __$$_WcUserCopyWithImpl(_$_WcUser _value, $Res Function(_$_WcUser) _then)
      : super(_value, (v) => _then(v as _$_WcUser));

  @override
  _$_WcUser get _value => super._value as _$_WcUser;

  @override
  $Res call({
    Object? uid = freezed,
    Object? email = freezed,
    Object? displayName = freezed,
    Object? nickname = freezed,
    Object? provider = freezed,
    Object? photoURL = freezed,
    Object? conimals = freezed,
  }) {
    return _then(_$_WcUser(
      uid: uid == freezed
          ? _value.uid
          : uid // ignore: cast_nullable_to_non_nullable
              as String,
      email: email == freezed
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      displayName: displayName == freezed
          ? _value.displayName
          : displayName // ignore: cast_nullable_to_non_nullable
              as String,
      nickname: nickname == freezed
          ? _value.nickname
          : nickname // ignore: cast_nullable_to_non_nullable
              as String,
      provider: provider == freezed
          ? _value.provider
          : provider // ignore: cast_nullable_to_non_nullable
              as ProviderOptions,
      photoURL: photoURL == freezed
          ? _value.photoURL
          : photoURL // ignore: cast_nullable_to_non_nullable
              as String?,
      conimals: conimals == freezed
          ? _value._conimals
          : conimals // ignore: cast_nullable_to_non_nullable
              as List<Conimal>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_WcUser implements _WcUser {
  _$_WcUser(
      {required this.uid,
      required this.email,
      required this.displayName,
      required this.nickname,
      required this.provider,
      this.photoURL,
      required final List<Conimal> conimals})
      : _conimals = conimals;

  factory _$_WcUser.fromJson(Map<String, dynamic> json) =>
      _$$_WcUserFromJson(json);

  @override
  final String uid;
  @override
  final String email;
  @override
  final String displayName;
  @override
  final String nickname;
  @override
  final ProviderOptions provider;
  @override
  final String? photoURL;
  final List<Conimal> _conimals;
  @override
  List<Conimal> get conimals {
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_conimals);
  }

  @override
  String toString() {
    return 'WcUser(uid: $uid, email: $email, displayName: $displayName, nickname: $nickname, provider: $provider, photoURL: $photoURL, conimals: $conimals)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_WcUser &&
            const DeepCollectionEquality().equals(other.uid, uid) &&
            const DeepCollectionEquality().equals(other.email, email) &&
            const DeepCollectionEquality()
                .equals(other.displayName, displayName) &&
            const DeepCollectionEquality().equals(other.nickname, nickname) &&
            const DeepCollectionEquality().equals(other.provider, provider) &&
            const DeepCollectionEquality().equals(other.photoURL, photoURL) &&
            const DeepCollectionEquality().equals(other._conimals, _conimals));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(uid),
      const DeepCollectionEquality().hash(email),
      const DeepCollectionEquality().hash(displayName),
      const DeepCollectionEquality().hash(nickname),
      const DeepCollectionEquality().hash(provider),
      const DeepCollectionEquality().hash(photoURL),
      const DeepCollectionEquality().hash(_conimals));

  @JsonKey(ignore: true)
  @override
  _$$_WcUserCopyWith<_$_WcUser> get copyWith =>
      __$$_WcUserCopyWithImpl<_$_WcUser>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_WcUserToJson(this);
  }
}

abstract class _WcUser implements WcUser {
  factory _WcUser(
      {required final String uid,
      required final String email,
      required final String displayName,
      required final String nickname,
      required final ProviderOptions provider,
      final String? photoURL,
      required final List<Conimal> conimals}) = _$_WcUser;

  factory _WcUser.fromJson(Map<String, dynamic> json) = _$_WcUser.fromJson;

  @override
  String get uid => throw _privateConstructorUsedError;
  @override
  String get email => throw _privateConstructorUsedError;
  @override
  String get displayName => throw _privateConstructorUsedError;
  @override
  String get nickname => throw _privateConstructorUsedError;
  @override
  ProviderOptions get provider => throw _privateConstructorUsedError;
  @override
  String? get photoURL => throw _privateConstructorUsedError;
  @override
  List<Conimal> get conimals => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$$_WcUserCopyWith<_$_WcUser> get copyWith =>
      throw _privateConstructorUsedError;
}
