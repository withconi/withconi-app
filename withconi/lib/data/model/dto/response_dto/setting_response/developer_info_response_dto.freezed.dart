// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'developer_info_response_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

DeveloperInfoResponseDTO _$DeveloperInfoResponseDTOFromJson(
    Map<String, dynamic> json) {
  return _DeveloperInfoResponseDTO.fromJson(json);
}

/// @nodoc
mixin _$DeveloperInfoResponseDTO {
  String get buymeacoffee => throw _privateConstructorUsedError;
  String get github => throw _privateConstructorUsedError;
  String get mail => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $DeveloperInfoResponseDTOCopyWith<DeveloperInfoResponseDTO> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DeveloperInfoResponseDTOCopyWith<$Res> {
  factory $DeveloperInfoResponseDTOCopyWith(DeveloperInfoResponseDTO value,
          $Res Function(DeveloperInfoResponseDTO) then) =
      _$DeveloperInfoResponseDTOCopyWithImpl<$Res, DeveloperInfoResponseDTO>;
  @useResult
  $Res call({String buymeacoffee, String github, String mail});
}

/// @nodoc
class _$DeveloperInfoResponseDTOCopyWithImpl<$Res,
        $Val extends DeveloperInfoResponseDTO>
    implements $DeveloperInfoResponseDTOCopyWith<$Res> {
  _$DeveloperInfoResponseDTOCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? buymeacoffee = null,
    Object? github = null,
    Object? mail = null,
  }) {
    return _then(_value.copyWith(
      buymeacoffee: null == buymeacoffee
          ? _value.buymeacoffee
          : buymeacoffee // ignore: cast_nullable_to_non_nullable
              as String,
      github: null == github
          ? _value.github
          : github // ignore: cast_nullable_to_non_nullable
              as String,
      mail: null == mail
          ? _value.mail
          : mail // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_DeveloperInfoResponseDTOCopyWith<$Res>
    implements $DeveloperInfoResponseDTOCopyWith<$Res> {
  factory _$$_DeveloperInfoResponseDTOCopyWith(
          _$_DeveloperInfoResponseDTO value,
          $Res Function(_$_DeveloperInfoResponseDTO) then) =
      __$$_DeveloperInfoResponseDTOCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String buymeacoffee, String github, String mail});
}

/// @nodoc
class __$$_DeveloperInfoResponseDTOCopyWithImpl<$Res>
    extends _$DeveloperInfoResponseDTOCopyWithImpl<$Res,
        _$_DeveloperInfoResponseDTO>
    implements _$$_DeveloperInfoResponseDTOCopyWith<$Res> {
  __$$_DeveloperInfoResponseDTOCopyWithImpl(_$_DeveloperInfoResponseDTO _value,
      $Res Function(_$_DeveloperInfoResponseDTO) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? buymeacoffee = null,
    Object? github = null,
    Object? mail = null,
  }) {
    return _then(_$_DeveloperInfoResponseDTO(
      buymeacoffee: null == buymeacoffee
          ? _value.buymeacoffee
          : buymeacoffee // ignore: cast_nullable_to_non_nullable
              as String,
      github: null == github
          ? _value.github
          : github // ignore: cast_nullable_to_non_nullable
              as String,
      mail: null == mail
          ? _value.mail
          : mail // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

@JsonSerializable(explicitToJson: true)
class _$_DeveloperInfoResponseDTO implements _DeveloperInfoResponseDTO {
  _$_DeveloperInfoResponseDTO(
      {this.buymeacoffee = '', this.github = '', this.mail = ''});

  factory _$_DeveloperInfoResponseDTO.fromJson(Map<String, dynamic> json) =>
      _$$_DeveloperInfoResponseDTOFromJson(json);

  @override
  @JsonKey()
  final String buymeacoffee;
  @override
  @JsonKey()
  final String github;
  @override
  @JsonKey()
  final String mail;

  @override
  String toString() {
    return 'DeveloperInfoResponseDTO(buymeacoffee: $buymeacoffee, github: $github, mail: $mail)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_DeveloperInfoResponseDTO &&
            (identical(other.buymeacoffee, buymeacoffee) ||
                other.buymeacoffee == buymeacoffee) &&
            (identical(other.github, github) || other.github == github) &&
            (identical(other.mail, mail) || other.mail == mail));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, buymeacoffee, github, mail);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_DeveloperInfoResponseDTOCopyWith<_$_DeveloperInfoResponseDTO>
      get copyWith => __$$_DeveloperInfoResponseDTOCopyWithImpl<
          _$_DeveloperInfoResponseDTO>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_DeveloperInfoResponseDTOToJson(
      this,
    );
  }
}

abstract class _DeveloperInfoResponseDTO implements DeveloperInfoResponseDTO {
  factory _DeveloperInfoResponseDTO(
      {final String buymeacoffee,
      final String github,
      final String mail}) = _$_DeveloperInfoResponseDTO;

  factory _DeveloperInfoResponseDTO.fromJson(Map<String, dynamic> json) =
      _$_DeveloperInfoResponseDTO.fromJson;

  @override
  String get buymeacoffee;
  @override
  String get github;
  @override
  String get mail;
  @override
  @JsonKey(ignore: true)
  _$$_DeveloperInfoResponseDTOCopyWith<_$_DeveloperInfoResponseDTO>
      get copyWith => throw _privateConstructorUsedError;
}
