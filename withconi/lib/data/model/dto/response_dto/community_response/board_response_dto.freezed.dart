// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'board_response_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

BoardResponseDTO _$BoardResponseDTOFromJson(Map<String, dynamic> json) {
  return _BoardResponseDTO.fromJson(json);
}

/// @nodoc
mixin _$BoardResponseDTO {
  String get id => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  DiseaseType get diseaseType => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $BoardResponseDTOCopyWith<BoardResponseDTO> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $BoardResponseDTOCopyWith<$Res> {
  factory $BoardResponseDTOCopyWith(
          BoardResponseDTO value, $Res Function(BoardResponseDTO) then) =
      _$BoardResponseDTOCopyWithImpl<$Res, BoardResponseDTO>;
  @useResult
  $Res call({String id, String name, DiseaseType diseaseType});
}

/// @nodoc
class _$BoardResponseDTOCopyWithImpl<$Res, $Val extends BoardResponseDTO>
    implements $BoardResponseDTOCopyWith<$Res> {
  _$BoardResponseDTOCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? diseaseType = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      diseaseType: null == diseaseType
          ? _value.diseaseType
          : diseaseType // ignore: cast_nullable_to_non_nullable
              as DiseaseType,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_BoardResponseDTOCopyWith<$Res>
    implements $BoardResponseDTOCopyWith<$Res> {
  factory _$$_BoardResponseDTOCopyWith(
          _$_BoardResponseDTO value, $Res Function(_$_BoardResponseDTO) then) =
      __$$_BoardResponseDTOCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String id, String name, DiseaseType diseaseType});
}

/// @nodoc
class __$$_BoardResponseDTOCopyWithImpl<$Res>
    extends _$BoardResponseDTOCopyWithImpl<$Res, _$_BoardResponseDTO>
    implements _$$_BoardResponseDTOCopyWith<$Res> {
  __$$_BoardResponseDTOCopyWithImpl(
      _$_BoardResponseDTO _value, $Res Function(_$_BoardResponseDTO) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? diseaseType = null,
  }) {
    return _then(_$_BoardResponseDTO(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      diseaseType: null == diseaseType
          ? _value.diseaseType
          : diseaseType // ignore: cast_nullable_to_non_nullable
              as DiseaseType,
    ));
  }
}

/// @nodoc

@JsonSerializable(explicitToJson: true)
class _$_BoardResponseDTO implements _BoardResponseDTO {
  _$_BoardResponseDTO(
      {required this.id,
      required this.name,
      this.diseaseType = DiseaseType.undefined});

  factory _$_BoardResponseDTO.fromJson(Map<String, dynamic> json) =>
      _$$_BoardResponseDTOFromJson(json);

  @override
  final String id;
  @override
  final String name;
  @override
  @JsonKey()
  final DiseaseType diseaseType;

  @override
  String toString() {
    return 'BoardResponseDTO(id: $id, name: $name, diseaseType: $diseaseType)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_BoardResponseDTO &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.diseaseType, diseaseType) ||
                other.diseaseType == diseaseType));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, name, diseaseType);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_BoardResponseDTOCopyWith<_$_BoardResponseDTO> get copyWith =>
      __$$_BoardResponseDTOCopyWithImpl<_$_BoardResponseDTO>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_BoardResponseDTOToJson(
      this,
    );
  }
}

abstract class _BoardResponseDTO implements BoardResponseDTO {
  factory _BoardResponseDTO(
      {required final String id,
      required final String name,
      final DiseaseType diseaseType}) = _$_BoardResponseDTO;

  factory _BoardResponseDTO.fromJson(Map<String, dynamic> json) =
      _$_BoardResponseDTO.fromJson;

  @override
  String get id;
  @override
  String get name;
  @override
  DiseaseType get diseaseType;
  @override
  @JsonKey(ignore: true)
  _$$_BoardResponseDTOCopyWith<_$_BoardResponseDTO> get copyWith =>
      throw _privateConstructorUsedError;
}
