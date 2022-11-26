// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'disease_ui_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$DiseaseUIModel {
  String get code => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  String get definition => throw _privateConstructorUsedError;
  String get diagnosisTechnique => throw _privateConstructorUsedError;
  String get treatment => throw _privateConstructorUsedError;
  String get advice => throw _privateConstructorUsedError;
  List<SymptomGroup> get symptomGroup => throw _privateConstructorUsedError;
  DiseaseType get diseaseType => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $DiseaseUIModelCopyWith<DiseaseUIModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DiseaseUIModelCopyWith<$Res> {
  factory $DiseaseUIModelCopyWith(
          DiseaseUIModel value, $Res Function(DiseaseUIModel) then) =
      _$DiseaseUIModelCopyWithImpl<$Res, DiseaseUIModel>;
  @useResult
  $Res call(
      {String code,
      String name,
      String definition,
      String diagnosisTechnique,
      String treatment,
      String advice,
      List<SymptomGroup> symptomGroup,
      DiseaseType diseaseType});
}

/// @nodoc
class _$DiseaseUIModelCopyWithImpl<$Res, $Val extends DiseaseUIModel>
    implements $DiseaseUIModelCopyWith<$Res> {
  _$DiseaseUIModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? code = null,
    Object? name = null,
    Object? definition = null,
    Object? diagnosisTechnique = null,
    Object? treatment = null,
    Object? advice = null,
    Object? symptomGroup = null,
    Object? diseaseType = null,
  }) {
    return _then(_value.copyWith(
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
      symptomGroup: null == symptomGroup
          ? _value.symptomGroup
          : symptomGroup // ignore: cast_nullable_to_non_nullable
              as List<SymptomGroup>,
      diseaseType: null == diseaseType
          ? _value.diseaseType
          : diseaseType // ignore: cast_nullable_to_non_nullable
              as DiseaseType,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_DiseaseUIModelCopyWith<$Res>
    implements $DiseaseUIModelCopyWith<$Res> {
  factory _$$_DiseaseUIModelCopyWith(
          _$_DiseaseUIModel value, $Res Function(_$_DiseaseUIModel) then) =
      __$$_DiseaseUIModelCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String code,
      String name,
      String definition,
      String diagnosisTechnique,
      String treatment,
      String advice,
      List<SymptomGroup> symptomGroup,
      DiseaseType diseaseType});
}

/// @nodoc
class __$$_DiseaseUIModelCopyWithImpl<$Res>
    extends _$DiseaseUIModelCopyWithImpl<$Res, _$_DiseaseUIModel>
    implements _$$_DiseaseUIModelCopyWith<$Res> {
  __$$_DiseaseUIModelCopyWithImpl(
      _$_DiseaseUIModel _value, $Res Function(_$_DiseaseUIModel) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? code = null,
    Object? name = null,
    Object? definition = null,
    Object? diagnosisTechnique = null,
    Object? treatment = null,
    Object? advice = null,
    Object? symptomGroup = null,
    Object? diseaseType = null,
  }) {
    return _then(_$_DiseaseUIModel(
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
      symptomGroup: null == symptomGroup
          ? _value._symptomGroup
          : symptomGroup // ignore: cast_nullable_to_non_nullable
              as List<SymptomGroup>,
      diseaseType: null == diseaseType
          ? _value.diseaseType
          : diseaseType // ignore: cast_nullable_to_non_nullable
              as DiseaseType,
    ));
  }
}

/// @nodoc

class _$_DiseaseUIModel extends _DiseaseUIModel {
  _$_DiseaseUIModel(
      {required this.code,
      required this.name,
      required this.definition,
      required this.diagnosisTechnique,
      required this.treatment,
      required this.advice,
      required final List<SymptomGroup> symptomGroup,
      required this.diseaseType})
      : _symptomGroup = symptomGroup,
        super._();

  @override
  final String code;
  @override
  final String name;
  @override
  final String definition;
  @override
  final String diagnosisTechnique;
  @override
  final String treatment;
  @override
  final String advice;
  final List<SymptomGroup> _symptomGroup;
  @override
  List<SymptomGroup> get symptomGroup {
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_symptomGroup);
  }

  @override
  final DiseaseType diseaseType;

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_DiseaseUIModelCopyWith<_$_DiseaseUIModel> get copyWith =>
      __$$_DiseaseUIModelCopyWithImpl<_$_DiseaseUIModel>(this, _$identity);
}

abstract class _DiseaseUIModel extends DiseaseUIModel {
  factory _DiseaseUIModel(
      {required final String code,
      required final String name,
      required final String definition,
      required final String diagnosisTechnique,
      required final String treatment,
      required final String advice,
      required final List<SymptomGroup> symptomGroup,
      required final DiseaseType diseaseType}) = _$_DiseaseUIModel;
  _DiseaseUIModel._() : super._();

  @override
  String get code;
  @override
  String get name;
  @override
  String get definition;
  @override
  String get diagnosisTechnique;
  @override
  String get treatment;
  @override
  String get advice;
  @override
  List<SymptomGroup> get symptomGroup;
  @override
  DiseaseType get diseaseType;
  @override
  @JsonKey(ignore: true)
  _$$_DiseaseUIModelCopyWith<_$_DiseaseUIModel> get copyWith =>
      throw _privateConstructorUsedError;
}
