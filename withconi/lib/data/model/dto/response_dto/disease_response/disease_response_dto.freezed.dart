// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'disease_response_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

DiseaseResponseDTO _$DiseaseResponseDTOFromJson(Map<String, dynamic> json) {
  return _DiseaseResponseDTO.fromJson(json);
}

/// @nodoc
mixin _$DiseaseResponseDTO {
  @DateTimeConverter()
  DateTime get createdAt => throw _privateConstructorUsedError;
  @JsonKey(name: '_id')
  String get code =>
      throw _privateConstructorUsedError; // @JsonKey(name: '_id') required String diseaseId,
  String get name => throw _privateConstructorUsedError;
  String get definition => throw _privateConstructorUsedError;
  String get diagnosisTechnique => throw _privateConstructorUsedError;
  String get treatment => throw _privateConstructorUsedError;
  @JsonKey(name: 'detailAdvice')
  String get advice => throw _privateConstructorUsedError;
  List<SymptomGroup> get symptomGroupList => throw _privateConstructorUsedError;
  DiseaseType get diseaseType => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $DiseaseResponseDTOCopyWith<DiseaseResponseDTO> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DiseaseResponseDTOCopyWith<$Res> {
  factory $DiseaseResponseDTOCopyWith(
          DiseaseResponseDTO value, $Res Function(DiseaseResponseDTO) then) =
      _$DiseaseResponseDTOCopyWithImpl<$Res, DiseaseResponseDTO>;
  @useResult
  $Res call(
      {@DateTimeConverter() DateTime createdAt,
      @JsonKey(name: '_id') String code,
      String name,
      String definition,
      String diagnosisTechnique,
      String treatment,
      @JsonKey(name: 'detailAdvice') String advice,
      List<SymptomGroup> symptomGroupList,
      DiseaseType diseaseType});
}

/// @nodoc
class _$DiseaseResponseDTOCopyWithImpl<$Res, $Val extends DiseaseResponseDTO>
    implements $DiseaseResponseDTOCopyWith<$Res> {
  _$DiseaseResponseDTOCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? createdAt = null,
    Object? code = null,
    Object? name = null,
    Object? definition = null,
    Object? diagnosisTechnique = null,
    Object? treatment = null,
    Object? advice = null,
    Object? symptomGroupList = null,
    Object? diseaseType = null,
  }) {
    return _then(_value.copyWith(
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      code: null == code
          ? _value.code
          : code // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      definition: null == definition
          ? _value.definition
          : definition // ignore: cast_nullable_to_non_nullable
              as String,
      diagnosisTechnique: null == diagnosisTechnique
          ? _value.diagnosisTechnique
          : diagnosisTechnique // ignore: cast_nullable_to_non_nullable
              as String,
      treatment: null == treatment
          ? _value.treatment
          : treatment // ignore: cast_nullable_to_non_nullable
              as String,
      advice: null == advice
          ? _value.advice
          : advice // ignore: cast_nullable_to_non_nullable
              as String,
      symptomGroupList: null == symptomGroupList
          ? _value.symptomGroupList
          : symptomGroupList // ignore: cast_nullable_to_non_nullable
              as List<SymptomGroup>,
      diseaseType: null == diseaseType
          ? _value.diseaseType
          : diseaseType // ignore: cast_nullable_to_non_nullable
              as DiseaseType,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_DiseaseResponseDTOCopyWith<$Res>
    implements $DiseaseResponseDTOCopyWith<$Res> {
  factory _$$_DiseaseResponseDTOCopyWith(_$_DiseaseResponseDTO value,
          $Res Function(_$_DiseaseResponseDTO) then) =
      __$$_DiseaseResponseDTOCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@DateTimeConverter() DateTime createdAt,
      @JsonKey(name: '_id') String code,
      String name,
      String definition,
      String diagnosisTechnique,
      String treatment,
      @JsonKey(name: 'detailAdvice') String advice,
      List<SymptomGroup> symptomGroupList,
      DiseaseType diseaseType});
}

/// @nodoc
class __$$_DiseaseResponseDTOCopyWithImpl<$Res>
    extends _$DiseaseResponseDTOCopyWithImpl<$Res, _$_DiseaseResponseDTO>
    implements _$$_DiseaseResponseDTOCopyWith<$Res> {
  __$$_DiseaseResponseDTOCopyWithImpl(
      _$_DiseaseResponseDTO _value, $Res Function(_$_DiseaseResponseDTO) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? createdAt = null,
    Object? code = null,
    Object? name = null,
    Object? definition = null,
    Object? diagnosisTechnique = null,
    Object? treatment = null,
    Object? advice = null,
    Object? symptomGroupList = null,
    Object? diseaseType = null,
  }) {
    return _then(_$_DiseaseResponseDTO(
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      code: null == code
          ? _value.code
          : code // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      definition: null == definition
          ? _value.definition
          : definition // ignore: cast_nullable_to_non_nullable
              as String,
      diagnosisTechnique: null == diagnosisTechnique
          ? _value.diagnosisTechnique
          : diagnosisTechnique // ignore: cast_nullable_to_non_nullable
              as String,
      treatment: null == treatment
          ? _value.treatment
          : treatment // ignore: cast_nullable_to_non_nullable
              as String,
      advice: null == advice
          ? _value.advice
          : advice // ignore: cast_nullable_to_non_nullable
              as String,
      symptomGroupList: null == symptomGroupList
          ? _value._symptomGroupList
          : symptomGroupList // ignore: cast_nullable_to_non_nullable
              as List<SymptomGroup>,
      diseaseType: null == diseaseType
          ? _value.diseaseType
          : diseaseType // ignore: cast_nullable_to_non_nullable
              as DiseaseType,
    ));
  }
}

/// @nodoc

@JsonSerializable(explicitToJson: true)
class _$_DiseaseResponseDTO implements _DiseaseResponseDTO {
  _$_DiseaseResponseDTO(
      {@DateTimeConverter() required this.createdAt,
      @JsonKey(name: '_id') required this.code,
      required this.name,
      this.definition = '',
      this.diagnosisTechnique = '',
      this.treatment = '',
      @JsonKey(name: 'detailAdvice') this.advice = '',
      final List<SymptomGroup> symptomGroupList = const [],
      this.diseaseType = DiseaseType.undefined})
      : _symptomGroupList = symptomGroupList;

  factory _$_DiseaseResponseDTO.fromJson(Map<String, dynamic> json) =>
      _$$_DiseaseResponseDTOFromJson(json);

  @override
  @DateTimeConverter()
  final DateTime createdAt;
  @override
  @JsonKey(name: '_id')
  final String code;
// @JsonKey(name: '_id') required String diseaseId,
  @override
  final String name;
  @override
  @JsonKey()
  final String definition;
  @override
  @JsonKey()
  final String diagnosisTechnique;
  @override
  @JsonKey()
  final String treatment;
  @override
  @JsonKey(name: 'detailAdvice')
  final String advice;
  final List<SymptomGroup> _symptomGroupList;
  @override
  @JsonKey()
  List<SymptomGroup> get symptomGroupList {
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_symptomGroupList);
  }

  @override
  @JsonKey()
  final DiseaseType diseaseType;

  @override
  String toString() {
    return 'DiseaseResponseDTO(createdAt: $createdAt, code: $code, name: $name, definition: $definition, diagnosisTechnique: $diagnosisTechnique, treatment: $treatment, advice: $advice, symptomGroupList: $symptomGroupList, diseaseType: $diseaseType)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_DiseaseResponseDTO &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.code, code) || other.code == code) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.definition, definition) ||
                other.definition == definition) &&
            (identical(other.diagnosisTechnique, diagnosisTechnique) ||
                other.diagnosisTechnique == diagnosisTechnique) &&
            (identical(other.treatment, treatment) ||
                other.treatment == treatment) &&
            (identical(other.advice, advice) || other.advice == advice) &&
            const DeepCollectionEquality()
                .equals(other._symptomGroupList, _symptomGroupList) &&
            (identical(other.diseaseType, diseaseType) ||
                other.diseaseType == diseaseType));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      createdAt,
      code,
      name,
      definition,
      diagnosisTechnique,
      treatment,
      advice,
      const DeepCollectionEquality().hash(_symptomGroupList),
      diseaseType);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_DiseaseResponseDTOCopyWith<_$_DiseaseResponseDTO> get copyWith =>
      __$$_DiseaseResponseDTOCopyWithImpl<_$_DiseaseResponseDTO>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_DiseaseResponseDTOToJson(
      this,
    );
  }
}

abstract class _DiseaseResponseDTO implements DiseaseResponseDTO {
  factory _DiseaseResponseDTO(
      {@DateTimeConverter() required final DateTime createdAt,
      @JsonKey(name: '_id') required final String code,
      required final String name,
      final String definition,
      final String diagnosisTechnique,
      final String treatment,
      @JsonKey(name: 'detailAdvice') final String advice,
      final List<SymptomGroup> symptomGroupList,
      final DiseaseType diseaseType}) = _$_DiseaseResponseDTO;

  factory _DiseaseResponseDTO.fromJson(Map<String, dynamic> json) =
      _$_DiseaseResponseDTO.fromJson;

  @override
  @DateTimeConverter()
  DateTime get createdAt;
  @override
  @JsonKey(name: '_id')
  String get code;
  @override // @JsonKey(name: '_id') required String diseaseId,
  String get name;
  @override
  String get definition;
  @override
  String get diagnosisTechnique;
  @override
  String get treatment;
  @override
  @JsonKey(name: 'detailAdvice')
  String get advice;
  @override
  List<SymptomGroup> get symptomGroupList;
  @override
  DiseaseType get diseaseType;
  @override
  @JsonKey(ignore: true)
  _$$_DiseaseResponseDTOCopyWith<_$_DiseaseResponseDTO> get copyWith =>
      throw _privateConstructorUsedError;
}
