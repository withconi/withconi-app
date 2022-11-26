// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'review_history_response_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

ReviewHistoryResponseDTO _$ReviewHistoryResponseDTOFromJson(
    Map<String, dynamic> json) {
  return _ReviewHistoryGroupResponseDTO.fromJson(json);
}

/// @nodoc
mixin _$ReviewHistoryResponseDTO {
  @JsonKey(name: 'totalReviews')
  int get totalReviewCount => throw _privateConstructorUsedError;
  Map<ReviewRate, ReviewItemResponseDTO> get reviewHistoryMap =>
      throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ReviewHistoryResponseDTOCopyWith<ReviewHistoryResponseDTO> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ReviewHistoryResponseDTOCopyWith<$Res> {
  factory $ReviewHistoryResponseDTOCopyWith(ReviewHistoryResponseDTO value,
          $Res Function(ReviewHistoryResponseDTO) then) =
      _$ReviewHistoryResponseDTOCopyWithImpl<$Res, ReviewHistoryResponseDTO>;
  @useResult
  $Res call(
      {@JsonKey(name: 'totalReviews') int totalReviewCount,
      Map<ReviewRate, ReviewItemResponseDTO> reviewHistoryMap});
}

/// @nodoc
class _$ReviewHistoryResponseDTOCopyWithImpl<$Res,
        $Val extends ReviewHistoryResponseDTO>
    implements $ReviewHistoryResponseDTOCopyWith<$Res> {
  _$ReviewHistoryResponseDTOCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? totalReviewCount = null,
    Object? reviewHistoryMap = null,
  }) {
    return _then(_value.copyWith(
      totalReviewCount: null == totalReviewCount
          ? _value.totalReviewCount
          : totalReviewCount // ignore: cast_nullable_to_non_nullable
              as int,
      reviewHistoryMap: null == reviewHistoryMap
          ? _value.reviewHistoryMap
          : reviewHistoryMap // ignore: cast_nullable_to_non_nullable
              as Map<ReviewRate, ReviewItemResponseDTO>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_ReviewHistoryGroupResponseDTOCopyWith<$Res>
    implements $ReviewHistoryResponseDTOCopyWith<$Res> {
  factory _$$_ReviewHistoryGroupResponseDTOCopyWith(
          _$_ReviewHistoryGroupResponseDTO value,
          $Res Function(_$_ReviewHistoryGroupResponseDTO) then) =
      __$$_ReviewHistoryGroupResponseDTOCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'totalReviews') int totalReviewCount,
      Map<ReviewRate, ReviewItemResponseDTO> reviewHistoryMap});
}

/// @nodoc
class __$$_ReviewHistoryGroupResponseDTOCopyWithImpl<$Res>
    extends _$ReviewHistoryResponseDTOCopyWithImpl<$Res,
        _$_ReviewHistoryGroupResponseDTO>
    implements _$$_ReviewHistoryGroupResponseDTOCopyWith<$Res> {
  __$$_ReviewHistoryGroupResponseDTOCopyWithImpl(
      _$_ReviewHistoryGroupResponseDTO _value,
      $Res Function(_$_ReviewHistoryGroupResponseDTO) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? totalReviewCount = null,
    Object? reviewHistoryMap = null,
  }) {
    return _then(_$_ReviewHistoryGroupResponseDTO(
      totalReviewCount: null == totalReviewCount
          ? _value.totalReviewCount
          : totalReviewCount // ignore: cast_nullable_to_non_nullable
              as int,
      reviewHistoryMap: null == reviewHistoryMap
          ? _value._reviewHistoryMap
          : reviewHistoryMap // ignore: cast_nullable_to_non_nullable
              as Map<ReviewRate, ReviewItemResponseDTO>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_ReviewHistoryGroupResponseDTO
    with DiagnosticableTreeMixin
    implements _ReviewHistoryGroupResponseDTO {
  _$_ReviewHistoryGroupResponseDTO(
      {@JsonKey(name: 'totalReviews') required this.totalReviewCount,
      required final Map<ReviewRate, ReviewItemResponseDTO> reviewHistoryMap})
      : _reviewHistoryMap = reviewHistoryMap;

  factory _$_ReviewHistoryGroupResponseDTO.fromJson(
          Map<String, dynamic> json) =>
      _$$_ReviewHistoryGroupResponseDTOFromJson(json);

  @override
  @JsonKey(name: 'totalReviews')
  final int totalReviewCount;
  final Map<ReviewRate, ReviewItemResponseDTO> _reviewHistoryMap;
  @override
  Map<ReviewRate, ReviewItemResponseDTO> get reviewHistoryMap {
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_reviewHistoryMap);
  }

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'ReviewHistoryResponseDTO(totalReviewCount: $totalReviewCount, reviewHistoryMap: $reviewHistoryMap)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'ReviewHistoryResponseDTO'))
      ..add(DiagnosticsProperty('totalReviewCount', totalReviewCount))
      ..add(DiagnosticsProperty('reviewHistoryMap', reviewHistoryMap));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_ReviewHistoryGroupResponseDTO &&
            (identical(other.totalReviewCount, totalReviewCount) ||
                other.totalReviewCount == totalReviewCount) &&
            const DeepCollectionEquality()
                .equals(other._reviewHistoryMap, _reviewHistoryMap));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, totalReviewCount,
      const DeepCollectionEquality().hash(_reviewHistoryMap));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_ReviewHistoryGroupResponseDTOCopyWith<_$_ReviewHistoryGroupResponseDTO>
      get copyWith => __$$_ReviewHistoryGroupResponseDTOCopyWithImpl<
          _$_ReviewHistoryGroupResponseDTO>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_ReviewHistoryGroupResponseDTOToJson(
      this,
    );
  }
}

abstract class _ReviewHistoryGroupResponseDTO
    implements ReviewHistoryResponseDTO {
  factory _ReviewHistoryGroupResponseDTO(
      {@JsonKey(name: 'totalReviews') required final int totalReviewCount,
      required final Map<ReviewRate, ReviewItemResponseDTO>
          reviewHistoryMap}) = _$_ReviewHistoryGroupResponseDTO;

  factory _ReviewHistoryGroupResponseDTO.fromJson(Map<String, dynamic> json) =
      _$_ReviewHistoryGroupResponseDTO.fromJson;

  @override
  @JsonKey(name: 'totalReviews')
  int get totalReviewCount;
  @override
  Map<ReviewRate, ReviewItemResponseDTO> get reviewHistoryMap;
  @override
  @JsonKey(ignore: true)
  _$$_ReviewHistoryGroupResponseDTOCopyWith<_$_ReviewHistoryGroupResponseDTO>
      get copyWith => throw _privateConstructorUsedError;
}
