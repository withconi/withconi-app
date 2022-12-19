// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'symptom_response_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

SymptomResponseDTO _$SymptomResponseDTOFromJson(Map<String, dynamic> json) {
  return _SymptomResponseDTO.fromJson(json);
}

/// @nodoc
mixin _$SymptomResponseDTO {
  Symptom get categoryName => throw _privateConstructorUsedError;
  @JsonKey(name: 'list')
  List<String> get symptomList => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $SymptomResponseDTOCopyWith<SymptomResponseDTO> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SymptomResponseDTOCopyWith<$Res> {
  factory $SymptomResponseDTOCopyWith(
          SymptomResponseDTO value, $Res Function(SymptomResponseDTO) then) =
      _$SymptomResponseDTOCopyWithImpl<$Res, SymptomResponseDTO>;
  @useResult
  $Res call(
      {Symptom categoryName, @JsonKey(name: 'list') List<String> symptomList});
}

/// @nodoc
class _$SymptomResponseDTOCopyWithImpl<$Res, $Val extends SymptomResponseDTO>
    implements $SymptomResponseDTOCopyWith<$Res> {
  _$SymptomResponseDTOCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? categoryName = null,
    Object? symptomList = null,
  }) {
    return _then(_value.copyWith(
      categoryName: null == categoryName
          ? _value.categoryName
          : categoryName // ignore: cast_nullable_to_non_nullable
              as Symptom,
      symptomList: null == symptomList
          ? _value.symptomList
          : symptomList // ignore: cast_nullable_to_non_nullable
              as List<String>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_SymptomResponseDTOCopyWith<$Res>
    implements $SymptomResponseDTOCopyWith<$Res> {
  factory _$$_SymptomResponseDTOCopyWith(_$_SymptomResponseDTO value,
          $Res Function(_$_SymptomResponseDTO) then) =
      __$$_SymptomResponseDTOCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {Symptom categoryName, @JsonKey(name: 'list') List<String> symptomList});
}

/// @nodoc
class __$$_SymptomResponseDTOCopyWithImpl<$Res>
    extends _$SymptomResponseDTOCopyWithImpl<$Res, _$_SymptomResponseDTO>
    implements _$$_SymptomResponseDTOCopyWith<$Res> {
  __$$_SymptomResponseDTOCopyWithImpl(
      _$_SymptomResponseDTO _value, $Res Function(_$_SymptomResponseDTO) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? categoryName = null,
    Object? symptomList = null,
  }) {
    return _then(_$_SymptomResponseDTO(
      categoryName: null == categoryName
          ? _value.categoryName
          : categoryName // ignore: cast_nullable_to_non_nullable
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
class _$_SymptomResponseDTO implements _SymptomResponseDTO {
  _$_SymptomResponseDTO(
      {required this.categoryName,
      @JsonKey(name: 'list') required final List<String> symptomList})
      : _symptomList = symptomList;

  factory _$_SymptomResponseDTO.fromJson(Map<String, dynamic> json) =>
      _$$_SymptomResponseDTOFromJson(json);

  @override
  final Symptom categoryName;
  final List<String> _symptomList;
  @override
  @JsonKey(name: 'list')
  List<String> get symptomList {
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_symptomList);
  }

  @override
  String toString() {
    return 'SymptomResponseDTO(categoryName: $categoryName, symptomList: $symptomList)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_SymptomResponseDTO &&
            (identical(other.categoryName, categoryName) ||
                other.categoryName == categoryName) &&
            const DeepCollectionEquality()
                .equals(other._symptomList, _symptomList));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, categoryName,
      const DeepCollectionEquality().hash(_symptomList));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_SymptomResponseDTOCopyWith<_$_SymptomResponseDTO> get copyWith =>
      __$$_SymptomResponseDTOCopyWithImpl<_$_SymptomResponseDTO>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_SymptomResponseDTOToJson(
      this,
    );
  }
}

abstract class _SymptomResponseDTO implements SymptomResponseDTO {
  factory _SymptomResponseDTO(
          {required final Symptom categoryName,
          @JsonKey(name: 'list') required final List<String> symptomList}) =
      _$_SymptomResponseDTO;

  factory _SymptomResponseDTO.fromJson(Map<String, dynamic> json) =
      _$_SymptomResponseDTO.fromJson;

  @override
  Symptom get categoryName;
  @override
  @JsonKey(name: 'list')
  List<String> get symptomList;
  @override
  @JsonKey(ignore: true)
  _$$_SymptomResponseDTOCopyWith<_$_SymptomResponseDTO> get copyWith =>
      throw _privateConstructorUsedError;
}
