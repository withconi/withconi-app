// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'conimal_response_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

ConimalResponseDTO _$ConimalResponseDTOFromJson(Map<String, dynamic> json) {
  return _ConimalResponseDTO.fromJson(json);
}

/// @nodoc
mixin _$ConimalResponseDTO {
  String get conimalId => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  Species get species => throw _privateConstructorUsedError;
  Gender get gender => throw _privateConstructorUsedError;
  String? get userId => throw _privateConstructorUsedError;
  @DateTimeConverter()
  DateTime get birthDate => throw _privateConstructorUsedError;
  @DateTimeConverter()
  DateTime get adoptedDate => throw _privateConstructorUsedError;
  @DiseaseIdConverter()
  List<Disease> get diseases => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ConimalResponseDTOCopyWith<ConimalResponseDTO> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ConimalResponseDTOCopyWith<$Res> {
  factory $ConimalResponseDTOCopyWith(
          ConimalResponseDTO value, $Res Function(ConimalResponseDTO) then) =
      _$ConimalResponseDTOCopyWithImpl<$Res>;
  $Res call(
      {String conimalId,
      String name,
      Species species,
      Gender gender,
      String? userId,
      @DateTimeConverter() DateTime birthDate,
      @DateTimeConverter() DateTime adoptedDate,
      @DiseaseIdConverter() List<Disease> diseases});
}

/// @nodoc
class _$ConimalResponseDTOCopyWithImpl<$Res>
    implements $ConimalResponseDTOCopyWith<$Res> {
  _$ConimalResponseDTOCopyWithImpl(this._value, this._then);

  final ConimalResponseDTO _value;
  // ignore: unused_field
  final $Res Function(ConimalResponseDTO) _then;

  @override
  $Res call({
    Object? conimalId = freezed,
    Object? name = freezed,
    Object? species = freezed,
    Object? gender = freezed,
    Object? userId = freezed,
    Object? birthDate = freezed,
    Object? adoptedDate = freezed,
    Object? diseases = freezed,
  }) {
    return _then(_value.copyWith(
      conimalId: conimalId == freezed
          ? _value.conimalId
          : conimalId // ignore: cast_nullable_to_non_nullable
              as String,
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      species: species == freezed
          ? _value.species
          : species // ignore: cast_nullable_to_non_nullable
              as Species,
      gender: gender == freezed
          ? _value.gender
          : gender // ignore: cast_nullable_to_non_nullable
              as Gender,
      userId: userId == freezed
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String?,
      birthDate: birthDate == freezed
          ? _value.birthDate
          : birthDate // ignore: cast_nullable_to_non_nullable
              as DateTime,
      adoptedDate: adoptedDate == freezed
          ? _value.adoptedDate
          : adoptedDate // ignore: cast_nullable_to_non_nullable
              as DateTime,
      diseases: diseases == freezed
          ? _value.diseases
          : diseases // ignore: cast_nullable_to_non_nullable
              as List<Disease>,
    ));
  }
}

/// @nodoc
abstract class _$$_ConimalResponseDTOCopyWith<$Res>
    implements $ConimalResponseDTOCopyWith<$Res> {
  factory _$$_ConimalResponseDTOCopyWith(_$_ConimalResponseDTO value,
          $Res Function(_$_ConimalResponseDTO) then) =
      __$$_ConimalResponseDTOCopyWithImpl<$Res>;
  @override
  $Res call(
      {String conimalId,
      String name,
      Species species,
      Gender gender,
      String? userId,
      @DateTimeConverter() DateTime birthDate,
      @DateTimeConverter() DateTime adoptedDate,
      @DiseaseIdConverter() List<Disease> diseases});
}

/// @nodoc
class __$$_ConimalResponseDTOCopyWithImpl<$Res>
    extends _$ConimalResponseDTOCopyWithImpl<$Res>
    implements _$$_ConimalResponseDTOCopyWith<$Res> {
  __$$_ConimalResponseDTOCopyWithImpl(
      _$_ConimalResponseDTO _value, $Res Function(_$_ConimalResponseDTO) _then)
      : super(_value, (v) => _then(v as _$_ConimalResponseDTO));

  @override
  _$_ConimalResponseDTO get _value => super._value as _$_ConimalResponseDTO;

  @override
  $Res call({
    Object? conimalId = freezed,
    Object? name = freezed,
    Object? species = freezed,
    Object? gender = freezed,
    Object? userId = freezed,
    Object? birthDate = freezed,
    Object? adoptedDate = freezed,
    Object? diseases = freezed,
  }) {
    return _then(_$_ConimalResponseDTO(
      conimalId: conimalId == freezed
          ? _value.conimalId
          : conimalId // ignore: cast_nullable_to_non_nullable
              as String,
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      species: species == freezed
          ? _value.species
          : species // ignore: cast_nullable_to_non_nullable
              as Species,
      gender: gender == freezed
          ? _value.gender
          : gender // ignore: cast_nullable_to_non_nullable
              as Gender,
      userId: userId == freezed
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String?,
      birthDate: birthDate == freezed
          ? _value.birthDate
          : birthDate // ignore: cast_nullable_to_non_nullable
              as DateTime,
      adoptedDate: adoptedDate == freezed
          ? _value.adoptedDate
          : adoptedDate // ignore: cast_nullable_to_non_nullable
              as DateTime,
      diseases: diseases == freezed
          ? _value._diseases
          : diseases // ignore: cast_nullable_to_non_nullable
              as List<Disease>,
    ));
  }
}

/// @nodoc

@JsonSerializable(explicitToJson: true)
class _$_ConimalResponseDTO implements _ConimalResponseDTO {
  _$_ConimalResponseDTO(
      {required this.conimalId,
      required this.name,
      required this.species,
      required this.gender,
      this.userId = '',
      @DateTimeConverter() required this.birthDate,
      @DateTimeConverter() required this.adoptedDate,
      @DiseaseIdConverter() final List<Disease> diseases = const []})
      : _diseases = diseases;

  factory _$_ConimalResponseDTO.fromJson(Map<String, dynamic> json) =>
      _$$_ConimalResponseDTOFromJson(json);

  @override
  final String conimalId;
  @override
  final String name;
  @override
  final Species species;
  @override
  final Gender gender;
  @override
  @JsonKey()
  final String? userId;
  @override
  @DateTimeConverter()
  final DateTime birthDate;
  @override
  @DateTimeConverter()
  final DateTime adoptedDate;
  final List<Disease> _diseases;
  @override
  @JsonKey()
  @DiseaseIdConverter()
  List<Disease> get diseases {
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_diseases);
  }

  @override
  String toString() {
    return 'ConimalResponseDTO(conimalId: $conimalId, name: $name, species: $species, gender: $gender, userId: $userId, birthDate: $birthDate, adoptedDate: $adoptedDate, diseases: $diseases)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_ConimalResponseDTO &&
            const DeepCollectionEquality().equals(other.conimalId, conimalId) &&
            const DeepCollectionEquality().equals(other.name, name) &&
            const DeepCollectionEquality().equals(other.species, species) &&
            const DeepCollectionEquality().equals(other.gender, gender) &&
            const DeepCollectionEquality().equals(other.userId, userId) &&
            const DeepCollectionEquality().equals(other.birthDate, birthDate) &&
            const DeepCollectionEquality()
                .equals(other.adoptedDate, adoptedDate) &&
            const DeepCollectionEquality().equals(other._diseases, _diseases));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(conimalId),
      const DeepCollectionEquality().hash(name),
      const DeepCollectionEquality().hash(species),
      const DeepCollectionEquality().hash(gender),
      const DeepCollectionEquality().hash(userId),
      const DeepCollectionEquality().hash(birthDate),
      const DeepCollectionEquality().hash(adoptedDate),
      const DeepCollectionEquality().hash(_diseases));

  @JsonKey(ignore: true)
  @override
  _$$_ConimalResponseDTOCopyWith<_$_ConimalResponseDTO> get copyWith =>
      __$$_ConimalResponseDTOCopyWithImpl<_$_ConimalResponseDTO>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_ConimalResponseDTOToJson(
      this,
    );
  }
}

abstract class _ConimalResponseDTO implements ConimalResponseDTO {
  factory _ConimalResponseDTO(
          {required final String conimalId,
          required final String name,
          required final Species species,
          required final Gender gender,
          final String? userId,
          @DateTimeConverter() required final DateTime birthDate,
          @DateTimeConverter() required final DateTime adoptedDate,
          @DiseaseIdConverter() final List<Disease> diseases}) =
      _$_ConimalResponseDTO;

  factory _ConimalResponseDTO.fromJson(Map<String, dynamic> json) =
      _$_ConimalResponseDTO.fromJson;

  @override
  String get conimalId;
  @override
  String get name;
  @override
  Species get species;
  @override
  Gender get gender;
  @override
  String? get userId;
  @override
  @DateTimeConverter()
  DateTime get birthDate;
  @override
  @DateTimeConverter()
  DateTime get adoptedDate;
  @override
  @DiseaseIdConverter()
  List<Disease> get diseases;
  @override
  @JsonKey(ignore: true)
  _$$_ConimalResponseDTOCopyWith<_$_ConimalResponseDTO> get copyWith =>
      throw _privateConstructorUsedError;
}
