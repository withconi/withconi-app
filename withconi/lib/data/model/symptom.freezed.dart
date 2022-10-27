// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'symptom.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

SymptomGroup _$SymptomGroupFromJson(Map<String, dynamic> json) {
  return _SymptomGroup.fromJson(json);
}

/// @nodoc
mixin _$SymptomGroup {
  Symptom get symptomType => throw _privateConstructorUsedError;
  List<String> get symptomList => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $SymptomGroupCopyWith<SymptomGroup> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SymptomGroupCopyWith<$Res> {
  factory $SymptomGroupCopyWith(
          SymptomGroup value, $Res Function(SymptomGroup) then) =
      _$SymptomGroupCopyWithImpl<$Res>;
  $Res call({Symptom symptomType, List<String> symptomList});
}

/// @nodoc
class _$SymptomGroupCopyWithImpl<$Res> implements $SymptomGroupCopyWith<$Res> {
  _$SymptomGroupCopyWithImpl(this._value, this._then);

  final SymptomGroup _value;
  // ignore: unused_field
  final $Res Function(SymptomGroup) _then;

  @override
  $Res call({
    Object? symptomType = freezed,
    Object? symptomList = freezed,
  }) {
    return _then(_value.copyWith(
      symptomType: symptomType == freezed
          ? _value.symptomType
          : symptomType // ignore: cast_nullable_to_non_nullable
              as Symptom,
      symptomList: symptomList == freezed
          ? _value.symptomList
          : symptomList // ignore: cast_nullable_to_non_nullable
              as List<String>,
    ));
  }
}

/// @nodoc
abstract class _$$_SymptomGroupCopyWith<$Res>
    implements $SymptomGroupCopyWith<$Res> {
  factory _$$_SymptomGroupCopyWith(
          _$_SymptomGroup value, $Res Function(_$_SymptomGroup) then) =
      __$$_SymptomGroupCopyWithImpl<$Res>;
  @override
  $Res call({Symptom symptomType, List<String> symptomList});
}

/// @nodoc
class __$$_SymptomGroupCopyWithImpl<$Res>
    extends _$SymptomGroupCopyWithImpl<$Res>
    implements _$$_SymptomGroupCopyWith<$Res> {
  __$$_SymptomGroupCopyWithImpl(
      _$_SymptomGroup _value, $Res Function(_$_SymptomGroup) _then)
      : super(_value, (v) => _then(v as _$_SymptomGroup));

  @override
  _$_SymptomGroup get _value => super._value as _$_SymptomGroup;

  @override
  $Res call({
    Object? symptomType = freezed,
    Object? symptomList = freezed,
  }) {
    return _then(_$_SymptomGroup(
      symptomType: symptomType == freezed
          ? _value.symptomType
          : symptomType // ignore: cast_nullable_to_non_nullable
              as Symptom,
      symptomList: symptomList == freezed
          ? _value._symptomList
          : symptomList // ignore: cast_nullable_to_non_nullable
              as List<String>,
    ));
  }
}

/// @nodoc

@JsonSerializable(explicitToJson: true)
class _$_SymptomGroup implements _SymptomGroup {
  _$_SymptomGroup(
      {required this.symptomType, required final List<String> symptomList})
      : _symptomList = symptomList;

  factory _$_SymptomGroup.fromJson(Map<String, dynamic> json) =>
      _$$_SymptomGroupFromJson(json);

  @override
  final Symptom symptomType;
  final List<String> _symptomList;
  @override
  List<String> get symptomList {
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_symptomList);
  }

  @override
  String toString() {
    return 'SymptomGroup(symptomType: $symptomType, symptomList: $symptomList)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_SymptomGroup &&
            const DeepCollectionEquality()
                .equals(other.symptomType, symptomType) &&
            const DeepCollectionEquality()
                .equals(other._symptomList, _symptomList));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(symptomType),
      const DeepCollectionEquality().hash(_symptomList));

  @JsonKey(ignore: true)
  @override
  _$$_SymptomGroupCopyWith<_$_SymptomGroup> get copyWith =>
      __$$_SymptomGroupCopyWithImpl<_$_SymptomGroup>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_SymptomGroupToJson(
      this,
    );
  }
}

abstract class _SymptomGroup implements SymptomGroup {
  factory _SymptomGroup(
      {required final Symptom symptomType,
      required final List<String> symptomList}) = _$_SymptomGroup;

  factory _SymptomGroup.fromJson(Map<String, dynamic> json) =
      _$_SymptomGroup.fromJson;

  @override
  Symptom get symptomType;
  @override
  List<String> get symptomList;
  @override
  @JsonKey(ignore: true)
  _$$_SymptomGroupCopyWith<_$_SymptomGroup> get copyWith =>
      throw _privateConstructorUsedError;
}
