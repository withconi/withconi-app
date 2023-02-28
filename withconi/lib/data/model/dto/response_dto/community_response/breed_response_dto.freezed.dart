// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'breed_response_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

BreedResponseDTO _$BreedResponseDTOFromJson(Map<String, dynamic> json) {
  return _BreedResponseDTO.fromJson(json);
}

/// @nodoc
mixin _$BreedResponseDTO {
  String get category => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $BreedResponseDTOCopyWith<BreedResponseDTO> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $BreedResponseDTOCopyWith<$Res> {
  factory $BreedResponseDTOCopyWith(
          BreedResponseDTO value, $Res Function(BreedResponseDTO) then) =
      _$BreedResponseDTOCopyWithImpl<$Res, BreedResponseDTO>;
  @useResult
  $Res call({String category, String name});
}

/// @nodoc
class _$BreedResponseDTOCopyWithImpl<$Res, $Val extends BreedResponseDTO>
    implements $BreedResponseDTOCopyWith<$Res> {
  _$BreedResponseDTOCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? category = null,
    Object? name = null,
  }) {
    return _then(_value.copyWith(
      category: null == category
          ? _value.category
          : category // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_BreedResponseDTOCopyWith<$Res>
    implements $BreedResponseDTOCopyWith<$Res> {
  factory _$$_BreedResponseDTOCopyWith(
          _$_BreedResponseDTO value, $Res Function(_$_BreedResponseDTO) then) =
      __$$_BreedResponseDTOCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String category, String name});
}

/// @nodoc
class __$$_BreedResponseDTOCopyWithImpl<$Res>
    extends _$BreedResponseDTOCopyWithImpl<$Res, _$_BreedResponseDTO>
    implements _$$_BreedResponseDTOCopyWith<$Res> {
  __$$_BreedResponseDTOCopyWithImpl(
      _$_BreedResponseDTO _value, $Res Function(_$_BreedResponseDTO) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? category = null,
    Object? name = null,
  }) {
    return _then(_$_BreedResponseDTO(
      category: null == category
          ? _value.category
          : category // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

@JsonSerializable(explicitToJson: true)
class _$_BreedResponseDTO implements _BreedResponseDTO {
  _$_BreedResponseDTO({required this.category, required this.name});

  factory _$_BreedResponseDTO.fromJson(Map<String, dynamic> json) =>
      _$$_BreedResponseDTOFromJson(json);

  @override
  final String category;
  @override
  final String name;

  @override
  String toString() {
    return 'BreedResponseDTO(category: $category, name: $name)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_BreedResponseDTO &&
            (identical(other.category, category) ||
                other.category == category) &&
            (identical(other.name, name) || other.name == name));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, category, name);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_BreedResponseDTOCopyWith<_$_BreedResponseDTO> get copyWith =>
      __$$_BreedResponseDTOCopyWithImpl<_$_BreedResponseDTO>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_BreedResponseDTOToJson(
      this,
    );
  }
}

abstract class _BreedResponseDTO implements BreedResponseDTO {
  factory _BreedResponseDTO(
      {required final String category,
      required final String name}) = _$_BreedResponseDTO;

  factory _BreedResponseDTO.fromJson(Map<String, dynamic> json) =
      _$_BreedResponseDTO.fromJson;

  @override
  String get category;
  @override
  String get name;
  @override
  @JsonKey(ignore: true)
  _$$_BreedResponseDTOCopyWith<_$_BreedResponseDTO> get copyWith =>
      throw _privateConstructorUsedError;
}
