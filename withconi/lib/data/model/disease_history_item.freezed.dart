// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'disease_history_item.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

DiseaseHistoryItem _$DiseaseHistoryItemFromJson(Map<String, dynamic> json) {
  return _DiseaseHistoryItem.fromJson(json);
}

/// @nodoc
mixin _$DiseaseHistoryItem {
  String get diseaseName => throw _privateConstructorUsedError;
  int get diseasePercent => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $DiseaseHistoryItemCopyWith<DiseaseHistoryItem> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DiseaseHistoryItemCopyWith<$Res> {
  factory $DiseaseHistoryItemCopyWith(
          DiseaseHistoryItem value, $Res Function(DiseaseHistoryItem) then) =
      _$DiseaseHistoryItemCopyWithImpl<$Res>;
  $Res call({String diseaseName, int diseasePercent});
}

/// @nodoc
class _$DiseaseHistoryItemCopyWithImpl<$Res>
    implements $DiseaseHistoryItemCopyWith<$Res> {
  _$DiseaseHistoryItemCopyWithImpl(this._value, this._then);

  final DiseaseHistoryItem _value;
  // ignore: unused_field
  final $Res Function(DiseaseHistoryItem) _then;

  @override
  $Res call({
    Object? diseaseName = freezed,
    Object? diseasePercent = freezed,
  }) {
    return _then(_value.copyWith(
      diseaseName: diseaseName == freezed
          ? _value.diseaseName
          : diseaseName // ignore: cast_nullable_to_non_nullable
              as String,
      diseasePercent: diseasePercent == freezed
          ? _value.diseasePercent
          : diseasePercent // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
abstract class _$$_DiseaseHistoryItemCopyWith<$Res>
    implements $DiseaseHistoryItemCopyWith<$Res> {
  factory _$$_DiseaseHistoryItemCopyWith(_$_DiseaseHistoryItem value,
          $Res Function(_$_DiseaseHistoryItem) then) =
      __$$_DiseaseHistoryItemCopyWithImpl<$Res>;
  @override
  $Res call({String diseaseName, int diseasePercent});
}

/// @nodoc
class __$$_DiseaseHistoryItemCopyWithImpl<$Res>
    extends _$DiseaseHistoryItemCopyWithImpl<$Res>
    implements _$$_DiseaseHistoryItemCopyWith<$Res> {
  __$$_DiseaseHistoryItemCopyWithImpl(
      _$_DiseaseHistoryItem _value, $Res Function(_$_DiseaseHistoryItem) _then)
      : super(_value, (v) => _then(v as _$_DiseaseHistoryItem));

  @override
  _$_DiseaseHistoryItem get _value => super._value as _$_DiseaseHistoryItem;

  @override
  $Res call({
    Object? diseaseName = freezed,
    Object? diseasePercent = freezed,
  }) {
    return _then(_$_DiseaseHistoryItem(
      diseaseName: diseaseName == freezed
          ? _value.diseaseName
          : diseaseName // ignore: cast_nullable_to_non_nullable
              as String,
      diseasePercent: diseasePercent == freezed
          ? _value.diseasePercent
          : diseasePercent // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

@JsonSerializable(explicitToJson: true)
class _$_DiseaseHistoryItem implements _DiseaseHistoryItem {
  _$_DiseaseHistoryItem(
      {required this.diseaseName, required this.diseasePercent});

  factory _$_DiseaseHistoryItem.fromJson(Map<String, dynamic> json) =>
      _$$_DiseaseHistoryItemFromJson(json);

  @override
  final String diseaseName;
  @override
  final int diseasePercent;

  @override
  String toString() {
    return 'DiseaseHistoryItem(diseaseName: $diseaseName, diseasePercent: $diseasePercent)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_DiseaseHistoryItem &&
            const DeepCollectionEquality()
                .equals(other.diseaseName, diseaseName) &&
            const DeepCollectionEquality()
                .equals(other.diseasePercent, diseasePercent));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(diseaseName),
      const DeepCollectionEquality().hash(diseasePercent));

  @JsonKey(ignore: true)
  @override
  _$$_DiseaseHistoryItemCopyWith<_$_DiseaseHistoryItem> get copyWith =>
      __$$_DiseaseHistoryItemCopyWithImpl<_$_DiseaseHistoryItem>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_DiseaseHistoryItemToJson(
      this,
    );
  }
}

abstract class _DiseaseHistoryItem implements DiseaseHistoryItem {
  factory _DiseaseHistoryItem(
      {required final String diseaseName,
      required final int diseasePercent}) = _$_DiseaseHistoryItem;

  factory _DiseaseHistoryItem.fromJson(Map<String, dynamic> json) =
      _$_DiseaseHistoryItem.fromJson;

  @override
  String get diseaseName;
  @override
  int get diseasePercent;
  @override
  @JsonKey(ignore: true)
  _$$_DiseaseHistoryItemCopyWith<_$_DiseaseHistoryItem> get copyWith =>
      throw _privateConstructorUsedError;
}
