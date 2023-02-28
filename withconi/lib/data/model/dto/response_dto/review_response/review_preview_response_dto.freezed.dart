// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'review_preview_response_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

ReviewPreviewResponseDTO _$ReviewPreviewResponseDTOFromJson(
    Map<String, dynamic> json) {
  return _ReviewPreviewResponseDTO.fromJson(json);
}

/// @nodoc
mixin _$ReviewPreviewResponseDTO {
  @DateTimeConverter()
  DateTime get createdAt => throw _privateConstructorUsedError;
  @JsonKey(name: 'diseaseTypes')
  List<DiseaseType> get diseaseTypeList => throw _privateConstructorUsedError;
  @JsonKey(name: 'name')
  String get placeName => throw _privateConstructorUsedError;
  @JsonKey(name: 'status')
  ReviewRate get reviewRate => throw _privateConstructorUsedError;
  @JsonKey(name: '_id')
  String get reviewId => throw _privateConstructorUsedError;
  @JsonKey(name: 'userId')
  String get userId => throw _privateConstructorUsedError;
  @JsonKey(name: 'locId')
  String get placeId => throw _privateConstructorUsedError;
  @JsonKey(name: 'locType')
  PlaceType get placeType => throw _privateConstructorUsedError;
  @JsonKey(name: 'address')
  String get placeAddress => throw _privateConstructorUsedError;
  List<String> get reviewImageList => throw _privateConstructorUsedError;
  List<ReviewItem> get reviewItems => throw _privateConstructorUsedError;
  String get reviewDesc => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ReviewPreviewResponseDTOCopyWith<ReviewPreviewResponseDTO> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ReviewPreviewResponseDTOCopyWith<$Res> {
  factory $ReviewPreviewResponseDTOCopyWith(ReviewPreviewResponseDTO value,
          $Res Function(ReviewPreviewResponseDTO) then) =
      _$ReviewPreviewResponseDTOCopyWithImpl<$Res, ReviewPreviewResponseDTO>;
  @useResult
  $Res call(
      {@DateTimeConverter() DateTime createdAt,
      @JsonKey(name: 'diseaseTypes') List<DiseaseType> diseaseTypeList,
      @JsonKey(name: 'name') String placeName,
      @JsonKey(name: 'status') ReviewRate reviewRate,
      @JsonKey(name: '_id') String reviewId,
      @JsonKey(name: 'userId') String userId,
      @JsonKey(name: 'locId') String placeId,
      @JsonKey(name: 'locType') PlaceType placeType,
      @JsonKey(name: 'address') String placeAddress,
      List<String> reviewImageList,
      List<ReviewItem> reviewItems,
      String reviewDesc});
}

/// @nodoc
class _$ReviewPreviewResponseDTOCopyWithImpl<$Res,
        $Val extends ReviewPreviewResponseDTO>
    implements $ReviewPreviewResponseDTOCopyWith<$Res> {
  _$ReviewPreviewResponseDTOCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? createdAt = null,
    Object? diseaseTypeList = null,
    Object? placeName = null,
    Object? reviewRate = null,
    Object? reviewId = null,
    Object? userId = null,
    Object? placeId = null,
    Object? placeType = null,
    Object? placeAddress = null,
    Object? reviewImageList = null,
    Object? reviewItems = null,
    Object? reviewDesc = null,
  }) {
    return _then(_value.copyWith(
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      diseaseTypeList: null == diseaseTypeList
          ? _value.diseaseTypeList
          : diseaseTypeList // ignore: cast_nullable_to_non_nullable
              as List<DiseaseType>,
      placeName: null == placeName
          ? _value.placeName
          : placeName // ignore: cast_nullable_to_non_nullable
              as String,
      reviewRate: null == reviewRate
          ? _value.reviewRate
          : reviewRate // ignore: cast_nullable_to_non_nullable
              as ReviewRate,
      reviewId: null == reviewId
          ? _value.reviewId
          : reviewId // ignore: cast_nullable_to_non_nullable
              as String,
      userId: null == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String,
      placeId: null == placeId
          ? _value.placeId
          : placeId // ignore: cast_nullable_to_non_nullable
              as String,
      placeType: null == placeType
          ? _value.placeType
          : placeType // ignore: cast_nullable_to_non_nullable
              as PlaceType,
      placeAddress: null == placeAddress
          ? _value.placeAddress
          : placeAddress // ignore: cast_nullable_to_non_nullable
              as String,
      reviewImageList: null == reviewImageList
          ? _value.reviewImageList
          : reviewImageList // ignore: cast_nullable_to_non_nullable
              as List<String>,
      reviewItems: null == reviewItems
          ? _value.reviewItems
          : reviewItems // ignore: cast_nullable_to_non_nullable
              as List<ReviewItem>,
      reviewDesc: null == reviewDesc
          ? _value.reviewDesc
          : reviewDesc // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_ReviewPreviewResponseDTOCopyWith<$Res>
    implements $ReviewPreviewResponseDTOCopyWith<$Res> {
  factory _$$_ReviewPreviewResponseDTOCopyWith(
          _$_ReviewPreviewResponseDTO value,
          $Res Function(_$_ReviewPreviewResponseDTO) then) =
      __$$_ReviewPreviewResponseDTOCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@DateTimeConverter() DateTime createdAt,
      @JsonKey(name: 'diseaseTypes') List<DiseaseType> diseaseTypeList,
      @JsonKey(name: 'name') String placeName,
      @JsonKey(name: 'status') ReviewRate reviewRate,
      @JsonKey(name: '_id') String reviewId,
      @JsonKey(name: 'userId') String userId,
      @JsonKey(name: 'locId') String placeId,
      @JsonKey(name: 'locType') PlaceType placeType,
      @JsonKey(name: 'address') String placeAddress,
      List<String> reviewImageList,
      List<ReviewItem> reviewItems,
      String reviewDesc});
}

/// @nodoc
class __$$_ReviewPreviewResponseDTOCopyWithImpl<$Res>
    extends _$ReviewPreviewResponseDTOCopyWithImpl<$Res,
        _$_ReviewPreviewResponseDTO>
    implements _$$_ReviewPreviewResponseDTOCopyWith<$Res> {
  __$$_ReviewPreviewResponseDTOCopyWithImpl(_$_ReviewPreviewResponseDTO _value,
      $Res Function(_$_ReviewPreviewResponseDTO) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? createdAt = null,
    Object? diseaseTypeList = null,
    Object? placeName = null,
    Object? reviewRate = null,
    Object? reviewId = null,
    Object? userId = null,
    Object? placeId = null,
    Object? placeType = null,
    Object? placeAddress = null,
    Object? reviewImageList = null,
    Object? reviewItems = null,
    Object? reviewDesc = null,
  }) {
    return _then(_$_ReviewPreviewResponseDTO(
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      diseaseTypeList: null == diseaseTypeList
          ? _value._diseaseTypeList
          : diseaseTypeList // ignore: cast_nullable_to_non_nullable
              as List<DiseaseType>,
      placeName: null == placeName
          ? _value.placeName
          : placeName // ignore: cast_nullable_to_non_nullable
              as String,
      reviewRate: null == reviewRate
          ? _value.reviewRate
          : reviewRate // ignore: cast_nullable_to_non_nullable
              as ReviewRate,
      reviewId: null == reviewId
          ? _value.reviewId
          : reviewId // ignore: cast_nullable_to_non_nullable
              as String,
      userId: null == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String,
      placeId: null == placeId
          ? _value.placeId
          : placeId // ignore: cast_nullable_to_non_nullable
              as String,
      placeType: null == placeType
          ? _value.placeType
          : placeType // ignore: cast_nullable_to_non_nullable
              as PlaceType,
      placeAddress: null == placeAddress
          ? _value.placeAddress
          : placeAddress // ignore: cast_nullable_to_non_nullable
              as String,
      reviewImageList: null == reviewImageList
          ? _value._reviewImageList
          : reviewImageList // ignore: cast_nullable_to_non_nullable
              as List<String>,
      reviewItems: null == reviewItems
          ? _value._reviewItems
          : reviewItems // ignore: cast_nullable_to_non_nullable
              as List<ReviewItem>,
      reviewDesc: null == reviewDesc
          ? _value.reviewDesc
          : reviewDesc // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

@JsonSerializable(explicitToJson: true)
class _$_ReviewPreviewResponseDTO implements _ReviewPreviewResponseDTO {
  _$_ReviewPreviewResponseDTO(
      {@DateTimeConverter()
          required this.createdAt,
      @JsonKey(name: 'diseaseTypes')
          final List<DiseaseType> diseaseTypeList = const [],
      @JsonKey(name: 'name')
          this.placeName = '장소 이름 없음',
      @JsonKey(name: 'status')
          required this.reviewRate,
      @JsonKey(name: '_id')
          required this.reviewId,
      @JsonKey(name: 'userId')
          required this.userId,
      @JsonKey(name: 'locId')
          required this.placeId,
      @JsonKey(name: 'locType')
          required this.placeType,
      @JsonKey(name: 'address')
          required this.placeAddress,
      final List<String> reviewImageList = const [],
      required final List<ReviewItem> reviewItems,
      this.reviewDesc = ''})
      : _diseaseTypeList = diseaseTypeList,
        _reviewImageList = reviewImageList,
        _reviewItems = reviewItems;

  factory _$_ReviewPreviewResponseDTO.fromJson(Map<String, dynamic> json) =>
      _$$_ReviewPreviewResponseDTOFromJson(json);

  @override
  @DateTimeConverter()
  final DateTime createdAt;
  final List<DiseaseType> _diseaseTypeList;
  @override
  @JsonKey(name: 'diseaseTypes')
  List<DiseaseType> get diseaseTypeList {
    if (_diseaseTypeList is EqualUnmodifiableListView) return _diseaseTypeList;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_diseaseTypeList);
  }

  @override
  @JsonKey(name: 'name')
  final String placeName;
  @override
  @JsonKey(name: 'status')
  final ReviewRate reviewRate;
  @override
  @JsonKey(name: '_id')
  final String reviewId;
  @override
  @JsonKey(name: 'userId')
  final String userId;
  @override
  @JsonKey(name: 'locId')
  final String placeId;
  @override
  @JsonKey(name: 'locType')
  final PlaceType placeType;
  @override
  @JsonKey(name: 'address')
  final String placeAddress;
  final List<String> _reviewImageList;
  @override
  @JsonKey()
  List<String> get reviewImageList {
    if (_reviewImageList is EqualUnmodifiableListView) return _reviewImageList;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_reviewImageList);
  }

  final List<ReviewItem> _reviewItems;
  @override
  List<ReviewItem> get reviewItems {
    if (_reviewItems is EqualUnmodifiableListView) return _reviewItems;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_reviewItems);
  }

  @override
  @JsonKey()
  final String reviewDesc;

  @override
  String toString() {
    return 'ReviewPreviewResponseDTO(createdAt: $createdAt, diseaseTypeList: $diseaseTypeList, placeName: $placeName, reviewRate: $reviewRate, reviewId: $reviewId, userId: $userId, placeId: $placeId, placeType: $placeType, placeAddress: $placeAddress, reviewImageList: $reviewImageList, reviewItems: $reviewItems, reviewDesc: $reviewDesc)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_ReviewPreviewResponseDTO &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            const DeepCollectionEquality()
                .equals(other._diseaseTypeList, _diseaseTypeList) &&
            (identical(other.placeName, placeName) ||
                other.placeName == placeName) &&
            (identical(other.reviewRate, reviewRate) ||
                other.reviewRate == reviewRate) &&
            (identical(other.reviewId, reviewId) ||
                other.reviewId == reviewId) &&
            (identical(other.userId, userId) || other.userId == userId) &&
            (identical(other.placeId, placeId) || other.placeId == placeId) &&
            (identical(other.placeType, placeType) ||
                other.placeType == placeType) &&
            (identical(other.placeAddress, placeAddress) ||
                other.placeAddress == placeAddress) &&
            const DeepCollectionEquality()
                .equals(other._reviewImageList, _reviewImageList) &&
            const DeepCollectionEquality()
                .equals(other._reviewItems, _reviewItems) &&
            (identical(other.reviewDesc, reviewDesc) ||
                other.reviewDesc == reviewDesc));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      createdAt,
      const DeepCollectionEquality().hash(_diseaseTypeList),
      placeName,
      reviewRate,
      reviewId,
      userId,
      placeId,
      placeType,
      placeAddress,
      const DeepCollectionEquality().hash(_reviewImageList),
      const DeepCollectionEquality().hash(_reviewItems),
      reviewDesc);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_ReviewPreviewResponseDTOCopyWith<_$_ReviewPreviewResponseDTO>
      get copyWith => __$$_ReviewPreviewResponseDTOCopyWithImpl<
          _$_ReviewPreviewResponseDTO>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_ReviewPreviewResponseDTOToJson(
      this,
    );
  }
}

abstract class _ReviewPreviewResponseDTO implements ReviewPreviewResponseDTO {
  factory _ReviewPreviewResponseDTO(
      {@DateTimeConverter() required final DateTime createdAt,
      @JsonKey(name: 'diseaseTypes') final List<DiseaseType> diseaseTypeList,
      @JsonKey(name: 'name') final String placeName,
      @JsonKey(name: 'status') required final ReviewRate reviewRate,
      @JsonKey(name: '_id') required final String reviewId,
      @JsonKey(name: 'userId') required final String userId,
      @JsonKey(name: 'locId') required final String placeId,
      @JsonKey(name: 'locType') required final PlaceType placeType,
      @JsonKey(name: 'address') required final String placeAddress,
      final List<String> reviewImageList,
      required final List<ReviewItem> reviewItems,
      final String reviewDesc}) = _$_ReviewPreviewResponseDTO;

  factory _ReviewPreviewResponseDTO.fromJson(Map<String, dynamic> json) =
      _$_ReviewPreviewResponseDTO.fromJson;

  @override
  @DateTimeConverter()
  DateTime get createdAt;
  @override
  @JsonKey(name: 'diseaseTypes')
  List<DiseaseType> get diseaseTypeList;
  @override
  @JsonKey(name: 'name')
  String get placeName;
  @override
  @JsonKey(name: 'status')
  ReviewRate get reviewRate;
  @override
  @JsonKey(name: '_id')
  String get reviewId;
  @override
  @JsonKey(name: 'userId')
  String get userId;
  @override
  @JsonKey(name: 'locId')
  String get placeId;
  @override
  @JsonKey(name: 'locType')
  PlaceType get placeType;
  @override
  @JsonKey(name: 'address')
  String get placeAddress;
  @override
  List<String> get reviewImageList;
  @override
  List<ReviewItem> get reviewItems;
  @override
  String get reviewDesc;
  @override
  @JsonKey(ignore: true)
  _$$_ReviewPreviewResponseDTOCopyWith<_$_ReviewPreviewResponseDTO>
      get copyWith => throw _privateConstructorUsedError;
}
