// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'user_response_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

UserResponseDTO _$UserResponseDTOFromJson(Map<String, dynamic> json) {
  return _WcUser.fromJson(json);
}

/// @nodoc
mixin _$UserResponseDTO {
  String get uid => throw _privateConstructorUsedError;
  String get email => throw _privateConstructorUsedError;
  String get displayName => throw _privateConstructorUsedError;
  String get nickname => throw _privateConstructorUsedError;
  Provider get provider => throw _privateConstructorUsedError;
  bool get isEmailVerified => throw _privateConstructorUsedError;
  bool get verificationSkipped => throw _privateConstructorUsedError;
  @JsonKey(name: 'profileImageUrl')
  String get photoURL => throw _privateConstructorUsedError;
  bool get isWrittenReview => throw _privateConstructorUsedError;
  List<ConimalResponseDTO> get conimals => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $UserResponseDTOCopyWith<UserResponseDTO> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UserResponseDTOCopyWith<$Res> {
  factory $UserResponseDTOCopyWith(
          UserResponseDTO value, $Res Function(UserResponseDTO) then) =
      _$UserResponseDTOCopyWithImpl<$Res, UserResponseDTO>;
  @useResult
  $Res call(
      {String uid,
      String email,
      String displayName,
      String nickname,
      Provider provider,
      bool isEmailVerified,
      bool verificationSkipped,
      @JsonKey(name: 'profileImageUrl') String photoURL,
      bool isWrittenReview,
      List<ConimalResponseDTO> conimals});
}

/// @nodoc
class _$UserResponseDTOCopyWithImpl<$Res, $Val extends UserResponseDTO>
    implements $UserResponseDTOCopyWith<$Res> {
  _$UserResponseDTOCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? uid = null,
    Object? email = null,
    Object? displayName = null,
    Object? nickname = null,
    Object? provider = null,
    Object? isEmailVerified = null,
    Object? verificationSkipped = null,
    Object? photoURL = null,
    Object? isWrittenReview = null,
    Object? conimals = null,
  }) {
    return _then(_value.copyWith(
      uid: null == uid
          ? _value.uid
          : uid // ignore: cast_nullable_to_non_nullable
              as String,
      email: null == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      displayName: null == displayName
          ? _value.displayName
          : displayName // ignore: cast_nullable_to_non_nullable
              as String,
      nickname: null == nickname
          ? _value.nickname
          : nickname // ignore: cast_nullable_to_non_nullable
              as String,
      provider: null == provider
          ? _value.provider
          : provider // ignore: cast_nullable_to_non_nullable
              as Provider,
      isEmailVerified: null == isEmailVerified
          ? _value.isEmailVerified
          : isEmailVerified // ignore: cast_nullable_to_non_nullable
              as bool,
      verificationSkipped: null == verificationSkipped
          ? _value.verificationSkipped
          : verificationSkipped // ignore: cast_nullable_to_non_nullable
              as bool,
      photoURL: null == photoURL
          ? _value.photoURL
          : photoURL // ignore: cast_nullable_to_non_nullable
              as String,
      isWrittenReview: null == isWrittenReview
          ? _value.isWrittenReview
          : isWrittenReview // ignore: cast_nullable_to_non_nullable
              as bool,
      conimals: null == conimals
          ? _value.conimals
          : conimals // ignore: cast_nullable_to_non_nullable
              as List<ConimalResponseDTO>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_WcUserCopyWith<$Res>
    implements $UserResponseDTOCopyWith<$Res> {
  factory _$$_WcUserCopyWith(_$_WcUser value, $Res Function(_$_WcUser) then) =
      __$$_WcUserCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String uid,
      String email,
      String displayName,
      String nickname,
      Provider provider,
      bool isEmailVerified,
      bool verificationSkipped,
      @JsonKey(name: 'profileImageUrl') String photoURL,
      bool isWrittenReview,
      List<ConimalResponseDTO> conimals});
}

/// @nodoc
class __$$_WcUserCopyWithImpl<$Res>
    extends _$UserResponseDTOCopyWithImpl<$Res, _$_WcUser>
    implements _$$_WcUserCopyWith<$Res> {
  __$$_WcUserCopyWithImpl(_$_WcUser _value, $Res Function(_$_WcUser) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? uid = null,
    Object? email = null,
    Object? displayName = null,
    Object? nickname = null,
    Object? provider = null,
    Object? isEmailVerified = null,
    Object? verificationSkipped = null,
    Object? photoURL = null,
    Object? isWrittenReview = null,
    Object? conimals = null,
  }) {
    return _then(_$_WcUser(
      uid: null == uid
          ? _value.uid
          : uid // ignore: cast_nullable_to_non_nullable
              as String,
      email: null == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      displayName: null == displayName
          ? _value.displayName
          : displayName // ignore: cast_nullable_to_non_nullable
              as String,
      nickname: null == nickname
          ? _value.nickname
          : nickname // ignore: cast_nullable_to_non_nullable
              as String,
      provider: null == provider
          ? _value.provider
          : provider // ignore: cast_nullable_to_non_nullable
              as Provider,
      isEmailVerified: null == isEmailVerified
          ? _value.isEmailVerified
          : isEmailVerified // ignore: cast_nullable_to_non_nullable
              as bool,
      verificationSkipped: null == verificationSkipped
          ? _value.verificationSkipped
          : verificationSkipped // ignore: cast_nullable_to_non_nullable
              as bool,
      photoURL: null == photoURL
          ? _value.photoURL
          : photoURL // ignore: cast_nullable_to_non_nullable
              as String,
      isWrittenReview: null == isWrittenReview
          ? _value.isWrittenReview
          : isWrittenReview // ignore: cast_nullable_to_non_nullable
              as bool,
      conimals: null == conimals
          ? _value._conimals
          : conimals // ignore: cast_nullable_to_non_nullable
              as List<ConimalResponseDTO>,
    ));
  }
}

/// @nodoc

@JsonSerializable(explicitToJson: true)
class _$_WcUser implements _WcUser {
  _$_WcUser(
      {required this.uid,
      required this.email,
      required this.displayName,
      required this.nickname,
      required this.provider,
      required this.isEmailVerified,
      required this.verificationSkipped,
      @JsonKey(name: 'profileImageUrl') this.photoURL = '',
      this.isWrittenReview = false,
      required final List<ConimalResponseDTO> conimals})
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
  final Provider provider;
  @override
  final bool isEmailVerified;
  @override
  final bool verificationSkipped;
  @override
  @JsonKey(name: 'profileImageUrl')
  final String photoURL;
  @override
  @JsonKey()
  final bool isWrittenReview;
  final List<ConimalResponseDTO> _conimals;
  @override
  List<ConimalResponseDTO> get conimals {
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_conimals);
  }

  @override
  String toString() {
    return 'UserResponseDTO(uid: $uid, email: $email, displayName: $displayName, nickname: $nickname, provider: $provider, isEmailVerified: $isEmailVerified, verificationSkipped: $verificationSkipped, photoURL: $photoURL, isWrittenReview: $isWrittenReview, conimals: $conimals)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_WcUser &&
            (identical(other.uid, uid) || other.uid == uid) &&
            (identical(other.email, email) || other.email == email) &&
            (identical(other.displayName, displayName) ||
                other.displayName == displayName) &&
            (identical(other.nickname, nickname) ||
                other.nickname == nickname) &&
            (identical(other.provider, provider) ||
                other.provider == provider) &&
            (identical(other.isEmailVerified, isEmailVerified) ||
                other.isEmailVerified == isEmailVerified) &&
            (identical(other.verificationSkipped, verificationSkipped) ||
                other.verificationSkipped == verificationSkipped) &&
            (identical(other.photoURL, photoURL) ||
                other.photoURL == photoURL) &&
            (identical(other.isWrittenReview, isWrittenReview) ||
                other.isWrittenReview == isWrittenReview) &&
            const DeepCollectionEquality().equals(other._conimals, _conimals));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      uid,
      email,
      displayName,
      nickname,
      provider,
      isEmailVerified,
      verificationSkipped,
      photoURL,
      isWrittenReview,
      const DeepCollectionEquality().hash(_conimals));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_WcUserCopyWith<_$_WcUser> get copyWith =>
      __$$_WcUserCopyWithImpl<_$_WcUser>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_WcUserToJson(
      this,
    );
  }
}

abstract class _WcUser implements UserResponseDTO {
  factory _WcUser(
      {required final String uid,
      required final String email,
      required final String displayName,
      required final String nickname,
      required final Provider provider,
      required final bool isEmailVerified,
      required final bool verificationSkipped,
      @JsonKey(name: 'profileImageUrl') final String photoURL,
      final bool isWrittenReview,
      required final List<ConimalResponseDTO> conimals}) = _$_WcUser;

  factory _WcUser.fromJson(Map<String, dynamic> json) = _$_WcUser.fromJson;

  @override
  String get uid;
  @override
  String get email;
  @override
  String get displayName;
  @override
  String get nickname;
  @override
  Provider get provider;
  @override
  bool get isEmailVerified;
  @override
  bool get verificationSkipped;
  @override
  @JsonKey(name: 'profileImageUrl')
  String get photoURL;
  @override
  bool get isWrittenReview;
  @override
  List<ConimalResponseDTO> get conimals;
  @override
  @JsonKey(ignore: true)
  _$$_WcUserCopyWith<_$_WcUser> get copyWith =>
      throw _privateConstructorUsedError;
}
