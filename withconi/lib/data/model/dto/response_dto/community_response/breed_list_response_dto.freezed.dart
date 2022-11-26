// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'breed_list_response_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

BreedListResponseDTO _$BreedListResponseDTOFromJson(Map<String, dynamic> json) {
  return _BreedListResponseDTO.fromJson(json);
}

/// @nodoc
mixin _$BreedListResponseDTO {
  List<BreedResponseDTO> get list => throw _privateConstructorUsedError;
  Species get species => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $BreedListResponseDTOCopyWith<BreedListResponseDTO> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $BreedListResponseDTOCopyWith<$Res> {
  factory $BreedListResponseDTOCopyWith(BreedListResponseDTO value,
          $Res Function(BreedListResponseDTO) then) =
      _$BreedListResponseDTOCopyWithImpl<$Res, BreedListResponseDTO>;
  @useResult
  $Res call({List<BreedResponseDTO> list, Species species});
}

/// @nodoc
class _$BreedListResponseDTOCopyWithImpl<$Res,
        $Val extends BreedListResponseDTO>
    implements $BreedListResponseDTOCopyWith<$Res> {
  _$BreedListResponseDTOCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? list = null,
    Object? species = null,
  }) {
    return _then(_value.copyWith(
      list: null == list
          ? _value.list
          : list // ignore: cast_nullable_to_non_nullable
              as List<BreedResponseDTO>,
      species: null == species
          ? _value.species
          : species // ignore: cast_nullable_to_non_nullable
              as Species,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_BreedListResponseDTOCopyWith<$Res>
    implements $BreedListResponseDTOCopyWith<$Res> {
  factory _$$_BreedListResponseDTOCopyWith(_$_BreedListResponseDTO value,
          $Res Function(_$_BreedListResponseDTO) then) =
      __$$_BreedListResponseDTOCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({List<BreedResponseDTO> list, Species species});
}

/// @nodoc
class __$$_BreedListResponseDTOCopyWithImpl<$Res>
    extends _$BreedListResponseDTOCopyWithImpl<$Res, _$_BreedListResponseDTO>
    implements _$$_BreedListResponseDTOCopyWith<$Res> {
  __$$_BreedListResponseDTOCopyWithImpl(_$_BreedListResponseDTO _value,
      $Res Function(_$_BreedListResponseDTO) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? list = null,
    Object? species = null,
  }) {
    return _then(_$_BreedListResponseDTO(
      list: null == list
          ? _value._list
          : list // ignore: cast_nullable_to_non_nullable
              as List<BreedResponseDTO>,
      species: null == species
          ? _value.species
          : species // ignore: cast_nullable_to_non_nullable
              as Species,
    ));
  }
}

/// @nodoc

@JsonSerializable(explicitToJson: true)
class _$_BreedListResponseDTO implements _BreedListResponseDTO {
  _$_BreedListResponseDTO(
      {required final List<BreedResponseDTO> list, required this.species})
      : _list = list;

  factory _$_BreedListResponseDTO.fromJson(Map<String, dynamic> json) =>
      _$$_BreedListResponseDTOFromJson(json);

  final List<BreedResponseDTO> _list;
  @override
  List<BreedResponseDTO> get list {
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_list);
  }

  @override
  final Species species;

  @override
  String toString() {
    return 'BreedListResponseDTO(list: $list, species: $species)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_BreedListResponseDTO &&
            const DeepCollectionEquality().equals(other._list, _list) &&
            (identical(other.species, species) || other.species == species));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(_list), species);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_BreedListResponseDTOCopyWith<_$_BreedListResponseDTO> get copyWith =>
      __$$_BreedListResponseDTOCopyWithImpl<_$_BreedListResponseDTO>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_BreedListResponseDTOToJson(
      this,
    );
  }
}

abstract class _BreedListResponseDTO implements BreedListResponseDTO {
  factory _BreedListResponseDTO(
      {required final List<BreedResponseDTO> list,
      required final Species species}) = _$_BreedListResponseDTO;

  factory _BreedListResponseDTO.fromJson(Map<String, dynamic> json) =
      _$_BreedListResponseDTO.fromJson;

  @override
  List<BreedResponseDTO> get list;
  @override
  Species get species;
  @override
  @JsonKey(ignore: true)
  _$$_BreedListResponseDTOCopyWith<_$_BreedListResponseDTO> get copyWith =>
      throw _privateConstructorUsedError;
}
