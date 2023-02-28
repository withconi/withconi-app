// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

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
  @JsonKey(name: 'categoryName')
  Symptom get symptomType => throw _privateConstructorUsedError;
  @JsonKey(name: 'list')
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
      _$SymptomGroupCopyWithImpl<$Res, SymptomGroup>;
  @useResult
  $Res call(
      {@JsonKey(name: 'categoryName') Symptom symptomType,
      @JsonKey(name: 'list') List<String> symptomList});
}

/// @nodoc
class _$SymptomGroupCopyWithImpl<$Res, $Val extends SymptomGroup>
    implements $SymptomGroupCopyWith<$Res> {
  _$SymptomGroupCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? symptomType = null,
    Object? symptomList = null,
  }) {
    return _then(_value.copyWith(
      symptomType: null == symptomType
          ? _value.symptomType
          : symptomType // ignore: cast_nullable_to_non_nullable
              as Symptom,
      symptomList: null == symptomList
          ? _value.symptomList
          : symptomList // ignore: cast_nullable_to_non_nullable
              as List<String>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_SymptomGroupCopyWith<$Res>
    implements $SymptomGroupCopyWith<$Res> {
  factory _$$_SymptomGroupCopyWith(
          _$_SymptomGroup value, $Res Function(_$_SymptomGroup) then) =
      __$$_SymptomGroupCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'categoryName') Symptom symptomType,
      @JsonKey(name: 'list') List<String> symptomList});
}

/// @nodoc
class __$$_SymptomGroupCopyWithImpl<$Res>
    extends _$SymptomGroupCopyWithImpl<$Res, _$_SymptomGroup>
    implements _$$_SymptomGroupCopyWith<$Res> {
  __$$_SymptomGroupCopyWithImpl(
      _$_SymptomGroup _value, $Res Function(_$_SymptomGroup) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? symptomType = null,
    Object? symptomList = null,
  }) {
    return _then(_$_SymptomGroup(
      symptomType: null == symptomType
          ? _value.symptomType
          : symptomType // ignore: cast_nullable_to_non_nullable
              as Symptom,
      symptomList: null == symptomList
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
      {@JsonKey(name: 'categoryName') required this.symptomType,
      @JsonKey(name: 'list') required final List<String> symptomList})
      : _symptomList = symptomList;

  factory _$_SymptomGroup.fromJson(Map<String, dynamic> json) =>
      _$$_SymptomGroupFromJson(json);

  @override
  @JsonKey(name: 'categoryName')
  final Symptom symptomType;
  final List<String> _symptomList;
  @override
  @JsonKey(name: 'list')
  List<String> get symptomList {
    if (_symptomList is EqualUnmodifiableListView) return _symptomList;
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
            (identical(other.symptomType, symptomType) ||
                other.symptomType == symptomType) &&
            const DeepCollectionEquality()
                .equals(other._symptomList, _symptomList));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, symptomType,
      const DeepCollectionEquality().hash(_symptomList));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
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
          {@JsonKey(name: 'categoryName') required final Symptom symptomType,
          @JsonKey(name: 'list') required final List<String> symptomList}) =
      _$_SymptomGroup;

  factory _SymptomGroup.fromJson(Map<String, dynamic> json) =
      _$_SymptomGroup.fromJson;

  @override
  @JsonKey(name: 'categoryName')
  Symptom get symptomType;
  @override
  @JsonKey(name: 'list')
  List<String> get symptomList;
  @override
  @JsonKey(ignore: true)
  _$$_SymptomGroupCopyWith<_$_SymptomGroup> get copyWith =>
      throw _privateConstructorUsedError;
}
