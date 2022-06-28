// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'disease.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

Disease _$DiseaseFromJson(Map<String, dynamic> json) {
  return _Disease.fromJson(json);
}

/// @nodoc
mixin _$Disease {
  @DateTimeConverter()
  DateTime get createdAt => throw _privateConstructorUsedError;
  String get code => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  List<String> get symptoms => throw _privateConstructorUsedError;
  String get description => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $DiseaseCopyWith<Disease> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DiseaseCopyWith<$Res> {
  factory $DiseaseCopyWith(Disease value, $Res Function(Disease) then) =
      _$DiseaseCopyWithImpl<$Res>;
  $Res call(
      {@DateTimeConverter() DateTime createdAt,
      String code,
      String name,
      List<String> symptoms,
      String description});
}

/// @nodoc
class _$DiseaseCopyWithImpl<$Res> implements $DiseaseCopyWith<$Res> {
  _$DiseaseCopyWithImpl(this._value, this._then);

  final Disease _value;
  // ignore: unused_field
  final $Res Function(Disease) _then;

  @override
  $Res call({
    Object? createdAt = freezed,
    Object? code = freezed,
    Object? name = freezed,
    Object? symptoms = freezed,
    Object? description = freezed,
  }) {
    return _then(_value.copyWith(
      createdAt: createdAt == freezed
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      code: code == freezed
          ? _value.code
          : code // ignore: cast_nullable_to_non_nullable
              as String,
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      symptoms: symptoms == freezed
          ? _value.symptoms
          : symptoms // ignore: cast_nullable_to_non_nullable
              as List<String>,
      description: description == freezed
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
abstract class _$$_DiseaseCopyWith<$Res> implements $DiseaseCopyWith<$Res> {
  factory _$$_DiseaseCopyWith(
          _$_Disease value, $Res Function(_$_Disease) then) =
      __$$_DiseaseCopyWithImpl<$Res>;
  @override
  $Res call(
      {@DateTimeConverter() DateTime createdAt,
      String code,
      String name,
      List<String> symptoms,
      String description});
}

/// @nodoc
class __$$_DiseaseCopyWithImpl<$Res> extends _$DiseaseCopyWithImpl<$Res>
    implements _$$_DiseaseCopyWith<$Res> {
  __$$_DiseaseCopyWithImpl(_$_Disease _value, $Res Function(_$_Disease) _then)
      : super(_value, (v) => _then(v as _$_Disease));

  @override
  _$_Disease get _value => super._value as _$_Disease;

  @override
  $Res call({
    Object? createdAt = freezed,
    Object? code = freezed,
    Object? name = freezed,
    Object? symptoms = freezed,
    Object? description = freezed,
  }) {
    return _then(_$_Disease(
      createdAt: createdAt == freezed
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      code: code == freezed
          ? _value.code
          : code // ignore: cast_nullable_to_non_nullable
              as String,
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      symptoms: symptoms == freezed
          ? _value._symptoms
          : symptoms // ignore: cast_nullable_to_non_nullable
              as List<String>,
      description: description == freezed
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

@JsonSerializable(explicitToJson: true)
class _$_Disease implements _Disease {
  _$_Disease(
      {@DateTimeConverter() required this.createdAt,
      required this.code,
      required this.name,
      required final List<String> symptoms,
      required this.description})
      : _symptoms = symptoms;

  factory _$_Disease.fromJson(Map<String, dynamic> json) =>
      _$$_DiseaseFromJson(json);

  @override
  @DateTimeConverter()
  final DateTime createdAt;
  @override
  final String code;
  @override
  final String name;
  final List<String> _symptoms;
  @override
  List<String> get symptoms {
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_symptoms);
  }

  @override
  final String description;

  @override
  String toString() {
    return 'Disease(createdAt: $createdAt, code: $code, name: $name, symptoms: $symptoms, description: $description)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Disease &&
            const DeepCollectionEquality().equals(other.createdAt, createdAt) &&
            const DeepCollectionEquality().equals(other.code, code) &&
            const DeepCollectionEquality().equals(other.name, name) &&
            const DeepCollectionEquality().equals(other._symptoms, _symptoms) &&
            const DeepCollectionEquality()
                .equals(other.description, description));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(createdAt),
      const DeepCollectionEquality().hash(code),
      const DeepCollectionEquality().hash(name),
      const DeepCollectionEquality().hash(_symptoms),
      const DeepCollectionEquality().hash(description));

  @JsonKey(ignore: true)
  @override
  _$$_DiseaseCopyWith<_$_Disease> get copyWith =>
      __$$_DiseaseCopyWithImpl<_$_Disease>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_DiseaseToJson(this);
  }
}

abstract class _Disease implements Disease {
  factory _Disease(
      {@DateTimeConverter() required final DateTime createdAt,
      required final String code,
      required final String name,
      required final List<String> symptoms,
      required final String description}) = _$_Disease;

  factory _Disease.fromJson(Map<String, dynamic> json) = _$_Disease.fromJson;

  @override
  @DateTimeConverter()
  DateTime get createdAt => throw _privateConstructorUsedError;
  @override
  String get code => throw _privateConstructorUsedError;
  @override
  String get name => throw _privateConstructorUsedError;
  @override
  List<String> get symptoms => throw _privateConstructorUsedError;
  @override
  String get description => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$$_DiseaseCopyWith<_$_Disease> get copyWith =>
      throw _privateConstructorUsedError;
}
