// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'disease_common_list_response_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

DiseaseCommonListResponseDTO _$DiseaseCommonListResponseDTOFromJson(
    Map<String, dynamic> json) {
  return _DiseaseCommonListResponseDTO.fromJson(json);
}

/// @nodoc
mixin _$DiseaseCommonListResponseDTO {
  @JsonKey(name: 'cat')
  List<DiseaseResponseDTO> get catDiseaseList =>
      throw _privateConstructorUsedError;
  @JsonKey(name: 'dog')
  List<DiseaseResponseDTO> get dogDiseaseList =>
      throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $DiseaseCommonListResponseDTOCopyWith<DiseaseCommonListResponseDTO>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DiseaseCommonListResponseDTOCopyWith<$Res> {
  factory $DiseaseCommonListResponseDTOCopyWith(
          DiseaseCommonListResponseDTO value,
          $Res Function(DiseaseCommonListResponseDTO) then) =
      _$DiseaseCommonListResponseDTOCopyWithImpl<$Res,
          DiseaseCommonListResponseDTO>;
  @useResult
  $Res call(
      {@JsonKey(name: 'cat') List<DiseaseResponseDTO> catDiseaseList,
      @JsonKey(name: 'dog') List<DiseaseResponseDTO> dogDiseaseList});
}

/// @nodoc
class _$DiseaseCommonListResponseDTOCopyWithImpl<$Res,
        $Val extends DiseaseCommonListResponseDTO>
    implements $DiseaseCommonListResponseDTOCopyWith<$Res> {
  _$DiseaseCommonListResponseDTOCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? catDiseaseList = null,
    Object? dogDiseaseList = null,
  }) {
    return _then(_value.copyWith(
      catDiseaseList: null == catDiseaseList
          ? _value.catDiseaseList
          : catDiseaseList // ignore: cast_nullable_to_non_nullable
              as List<DiseaseResponseDTO>,
      dogDiseaseList: null == dogDiseaseList
          ? _value.dogDiseaseList
          : dogDiseaseList // ignore: cast_nullable_to_non_nullable
              as List<DiseaseResponseDTO>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_DiseaseCommonListResponseDTOCopyWith<$Res>
    implements $DiseaseCommonListResponseDTOCopyWith<$Res> {
  factory _$$_DiseaseCommonListResponseDTOCopyWith(
          _$_DiseaseCommonListResponseDTO value,
          $Res Function(_$_DiseaseCommonListResponseDTO) then) =
      __$$_DiseaseCommonListResponseDTOCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'cat') List<DiseaseResponseDTO> catDiseaseList,
      @JsonKey(name: 'dog') List<DiseaseResponseDTO> dogDiseaseList});
}

/// @nodoc
class __$$_DiseaseCommonListResponseDTOCopyWithImpl<$Res>
    extends _$DiseaseCommonListResponseDTOCopyWithImpl<$Res,
        _$_DiseaseCommonListResponseDTO>
    implements _$$_DiseaseCommonListResponseDTOCopyWith<$Res> {
  __$$_DiseaseCommonListResponseDTOCopyWithImpl(
      _$_DiseaseCommonListResponseDTO _value,
      $Res Function(_$_DiseaseCommonListResponseDTO) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? catDiseaseList = null,
    Object? dogDiseaseList = null,
  }) {
    return _then(_$_DiseaseCommonListResponseDTO(
      catDiseaseList: null == catDiseaseList
          ? _value._catDiseaseList
          : catDiseaseList // ignore: cast_nullable_to_non_nullable
              as List<DiseaseResponseDTO>,
      dogDiseaseList: null == dogDiseaseList
          ? _value._dogDiseaseList
          : dogDiseaseList // ignore: cast_nullable_to_non_nullable
              as List<DiseaseResponseDTO>,
    ));
  }
}

/// @nodoc

@JsonSerializable(explicitToJson: true)
class _$_DiseaseCommonListResponseDTO implements _DiseaseCommonListResponseDTO {
  _$_DiseaseCommonListResponseDTO(
      {@JsonKey(name: 'cat')
          final List<DiseaseResponseDTO> catDiseaseList = const [],
      @JsonKey(name: 'dog')
          final List<DiseaseResponseDTO> dogDiseaseList = const []})
      : _catDiseaseList = catDiseaseList,
        _dogDiseaseList = dogDiseaseList;

  factory _$_DiseaseCommonListResponseDTO.fromJson(Map<String, dynamic> json) =>
      _$$_DiseaseCommonListResponseDTOFromJson(json);

  final List<DiseaseResponseDTO> _catDiseaseList;
  @override
  @JsonKey(name: 'cat')
  List<DiseaseResponseDTO> get catDiseaseList {
    if (_catDiseaseList is EqualUnmodifiableListView) return _catDiseaseList;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_catDiseaseList);
  }

  final List<DiseaseResponseDTO> _dogDiseaseList;
  @override
  @JsonKey(name: 'dog')
  List<DiseaseResponseDTO> get dogDiseaseList {
    if (_dogDiseaseList is EqualUnmodifiableListView) return _dogDiseaseList;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_dogDiseaseList);
  }

  @override
  String toString() {
    return 'DiseaseCommonListResponseDTO(catDiseaseList: $catDiseaseList, dogDiseaseList: $dogDiseaseList)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_DiseaseCommonListResponseDTO &&
            const DeepCollectionEquality()
                .equals(other._catDiseaseList, _catDiseaseList) &&
            const DeepCollectionEquality()
                .equals(other._dogDiseaseList, _dogDiseaseList));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_catDiseaseList),
      const DeepCollectionEquality().hash(_dogDiseaseList));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_DiseaseCommonListResponseDTOCopyWith<_$_DiseaseCommonListResponseDTO>
      get copyWith => __$$_DiseaseCommonListResponseDTOCopyWithImpl<
          _$_DiseaseCommonListResponseDTO>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_DiseaseCommonListResponseDTOToJson(
      this,
    );
  }
}

abstract class _DiseaseCommonListResponseDTO
    implements DiseaseCommonListResponseDTO {
  factory _DiseaseCommonListResponseDTO(
          {@JsonKey(name: 'cat')
              final List<DiseaseResponseDTO> catDiseaseList,
          @JsonKey(name: 'dog')
              final List<DiseaseResponseDTO> dogDiseaseList}) =
      _$_DiseaseCommonListResponseDTO;

  factory _DiseaseCommonListResponseDTO.fromJson(Map<String, dynamic> json) =
      _$_DiseaseCommonListResponseDTO.fromJson;

  @override
  @JsonKey(name: 'cat')
  List<DiseaseResponseDTO> get catDiseaseList;
  @override
  @JsonKey(name: 'dog')
  List<DiseaseResponseDTO> get dogDiseaseList;
  @override
  @JsonKey(ignore: true)
  _$$_DiseaseCommonListResponseDTOCopyWith<_$_DiseaseCommonListResponseDTO>
      get copyWith => throw _privateConstructorUsedError;
}
