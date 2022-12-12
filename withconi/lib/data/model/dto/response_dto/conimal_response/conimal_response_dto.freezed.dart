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
  @JsonKey(name: '_id')
  String get conimalId => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  Species get species => throw _privateConstructorUsedError;
  Gender get gender => throw _privateConstructorUsedError;
  bool get isNeutralized => throw _privateConstructorUsedError;
  @JsonKey(name: 'speciesName')
  String get breed => throw _privateConstructorUsedError;
  String? get userId => throw _privateConstructorUsedError;
  @DateTimeConverter()
  DateTime get birthDate => throw _privateConstructorUsedError;
  @DateTimeConverter()
  DateTime get adoptedDate => throw _privateConstructorUsedError;
  List<DiseaseResponseDTO> get diseases => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ConimalResponseDTOCopyWith<ConimalResponseDTO> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ConimalResponseDTOCopyWith<$Res> {
  factory $ConimalResponseDTOCopyWith(
          ConimalResponseDTO value, $Res Function(ConimalResponseDTO) then) =
      _$ConimalResponseDTOCopyWithImpl<$Res, ConimalResponseDTO>;
  @useResult
  $Res call(
      {@JsonKey(name: '_id') String conimalId,
      String name,
      Species species,
      Gender gender,
      bool isNeutralized,
      @JsonKey(name: 'speciesName') String breed,
      String? userId,
      @DateTimeConverter() DateTime birthDate,
      @DateTimeConverter() DateTime adoptedDate,
      List<DiseaseResponseDTO> diseases});
}

/// @nodoc
class _$ConimalResponseDTOCopyWithImpl<$Res, $Val extends ConimalResponseDTO>
    implements $ConimalResponseDTOCopyWith<$Res> {
  _$ConimalResponseDTOCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? conimalId = null,
    Object? name = null,
    Object? species = null,
    Object? gender = null,
    Object? isNeutralized = null,
    Object? breed = null,
    Object? userId = freezed,
    Object? birthDate = null,
    Object? adoptedDate = null,
    Object? diseases = null,
  }) {
    return _then(_value.copyWith(
      conimalId: null == conimalId
          ? _value.conimalId
          : conimalId // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      species: null == species
          ? _value.species
          : species // ignore: cast_nullable_to_non_nullable
              as Species,
      gender: null == gender
          ? _value.gender
          : gender // ignore: cast_nullable_to_non_nullable
              as Gender,
      isNeutralized: null == isNeutralized
          ? _value.isNeutralized
          : isNeutralized // ignore: cast_nullable_to_non_nullable
              as bool,
      breed: null == breed
          ? _value.breed
          : breed // ignore: cast_nullable_to_non_nullable
              as String,
      userId: freezed == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String?,
      birthDate: null == birthDate
          ? _value.birthDate
          : birthDate // ignore: cast_nullable_to_non_nullable
              as DateTime,
      adoptedDate: null == adoptedDate
          ? _value.adoptedDate
          : adoptedDate // ignore: cast_nullable_to_non_nullable
              as DateTime,
      diseases: null == diseases
          ? _value.diseases
          : diseases // ignore: cast_nullable_to_non_nullable
              as List<DiseaseResponseDTO>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_ConimalResponseDTOCopyWith<$Res>
    implements $ConimalResponseDTOCopyWith<$Res> {
  factory _$$_ConimalResponseDTOCopyWith(_$_ConimalResponseDTO value,
          $Res Function(_$_ConimalResponseDTO) then) =
      __$$_ConimalResponseDTOCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: '_id') String conimalId,
      String name,
      Species species,
      Gender gender,
      bool isNeutralized,
      @JsonKey(name: 'speciesName') String breed,
      String? userId,
      @DateTimeConverter() DateTime birthDate,
      @DateTimeConverter() DateTime adoptedDate,
      List<DiseaseResponseDTO> diseases});
}

/// @nodoc
class __$$_ConimalResponseDTOCopyWithImpl<$Res>
    extends _$ConimalResponseDTOCopyWithImpl<$Res, _$_ConimalResponseDTO>
    implements _$$_ConimalResponseDTOCopyWith<$Res> {
  __$$_ConimalResponseDTOCopyWithImpl(
      _$_ConimalResponseDTO _value, $Res Function(_$_ConimalResponseDTO) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? conimalId = null,
    Object? name = null,
    Object? species = null,
    Object? gender = null,
    Object? isNeutralized = null,
    Object? breed = null,
    Object? userId = freezed,
    Object? birthDate = null,
    Object? adoptedDate = null,
    Object? diseases = null,
  }) {
    return _then(_$_ConimalResponseDTO(
      conimalId: null == conimalId
          ? _value.conimalId
          : conimalId // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      species: null == species
          ? _value.species
          : species // ignore: cast_nullable_to_non_nullable
              as Species,
      gender: null == gender
          ? _value.gender
          : gender // ignore: cast_nullable_to_non_nullable
              as Gender,
      isNeutralized: null == isNeutralized
          ? _value.isNeutralized
          : isNeutralized // ignore: cast_nullable_to_non_nullable
              as bool,
      breed: null == breed
          ? _value.breed
          : breed // ignore: cast_nullable_to_non_nullable
              as String,
      userId: freezed == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String?,
      birthDate: null == birthDate
          ? _value.birthDate
          : birthDate // ignore: cast_nullable_to_non_nullable
              as DateTime,
      adoptedDate: null == adoptedDate
          ? _value.adoptedDate
          : adoptedDate // ignore: cast_nullable_to_non_nullable
              as DateTime,
      diseases: null == diseases
          ? _value._diseases
          : diseases // ignore: cast_nullable_to_non_nullable
              as List<DiseaseResponseDTO>,
    ));
  }
}

/// @nodoc

@JsonSerializable(explicitToJson: true)
class _$_ConimalResponseDTO implements _ConimalResponseDTO {
  _$_ConimalResponseDTO(
      {@JsonKey(name: '_id') required this.conimalId,
      required this.name,
      required this.species,
      required this.gender,
      this.isNeutralized = false,
      @JsonKey(name: 'speciesName') this.breed = 'breed',
      this.userId = '',
      @DateTimeConverter() required this.birthDate,
      @DateTimeConverter() required this.adoptedDate,
      final List<DiseaseResponseDTO> diseases = const []})
      : _diseases = diseases;

  factory _$_ConimalResponseDTO.fromJson(Map<String, dynamic> json) =>
      _$$_ConimalResponseDTOFromJson(json);

  @override
  @JsonKey(name: '_id')
  final String conimalId;
  @override
  final String name;
  @override
  final Species species;
  @override
  final Gender gender;
  @override
  @JsonKey()
  final bool isNeutralized;
  @override
  @JsonKey(name: 'speciesName')
  final String breed;
  @override
  @JsonKey()
  final String? userId;
  @override
  @DateTimeConverter()
  final DateTime birthDate;
  @override
  @DateTimeConverter()
  final DateTime adoptedDate;
  final List<DiseaseResponseDTO> _diseases;
  @override
  @JsonKey()
  List<DiseaseResponseDTO> get diseases {
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_diseases);
  }

  @override
  String toString() {
    return 'ConimalResponseDTO(conimalId: $conimalId, name: $name, species: $species, gender: $gender, isNeutralized: $isNeutralized, breed: $breed, userId: $userId, birthDate: $birthDate, adoptedDate: $adoptedDate, diseases: $diseases)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_ConimalResponseDTO &&
            (identical(other.conimalId, conimalId) ||
                other.conimalId == conimalId) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.species, species) || other.species == species) &&
            (identical(other.gender, gender) || other.gender == gender) &&
            (identical(other.isNeutralized, isNeutralized) ||
                other.isNeutralized == isNeutralized) &&
            (identical(other.breed, breed) || other.breed == breed) &&
            (identical(other.userId, userId) || other.userId == userId) &&
            (identical(other.birthDate, birthDate) ||
                other.birthDate == birthDate) &&
            (identical(other.adoptedDate, adoptedDate) ||
                other.adoptedDate == adoptedDate) &&
            const DeepCollectionEquality().equals(other._diseases, _diseases));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      conimalId,
      name,
      species,
      gender,
      isNeutralized,
      breed,
      userId,
      birthDate,
      adoptedDate,
      const DeepCollectionEquality().hash(_diseases));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
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
      {@JsonKey(name: '_id') required final String conimalId,
      required final String name,
      required final Species species,
      required final Gender gender,
      final bool isNeutralized,
      @JsonKey(name: 'speciesName') final String breed,
      final String? userId,
      @DateTimeConverter() required final DateTime birthDate,
      @DateTimeConverter() required final DateTime adoptedDate,
      final List<DiseaseResponseDTO> diseases}) = _$_ConimalResponseDTO;

  factory _ConimalResponseDTO.fromJson(Map<String, dynamic> json) =
      _$_ConimalResponseDTO.fromJson;

  @override
  @JsonKey(name: '_id')
  String get conimalId;
  @override
  String get name;
  @override
  Species get species;
  @override
  Gender get gender;
  @override
  bool get isNeutralized;
  @override
  @JsonKey(name: 'speciesName')
  String get breed;
  @override
  String? get userId;
  @override
  @DateTimeConverter()
  DateTime get birthDate;
  @override
  @DateTimeConverter()
  DateTime get adoptedDate;
  @override
  List<DiseaseResponseDTO> get diseases;
  @override
  @JsonKey(ignore: true)
  _$$_ConimalResponseDTOCopyWith<_$_ConimalResponseDTO> get copyWith =>
      throw _privateConstructorUsedError;
}
