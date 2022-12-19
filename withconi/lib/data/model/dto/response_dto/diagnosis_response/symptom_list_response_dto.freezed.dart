// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'symptom_list_response_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

SymptomListResponseDTO _$SymptomListResponseDTOFromJson(
    Map<String, dynamic> json) {
  return _SymptomListResponseDTO.fromJson(json);
}

/// @nodoc
mixin _$SymptomListResponseDTO {
  @JsonKey(name: 'list')
  List<SymptomGroup> get symptomGroupList => throw _privateConstructorUsedError;
  int get totalDocuments => throw _privateConstructorUsedError;
  @JsonKey(name: 'categoryList')
  List<Symptom> get symptomList => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $SymptomListResponseDTOCopyWith<SymptomListResponseDTO> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SymptomListResponseDTOCopyWith<$Res> {
  factory $SymptomListResponseDTOCopyWith(SymptomListResponseDTO value,
          $Res Function(SymptomListResponseDTO) then) =
      _$SymptomListResponseDTOCopyWithImpl<$Res, SymptomListResponseDTO>;
  @useResult
  $Res call(
      {@JsonKey(name: 'list') List<SymptomGroup> symptomGroupList,
      int totalDocuments,
      @JsonKey(name: 'categoryList') List<Symptom> symptomList});
}

/// @nodoc
class _$SymptomListResponseDTOCopyWithImpl<$Res,
        $Val extends SymptomListResponseDTO>
    implements $SymptomListResponseDTOCopyWith<$Res> {
  _$SymptomListResponseDTOCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? symptomGroupList = null,
    Object? totalDocuments = null,
    Object? symptomList = null,
  }) {
    return _then(_value.copyWith(
      symptomGroupList: null == symptomGroupList
          ? _value.symptomGroupList
          : symptomGroupList // ignore: cast_nullable_to_non_nullable
              as List<SymptomGroup>,
      totalDocuments: null == totalDocuments
          ? _value.totalDocuments
          : totalDocuments // ignore: cast_nullable_to_non_nullable
              as int,
      symptomList: null == symptomList
          ? _value.symptomList
          : symptomList // ignore: cast_nullable_to_non_nullable
              as List<Symptom>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_SymptomListResponseDTOCopyWith<$Res>
    implements $SymptomListResponseDTOCopyWith<$Res> {
  factory _$$_SymptomListResponseDTOCopyWith(_$_SymptomListResponseDTO value,
          $Res Function(_$_SymptomListResponseDTO) then) =
      __$$_SymptomListResponseDTOCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'list') List<SymptomGroup> symptomGroupList,
      int totalDocuments,
      @JsonKey(name: 'categoryList') List<Symptom> symptomList});
}

/// @nodoc
class __$$_SymptomListResponseDTOCopyWithImpl<$Res>
    extends _$SymptomListResponseDTOCopyWithImpl<$Res,
        _$_SymptomListResponseDTO>
    implements _$$_SymptomListResponseDTOCopyWith<$Res> {
  __$$_SymptomListResponseDTOCopyWithImpl(_$_SymptomListResponseDTO _value,
      $Res Function(_$_SymptomListResponseDTO) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? symptomGroupList = null,
    Object? totalDocuments = null,
    Object? symptomList = null,
  }) {
    return _then(_$_SymptomListResponseDTO(
      symptomGroupList: null == symptomGroupList
          ? _value._symptomGroupList
          : symptomGroupList // ignore: cast_nullable_to_non_nullable
              as List<SymptomGroup>,
      totalDocuments: null == totalDocuments
          ? _value.totalDocuments
          : totalDocuments // ignore: cast_nullable_to_non_nullable
              as int,
      symptomList: null == symptomList
          ? _value._symptomList
          : symptomList // ignore: cast_nullable_to_non_nullable
              as List<Symptom>,
    ));
  }
}

/// @nodoc

@JsonSerializable(explicitToJson: true)
class _$_SymptomListResponseDTO implements _SymptomListResponseDTO {
  _$_SymptomListResponseDTO(
      {@JsonKey(name: 'list')
          required final List<SymptomGroup> symptomGroupList,
      required this.totalDocuments,
      @JsonKey(name: 'categoryList')
          required final List<Symptom> symptomList})
      : _symptomGroupList = symptomGroupList,
        _symptomList = symptomList;

  factory _$_SymptomListResponseDTO.fromJson(Map<String, dynamic> json) =>
      _$$_SymptomListResponseDTOFromJson(json);

  final List<SymptomGroup> _symptomGroupList;
  @override
  @JsonKey(name: 'list')
  List<SymptomGroup> get symptomGroupList {
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_symptomGroupList);
  }

  @override
  final int totalDocuments;
  final List<Symptom> _symptomList;
  @override
  @JsonKey(name: 'categoryList')
  List<Symptom> get symptomList {
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_symptomList);
  }

  @override
  String toString() {
    return 'SymptomListResponseDTO(symptomGroupList: $symptomGroupList, totalDocuments: $totalDocuments, symptomList: $symptomList)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_SymptomListResponseDTO &&
            const DeepCollectionEquality()
                .equals(other._symptomGroupList, _symptomGroupList) &&
            (identical(other.totalDocuments, totalDocuments) ||
                other.totalDocuments == totalDocuments) &&
            const DeepCollectionEquality()
                .equals(other._symptomList, _symptomList));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_symptomGroupList),
      totalDocuments,
      const DeepCollectionEquality().hash(_symptomList));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_SymptomListResponseDTOCopyWith<_$_SymptomListResponseDTO> get copyWith =>
      __$$_SymptomListResponseDTOCopyWithImpl<_$_SymptomListResponseDTO>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_SymptomListResponseDTOToJson(
      this,
    );
  }
}

abstract class _SymptomListResponseDTO implements SymptomListResponseDTO {
  factory _SymptomListResponseDTO(
          {@JsonKey(name: 'list')
              required final List<SymptomGroup> symptomGroupList,
          required final int totalDocuments,
          @JsonKey(name: 'categoryList')
              required final List<Symptom> symptomList}) =
      _$_SymptomListResponseDTO;

  factory _SymptomListResponseDTO.fromJson(Map<String, dynamic> json) =
      _$_SymptomListResponseDTO.fromJson;

  @override
  @JsonKey(name: 'list')
  List<SymptomGroup> get symptomGroupList;
  @override
  int get totalDocuments;
  @override
  @JsonKey(name: 'categoryList')
  List<Symptom> get symptomList;
  @override
  @JsonKey(ignore: true)
  _$$_SymptomListResponseDTOCopyWith<_$_SymptomListResponseDTO> get copyWith =>
      throw _privateConstructorUsedError;
}
