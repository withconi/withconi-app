// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'review_history_item_response_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

ReviewItemResponseDTO _$ReviewItemResponseDTOFromJson(
    Map<String, dynamic> json) {
  return _ReviewItemResponseDTO.fromJson(json);
}

/// @nodoc
mixin _$ReviewItemResponseDTO {
  @JsonKey(name: 'totalReviews')
  int get totalReviewRateCount => throw _privateConstructorUsedError;
  Map<ReviewItem, int> get reviewHistoryMap =>
      throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ReviewItemResponseDTOCopyWith<ReviewItemResponseDTO> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ReviewItemResponseDTOCopyWith<$Res> {
  factory $ReviewItemResponseDTOCopyWith(ReviewItemResponseDTO value,
          $Res Function(ReviewItemResponseDTO) then) =
      _$ReviewItemResponseDTOCopyWithImpl<$Res, ReviewItemResponseDTO>;
  @useResult
  $Res call(
      {@JsonKey(name: 'totalReviews') int totalReviewRateCount,
      Map<ReviewItem, int> reviewHistoryMap});
}

/// @nodoc
class _$ReviewItemResponseDTOCopyWithImpl<$Res,
        $Val extends ReviewItemResponseDTO>
    implements $ReviewItemResponseDTOCopyWith<$Res> {
  _$ReviewItemResponseDTOCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? totalReviewRateCount = null,
    Object? reviewHistoryMap = null,
  }) {
    return _then(_value.copyWith(
      totalReviewRateCount: null == totalReviewRateCount
          ? _value.totalReviewRateCount
          : totalReviewRateCount // ignore: cast_nullable_to_non_nullable
              as int,
      reviewHistoryMap: null == reviewHistoryMap
          ? _value.reviewHistoryMap
          : reviewHistoryMap // ignore: cast_nullable_to_non_nullable
              as Map<ReviewItem, int>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_ReviewItemResponseDTOCopyWith<$Res>
    implements $ReviewItemResponseDTOCopyWith<$Res> {
  factory _$$_ReviewItemResponseDTOCopyWith(_$_ReviewItemResponseDTO value,
          $Res Function(_$_ReviewItemResponseDTO) then) =
      __$$_ReviewItemResponseDTOCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'totalReviews') int totalReviewRateCount,
      Map<ReviewItem, int> reviewHistoryMap});
}

/// @nodoc
class __$$_ReviewItemResponseDTOCopyWithImpl<$Res>
    extends _$ReviewItemResponseDTOCopyWithImpl<$Res, _$_ReviewItemResponseDTO>
    implements _$$_ReviewItemResponseDTOCopyWith<$Res> {
  __$$_ReviewItemResponseDTOCopyWithImpl(_$_ReviewItemResponseDTO _value,
      $Res Function(_$_ReviewItemResponseDTO) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? totalReviewRateCount = null,
    Object? reviewHistoryMap = null,
  }) {
    return _then(_$_ReviewItemResponseDTO(
      totalReviewRateCount: null == totalReviewRateCount
          ? _value.totalReviewRateCount
          : totalReviewRateCount // ignore: cast_nullable_to_non_nullable
              as int,
      reviewHistoryMap: null == reviewHistoryMap
          ? _value._reviewHistoryMap
          : reviewHistoryMap // ignore: cast_nullable_to_non_nullable
              as Map<ReviewItem, int>,
    ));
  }
}

/// @nodoc

@JsonSerializable(explicitToJson: true)
class _$_ReviewItemResponseDTO implements _ReviewItemResponseDTO {
  _$_ReviewItemResponseDTO(
      {@JsonKey(name: 'totalReviews') required this.totalReviewRateCount,
      required final Map<ReviewItem, int> reviewHistoryMap})
      : _reviewHistoryMap = reviewHistoryMap;

  factory _$_ReviewItemResponseDTO.fromJson(Map<String, dynamic> json) =>
      _$$_ReviewItemResponseDTOFromJson(json);

  @override
  @JsonKey(name: 'totalReviews')
  final int totalReviewRateCount;
  final Map<ReviewItem, int> _reviewHistoryMap;
  @override
  Map<ReviewItem, int> get reviewHistoryMap {
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_reviewHistoryMap);
  }

  @override
  String toString() {
    return 'ReviewItemResponseDTO(totalReviewRateCount: $totalReviewRateCount, reviewHistoryMap: $reviewHistoryMap)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_ReviewItemResponseDTO &&
            (identical(other.totalReviewRateCount, totalReviewRateCount) ||
                other.totalReviewRateCount == totalReviewRateCount) &&
            const DeepCollectionEquality()
                .equals(other._reviewHistoryMap, _reviewHistoryMap));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, totalReviewRateCount,
      const DeepCollectionEquality().hash(_reviewHistoryMap));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_ReviewItemResponseDTOCopyWith<_$_ReviewItemResponseDTO> get copyWith =>
      __$$_ReviewItemResponseDTOCopyWithImpl<_$_ReviewItemResponseDTO>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_ReviewItemResponseDTOToJson(
      this,
    );
  }
}

abstract class _ReviewItemResponseDTO implements ReviewItemResponseDTO {
  factory _ReviewItemResponseDTO(
      {@JsonKey(name: 'totalReviews') required final int totalReviewRateCount,
      required final Map<ReviewItem, int>
          reviewHistoryMap}) = _$_ReviewItemResponseDTO;

  factory _ReviewItemResponseDTO.fromJson(Map<String, dynamic> json) =
      _$_ReviewItemResponseDTO.fromJson;

  @override
  @JsonKey(name: 'totalReviews')
  int get totalReviewRateCount;
  @override
  Map<ReviewItem, int> get reviewHistoryMap;
  @override
  @JsonKey(ignore: true)
  _$$_ReviewItemResponseDTOCopyWith<_$_ReviewItemResponseDTO> get copyWith =>
      throw _privateConstructorUsedError;
}
