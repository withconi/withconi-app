// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'disease_history.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

DiseaseHistory _$DiseaseHistoryFromJson(Map<String, dynamic> json) {
  return _DiseaseHistory.fromJson(json);
}

/// @nodoc
mixin _$DiseaseHistory {
  DiseaseType get diseaseType => throw _privateConstructorUsedError;
  int get totalTypeHistory => throw _privateConstructorUsedError;
  List<DiseaseHistoryItem> get diseaseTypeDetailList =>
      throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $DiseaseHistoryCopyWith<DiseaseHistory> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DiseaseHistoryCopyWith<$Res> {
  factory $DiseaseHistoryCopyWith(
          DiseaseHistory value, $Res Function(DiseaseHistory) then) =
      _$DiseaseHistoryCopyWithImpl<$Res>;
  $Res call(
      {DiseaseType diseaseType,
      int totalTypeHistory,
      List<DiseaseHistoryItem> diseaseTypeDetailList});
}

/// @nodoc
class _$DiseaseHistoryCopyWithImpl<$Res>
    implements $DiseaseHistoryCopyWith<$Res> {
  _$DiseaseHistoryCopyWithImpl(this._value, this._then);

  final DiseaseHistory _value;
  // ignore: unused_field
  final $Res Function(DiseaseHistory) _then;

  @override
  $Res call({
    Object? diseaseType = freezed,
    Object? totalTypeHistory = freezed,
    Object? diseaseTypeDetailList = freezed,
  }) {
    return _then(_value.copyWith(
      diseaseType: diseaseType == freezed
          ? _value.diseaseType
          : diseaseType // ignore: cast_nullable_to_non_nullable
              as DiseaseType,
      totalTypeHistory: totalTypeHistory == freezed
          ? _value.totalTypeHistory
          : totalTypeHistory // ignore: cast_nullable_to_non_nullable
              as int,
      diseaseTypeDetailList: diseaseTypeDetailList == freezed
          ? _value.diseaseTypeDetailList
          : diseaseTypeDetailList // ignore: cast_nullable_to_non_nullable
              as List<DiseaseHistoryItem>,
    ));
  }
}

/// @nodoc
abstract class _$$_DiseaseHistoryCopyWith<$Res>
    implements $DiseaseHistoryCopyWith<$Res> {
  factory _$$_DiseaseHistoryCopyWith(
          _$_DiseaseHistory value, $Res Function(_$_DiseaseHistory) then) =
      __$$_DiseaseHistoryCopyWithImpl<$Res>;
  @override
  $Res call(
      {DiseaseType diseaseType,
      int totalTypeHistory,
      List<DiseaseHistoryItem> diseaseTypeDetailList});
}

/// @nodoc
class __$$_DiseaseHistoryCopyWithImpl<$Res>
    extends _$DiseaseHistoryCopyWithImpl<$Res>
    implements _$$_DiseaseHistoryCopyWith<$Res> {
  __$$_DiseaseHistoryCopyWithImpl(
      _$_DiseaseHistory _value, $Res Function(_$_DiseaseHistory) _then)
      : super(_value, (v) => _then(v as _$_DiseaseHistory));

  @override
  _$_DiseaseHistory get _value => super._value as _$_DiseaseHistory;

  @override
  $Res call({
    Object? diseaseType = freezed,
    Object? totalTypeHistory = freezed,
    Object? diseaseTypeDetailList = freezed,
  }) {
    return _then(_$_DiseaseHistory(
      diseaseType: diseaseType == freezed
          ? _value.diseaseType
          : diseaseType // ignore: cast_nullable_to_non_nullable
              as DiseaseType,
      totalTypeHistory: totalTypeHistory == freezed
          ? _value.totalTypeHistory
          : totalTypeHistory // ignore: cast_nullable_to_non_nullable
              as int,
      diseaseTypeDetailList: diseaseTypeDetailList == freezed
          ? _value._diseaseTypeDetailList
          : diseaseTypeDetailList // ignore: cast_nullable_to_non_nullable
              as List<DiseaseHistoryItem>,
    ));
  }
}

/// @nodoc

@JsonSerializable(explicitToJson: true)
class _$_DiseaseHistory implements _DiseaseHistory {
  _$_DiseaseHistory(
      {required this.diseaseType,
      required this.totalTypeHistory,
      required final List<DiseaseHistoryItem> diseaseTypeDetailList})
      : _diseaseTypeDetailList = diseaseTypeDetailList;

  factory _$_DiseaseHistory.fromJson(Map<String, dynamic> json) =>
      _$$_DiseaseHistoryFromJson(json);

  @override
  final DiseaseType diseaseType;
  @override
  final int totalTypeHistory;
  final List<DiseaseHistoryItem> _diseaseTypeDetailList;
  @override
  List<DiseaseHistoryItem> get diseaseTypeDetailList {
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_diseaseTypeDetailList);
  }

  @override
  String toString() {
    return 'DiseaseHistory(diseaseType: $diseaseType, totalTypeHistory: $totalTypeHistory, diseaseTypeDetailList: $diseaseTypeDetailList)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_DiseaseHistory &&
            const DeepCollectionEquality()
                .equals(other.diseaseType, diseaseType) &&
            const DeepCollectionEquality()
                .equals(other.totalTypeHistory, totalTypeHistory) &&
            const DeepCollectionEquality()
                .equals(other._diseaseTypeDetailList, _diseaseTypeDetailList));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(diseaseType),
      const DeepCollectionEquality().hash(totalTypeHistory),
      const DeepCollectionEquality().hash(_diseaseTypeDetailList));

  @JsonKey(ignore: true)
  @override
  _$$_DiseaseHistoryCopyWith<_$_DiseaseHistory> get copyWith =>
      __$$_DiseaseHistoryCopyWithImpl<_$_DiseaseHistory>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_DiseaseHistoryToJson(
      this,
    );
  }
}

abstract class _DiseaseHistory implements DiseaseHistory {
  factory _DiseaseHistory(
          {required final DiseaseType diseaseType,
          required final int totalTypeHistory,
          required final List<DiseaseHistoryItem> diseaseTypeDetailList}) =
      _$_DiseaseHistory;

  factory _DiseaseHistory.fromJson(Map<String, dynamic> json) =
      _$_DiseaseHistory.fromJson;

  @override
  DiseaseType get diseaseType;
  @override
  int get totalTypeHistory;
  @override
  List<DiseaseHistoryItem> get diseaseTypeDetailList;
  @override
  @JsonKey(ignore: true)
  _$$_DiseaseHistoryCopyWith<_$_DiseaseHistory> get copyWith =>
      throw _privateConstructorUsedError;
}
