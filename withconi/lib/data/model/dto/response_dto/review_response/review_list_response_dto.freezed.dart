// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'review_list_response_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

ReviewListResponseDTO _$ReviewListResponseDTOFromJson(
    Map<String, dynamic> json) {
  return _ReviewListResponseDTO.fromJson(json);
}

/// @nodoc
mixin _$ReviewListResponseDTO {
  List<ReviewDetailResponseDTO> get list => throw _privateConstructorUsedError;
  int get totalDocuments => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ReviewListResponseDTOCopyWith<ReviewListResponseDTO> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ReviewListResponseDTOCopyWith<$Res> {
  factory $ReviewListResponseDTOCopyWith(ReviewListResponseDTO value,
          $Res Function(ReviewListResponseDTO) then) =
      _$ReviewListResponseDTOCopyWithImpl<$Res, ReviewListResponseDTO>;
  @useResult
  $Res call({List<ReviewDetailResponseDTO> list, int totalDocuments});
}

/// @nodoc
class _$ReviewListResponseDTOCopyWithImpl<$Res,
        $Val extends ReviewListResponseDTO>
    implements $ReviewListResponseDTOCopyWith<$Res> {
  _$ReviewListResponseDTOCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? list = null,
    Object? totalDocuments = null,
  }) {
    return _then(_value.copyWith(
      list: null == list
          ? _value.list
          : list // ignore: cast_nullable_to_non_nullable
              as List<ReviewDetailResponseDTO>,
      totalDocuments: null == totalDocuments
          ? _value.totalDocuments
          : totalDocuments // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_ReviewListResponseDTOCopyWith<$Res>
    implements $ReviewListResponseDTOCopyWith<$Res> {
  factory _$$_ReviewListResponseDTOCopyWith(_$_ReviewListResponseDTO value,
          $Res Function(_$_ReviewListResponseDTO) then) =
      __$$_ReviewListResponseDTOCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({List<ReviewDetailResponseDTO> list, int totalDocuments});
}

/// @nodoc
class __$$_ReviewListResponseDTOCopyWithImpl<$Res>
    extends _$ReviewListResponseDTOCopyWithImpl<$Res, _$_ReviewListResponseDTO>
    implements _$$_ReviewListResponseDTOCopyWith<$Res> {
  __$$_ReviewListResponseDTOCopyWithImpl(_$_ReviewListResponseDTO _value,
      $Res Function(_$_ReviewListResponseDTO) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? list = null,
    Object? totalDocuments = null,
  }) {
    return _then(_$_ReviewListResponseDTO(
      list: null == list
          ? _value._list
          : list // ignore: cast_nullable_to_non_nullable
              as List<ReviewDetailResponseDTO>,
      totalDocuments: null == totalDocuments
          ? _value.totalDocuments
          : totalDocuments // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

@JsonSerializable(explicitToJson: true)
class _$_ReviewListResponseDTO implements _ReviewListResponseDTO {
  _$_ReviewListResponseDTO(
      {required final List<ReviewDetailResponseDTO> list,
      required this.totalDocuments})
      : _list = list;

  factory _$_ReviewListResponseDTO.fromJson(Map<String, dynamic> json) =>
      _$$_ReviewListResponseDTOFromJson(json);

  final List<ReviewDetailResponseDTO> _list;
  @override
  List<ReviewDetailResponseDTO> get list {
    if (_list is EqualUnmodifiableListView) return _list;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_list);
  }

  @override
  final int totalDocuments;

  @override
  String toString() {
    return 'ReviewListResponseDTO(list: $list, totalDocuments: $totalDocuments)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_ReviewListResponseDTO &&
            const DeepCollectionEquality().equals(other._list, _list) &&
            (identical(other.totalDocuments, totalDocuments) ||
                other.totalDocuments == totalDocuments));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(_list), totalDocuments);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_ReviewListResponseDTOCopyWith<_$_ReviewListResponseDTO> get copyWith =>
      __$$_ReviewListResponseDTOCopyWithImpl<_$_ReviewListResponseDTO>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_ReviewListResponseDTOToJson(
      this,
    );
  }
}

abstract class _ReviewListResponseDTO implements ReviewListResponseDTO {
  factory _ReviewListResponseDTO(
      {required final List<ReviewDetailResponseDTO> list,
      required final int totalDocuments}) = _$_ReviewListResponseDTO;

  factory _ReviewListResponseDTO.fromJson(Map<String, dynamic> json) =
      _$_ReviewListResponseDTO.fromJson;

  @override
  List<ReviewDetailResponseDTO> get list;
  @override
  int get totalDocuments;
  @override
  @JsonKey(ignore: true)
  _$$_ReviewListResponseDTOCopyWith<_$_ReviewListResponseDTO> get copyWith =>
      throw _privateConstructorUsedError;
}
