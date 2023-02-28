// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'comment_list_response_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

CommentListResponseDTO _$CommentListResponseDTOFromJson(
    Map<String, dynamic> json) {
  return _CommentListResponseDTO.fromJson(json);
}

/// @nodoc
mixin _$CommentListResponseDTO {
  List<CommentResponseDTO> get list => throw _privateConstructorUsedError;
  int get totalDocuments => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $CommentListResponseDTOCopyWith<CommentListResponseDTO> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CommentListResponseDTOCopyWith<$Res> {
  factory $CommentListResponseDTOCopyWith(CommentListResponseDTO value,
          $Res Function(CommentListResponseDTO) then) =
      _$CommentListResponseDTOCopyWithImpl<$Res, CommentListResponseDTO>;
  @useResult
  $Res call({List<CommentResponseDTO> list, int totalDocuments});
}

/// @nodoc
class _$CommentListResponseDTOCopyWithImpl<$Res,
        $Val extends CommentListResponseDTO>
    implements $CommentListResponseDTOCopyWith<$Res> {
  _$CommentListResponseDTOCopyWithImpl(this._value, this._then);

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
              as List<CommentResponseDTO>,
      totalDocuments: null == totalDocuments
          ? _value.totalDocuments
          : totalDocuments // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_CommentListResponseDTOCopyWith<$Res>
    implements $CommentListResponseDTOCopyWith<$Res> {
  factory _$$_CommentListResponseDTOCopyWith(_$_CommentListResponseDTO value,
          $Res Function(_$_CommentListResponseDTO) then) =
      __$$_CommentListResponseDTOCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({List<CommentResponseDTO> list, int totalDocuments});
}

/// @nodoc
class __$$_CommentListResponseDTOCopyWithImpl<$Res>
    extends _$CommentListResponseDTOCopyWithImpl<$Res,
        _$_CommentListResponseDTO>
    implements _$$_CommentListResponseDTOCopyWith<$Res> {
  __$$_CommentListResponseDTOCopyWithImpl(_$_CommentListResponseDTO _value,
      $Res Function(_$_CommentListResponseDTO) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? list = null,
    Object? totalDocuments = null,
  }) {
    return _then(_$_CommentListResponseDTO(
      list: null == list
          ? _value._list
          : list // ignore: cast_nullable_to_non_nullable
              as List<CommentResponseDTO>,
      totalDocuments: null == totalDocuments
          ? _value.totalDocuments
          : totalDocuments // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

@JsonSerializable(explicitToJson: true)
class _$_CommentListResponseDTO implements _CommentListResponseDTO {
  _$_CommentListResponseDTO(
      {required final List<CommentResponseDTO> list,
      required this.totalDocuments})
      : _list = list;

  factory _$_CommentListResponseDTO.fromJson(Map<String, dynamic> json) =>
      _$$_CommentListResponseDTOFromJson(json);

  final List<CommentResponseDTO> _list;
  @override
  List<CommentResponseDTO> get list {
    if (_list is EqualUnmodifiableListView) return _list;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_list);
  }

  @override
  final int totalDocuments;

  @override
  String toString() {
    return 'CommentListResponseDTO(list: $list, totalDocuments: $totalDocuments)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_CommentListResponseDTO &&
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
  _$$_CommentListResponseDTOCopyWith<_$_CommentListResponseDTO> get copyWith =>
      __$$_CommentListResponseDTOCopyWithImpl<_$_CommentListResponseDTO>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_CommentListResponseDTOToJson(
      this,
    );
  }
}

abstract class _CommentListResponseDTO implements CommentListResponseDTO {
  factory _CommentListResponseDTO(
      {required final List<CommentResponseDTO> list,
      required final int totalDocuments}) = _$_CommentListResponseDTO;

  factory _CommentListResponseDTO.fromJson(Map<String, dynamic> json) =
      _$_CommentListResponseDTO.fromJson;

  @override
  List<CommentResponseDTO> get list;
  @override
  int get totalDocuments;
  @override
  @JsonKey(ignore: true)
  _$$_CommentListResponseDTOCopyWith<_$_CommentListResponseDTO> get copyWith =>
      throw _privateConstructorUsedError;
}
