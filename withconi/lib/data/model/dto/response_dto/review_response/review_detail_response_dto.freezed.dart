// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'review_detail_response_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

ReviewDetailResponseDTO _$ReviewDetailResponseDTOFromJson(
    Map<String, dynamic> json) {
  return _ReviewDetailResponseDTO.fromJson(json);
}

/// @nodoc
mixin _$ReviewDetailResponseDTO {
  @DateTimeConverter()
  DateTime get createdAt => throw _privateConstructorUsedError;
  List<ConimalResponseDTO> get conimals => throw _privateConstructorUsedError;
  @JsonKey(name: 'diseaseTypes')
  List<DiseaseType> get diseaseTypeList => throw _privateConstructorUsedError;
  @JsonKey(name: 'diseaseList')
  List<DiseaseResponseDTO> get diseaseList =>
      throw _privateConstructorUsedError; // required List<DiseaseResponseDTO> diseaseList,
  @JsonKey(name: 'name')
  String get placeName => throw _privateConstructorUsedError;
  @JsonKey(name: 'status')
  ReviewRate get reviewRate => throw _privateConstructorUsedError;
  @JsonKey(name: '_id')
  String get reviewId => throw _privateConstructorUsedError;
  @JsonKey(name: 'userId')
  String get userId => throw _privateConstructorUsedError;
  @JsonKey(name: 'placeThumbnail')
  String get placeThumbnail => throw _privateConstructorUsedError;
  @JsonKey(name: 'locId')
  String get placeId => throw _privateConstructorUsedError;
  @JsonKey(name: 'locType')
  PlaceType get placeType => throw _privateConstructorUsedError;
  @JsonKey(name: 'address')
  String get placeAddress => throw _privateConstructorUsedError;
  @JsonKey(name: 'reviewImageList')
  List<String> get reviewImageList => throw _privateConstructorUsedError;
  List<ReviewItem> get reviewItems => throw _privateConstructorUsedError;
  String get reviewDesc => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ReviewDetailResponseDTOCopyWith<ReviewDetailResponseDTO> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ReviewDetailResponseDTOCopyWith<$Res> {
  factory $ReviewDetailResponseDTOCopyWith(ReviewDetailResponseDTO value,
          $Res Function(ReviewDetailResponseDTO) then) =
      _$ReviewDetailResponseDTOCopyWithImpl<$Res, ReviewDetailResponseDTO>;
  @useResult
  $Res call(
      {@DateTimeConverter() DateTime createdAt,
      List<ConimalResponseDTO> conimals,
      @JsonKey(name: 'diseaseTypes') List<DiseaseType> diseaseTypeList,
      @JsonKey(name: 'diseaseList') List<DiseaseResponseDTO> diseaseList,
      @JsonKey(name: 'name') String placeName,
      @JsonKey(name: 'status') ReviewRate reviewRate,
      @JsonKey(name: '_id') String reviewId,
      @JsonKey(name: 'userId') String userId,
      @JsonKey(name: 'placeThumbnail') String placeThumbnail,
      @JsonKey(name: 'locId') String placeId,
      @JsonKey(name: 'locType') PlaceType placeType,
      @JsonKey(name: 'address') String placeAddress,
      @JsonKey(name: 'reviewImageList') List<String> reviewImageList,
      List<ReviewItem> reviewItems,
      String reviewDesc});
}

/// @nodoc
class _$ReviewDetailResponseDTOCopyWithImpl<$Res,
        $Val extends ReviewDetailResponseDTO>
    implements $ReviewDetailResponseDTOCopyWith<$Res> {
  _$ReviewDetailResponseDTOCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? createdAt = null,
    Object? conimals = null,
    Object? diseaseTypeList = null,
    Object? diseaseList = null,
    Object? placeName = null,
    Object? reviewRate = null,
    Object? reviewId = null,
    Object? userId = null,
    Object? placeThumbnail = null,
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
      conimals: null == conimals
          ? _value.conimals
          : conimals // ignore: cast_nullable_to_non_nullable
              as List<ConimalResponseDTO>,
      diseaseTypeList: null == diseaseTypeList
          ? _value.diseaseTypeList
          : diseaseTypeList // ignore: cast_nullable_to_non_nullable
              as List<DiseaseType>,
      diseaseList: null == diseaseList
          ? _value.diseaseList
          : diseaseList // ignore: cast_nullable_to_non_nullable
              as List<DiseaseResponseDTO>,
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
      placeThumbnail: null == placeThumbnail
          ? _value.placeThumbnail
          : placeThumbnail // ignore: cast_nullable_to_non_nullable
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
abstract class _$$_ReviewDetailResponseDTOCopyWith<$Res>
    implements $ReviewDetailResponseDTOCopyWith<$Res> {
  factory _$$_ReviewDetailResponseDTOCopyWith(_$_ReviewDetailResponseDTO value,
          $Res Function(_$_ReviewDetailResponseDTO) then) =
      __$$_ReviewDetailResponseDTOCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@DateTimeConverter() DateTime createdAt,
      List<ConimalResponseDTO> conimals,
      @JsonKey(name: 'diseaseTypes') List<DiseaseType> diseaseTypeList,
      @JsonKey(name: 'diseaseList') List<DiseaseResponseDTO> diseaseList,
      @JsonKey(name: 'name') String placeName,
      @JsonKey(name: 'status') ReviewRate reviewRate,
      @JsonKey(name: '_id') String reviewId,
      @JsonKey(name: 'userId') String userId,
      @JsonKey(name: 'placeThumbnail') String placeThumbnail,
      @JsonKey(name: 'locId') String placeId,
      @JsonKey(name: 'locType') PlaceType placeType,
      @JsonKey(name: 'address') String placeAddress,
      @JsonKey(name: 'reviewImageList') List<String> reviewImageList,
      List<ReviewItem> reviewItems,
      String reviewDesc});
}

/// @nodoc
class __$$_ReviewDetailResponseDTOCopyWithImpl<$Res>
    extends _$ReviewDetailResponseDTOCopyWithImpl<$Res,
        _$_ReviewDetailResponseDTO>
    implements _$$_ReviewDetailResponseDTOCopyWith<$Res> {
  __$$_ReviewDetailResponseDTOCopyWithImpl(_$_ReviewDetailResponseDTO _value,
      $Res Function(_$_ReviewDetailResponseDTO) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? createdAt = null,
    Object? conimals = null,
    Object? diseaseTypeList = null,
    Object? diseaseList = null,
    Object? placeName = null,
    Object? reviewRate = null,
    Object? reviewId = null,
    Object? userId = null,
    Object? placeThumbnail = null,
    Object? placeId = null,
    Object? placeType = null,
    Object? placeAddress = null,
    Object? reviewImageList = null,
    Object? reviewItems = null,
    Object? reviewDesc = null,
  }) {
    return _then(_$_ReviewDetailResponseDTO(
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      conimals: null == conimals
          ? _value._conimals
          : conimals // ignore: cast_nullable_to_non_nullable
              as List<ConimalResponseDTO>,
      diseaseTypeList: null == diseaseTypeList
          ? _value._diseaseTypeList
          : diseaseTypeList // ignore: cast_nullable_to_non_nullable
              as List<DiseaseType>,
      diseaseList: null == diseaseList
          ? _value._diseaseList
          : diseaseList // ignore: cast_nullable_to_non_nullable
              as List<DiseaseResponseDTO>,
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
      placeThumbnail: null == placeThumbnail
          ? _value.placeThumbnail
          : placeThumbnail // ignore: cast_nullable_to_non_nullable
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
class _$_ReviewDetailResponseDTO implements _ReviewDetailResponseDTO {
  _$_ReviewDetailResponseDTO(
      {@DateTimeConverter()
          required this.createdAt,
      required final List<ConimalResponseDTO> conimals,
      @JsonKey(name: 'diseaseTypes')
          final List<DiseaseType> diseaseTypeList = const [],
      @JsonKey(name: 'diseaseList')
          final List<DiseaseResponseDTO> diseaseList = const [],
      @JsonKey(name: 'name')
          this.placeName = '장소 이름 없음',
      @JsonKey(name: 'status')
          required this.reviewRate,
      @JsonKey(name: '_id')
          required this.reviewId,
      @JsonKey(name: 'userId')
          required this.userId,
      @JsonKey(name: 'placeThumbnail')
          this.placeThumbnail = '',
      @JsonKey(name: 'locId')
          required this.placeId,
      @JsonKey(name: 'locType')
          required this.placeType,
      @JsonKey(name: 'address')
          required this.placeAddress,
      @JsonKey(name: 'reviewImageList')
          final List<String> reviewImageList = const [],
      required final List<ReviewItem> reviewItems,
      this.reviewDesc = ''})
      : _conimals = conimals,
        _diseaseTypeList = diseaseTypeList,
        _diseaseList = diseaseList,
        _reviewImageList = reviewImageList,
        _reviewItems = reviewItems;

  factory _$_ReviewDetailResponseDTO.fromJson(Map<String, dynamic> json) =>
      _$$_ReviewDetailResponseDTOFromJson(json);

  @override
  @DateTimeConverter()
  final DateTime createdAt;
  final List<ConimalResponseDTO> _conimals;
  @override
  List<ConimalResponseDTO> get conimals {
    if (_conimals is EqualUnmodifiableListView) return _conimals;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_conimals);
  }

  final List<DiseaseType> _diseaseTypeList;
  @override
  @JsonKey(name: 'diseaseTypes')
  List<DiseaseType> get diseaseTypeList {
    if (_diseaseTypeList is EqualUnmodifiableListView) return _diseaseTypeList;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_diseaseTypeList);
  }

  final List<DiseaseResponseDTO> _diseaseList;
  @override
  @JsonKey(name: 'diseaseList')
  List<DiseaseResponseDTO> get diseaseList {
    if (_diseaseList is EqualUnmodifiableListView) return _diseaseList;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_diseaseList);
  }

// required List<DiseaseResponseDTO> diseaseList,
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
  @JsonKey(name: 'placeThumbnail')
  final String placeThumbnail;
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
  @JsonKey(name: 'reviewImageList')
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
    return 'ReviewDetailResponseDTO(createdAt: $createdAt, conimals: $conimals, diseaseTypeList: $diseaseTypeList, diseaseList: $diseaseList, placeName: $placeName, reviewRate: $reviewRate, reviewId: $reviewId, userId: $userId, placeThumbnail: $placeThumbnail, placeId: $placeId, placeType: $placeType, placeAddress: $placeAddress, reviewImageList: $reviewImageList, reviewItems: $reviewItems, reviewDesc: $reviewDesc)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_ReviewDetailResponseDTO &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            const DeepCollectionEquality().equals(other._conimals, _conimals) &&
            const DeepCollectionEquality()
                .equals(other._diseaseTypeList, _diseaseTypeList) &&
            const DeepCollectionEquality()
                .equals(other._diseaseList, _diseaseList) &&
            (identical(other.placeName, placeName) ||
                other.placeName == placeName) &&
            (identical(other.reviewRate, reviewRate) ||
                other.reviewRate == reviewRate) &&
            (identical(other.reviewId, reviewId) ||
                other.reviewId == reviewId) &&
            (identical(other.userId, userId) || other.userId == userId) &&
            (identical(other.placeThumbnail, placeThumbnail) ||
                other.placeThumbnail == placeThumbnail) &&
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
      const DeepCollectionEquality().hash(_conimals),
      const DeepCollectionEquality().hash(_diseaseTypeList),
      const DeepCollectionEquality().hash(_diseaseList),
      placeName,
      reviewRate,
      reviewId,
      userId,
      placeThumbnail,
      placeId,
      placeType,
      placeAddress,
      const DeepCollectionEquality().hash(_reviewImageList),
      const DeepCollectionEquality().hash(_reviewItems),
      reviewDesc);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_ReviewDetailResponseDTOCopyWith<_$_ReviewDetailResponseDTO>
      get copyWith =>
          __$$_ReviewDetailResponseDTOCopyWithImpl<_$_ReviewDetailResponseDTO>(
              this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_ReviewDetailResponseDTOToJson(
      this,
    );
  }
}

abstract class _ReviewDetailResponseDTO implements ReviewDetailResponseDTO {
  factory _ReviewDetailResponseDTO(
      {@DateTimeConverter() required final DateTime createdAt,
      required final List<ConimalResponseDTO> conimals,
      @JsonKey(name: 'diseaseTypes') final List<DiseaseType> diseaseTypeList,
      @JsonKey(name: 'diseaseList') final List<DiseaseResponseDTO> diseaseList,
      @JsonKey(name: 'name') final String placeName,
      @JsonKey(name: 'status') required final ReviewRate reviewRate,
      @JsonKey(name: '_id') required final String reviewId,
      @JsonKey(name: 'userId') required final String userId,
      @JsonKey(name: 'placeThumbnail') final String placeThumbnail,
      @JsonKey(name: 'locId') required final String placeId,
      @JsonKey(name: 'locType') required final PlaceType placeType,
      @JsonKey(name: 'address') required final String placeAddress,
      @JsonKey(name: 'reviewImageList') final List<String> reviewImageList,
      required final List<ReviewItem> reviewItems,
      final String reviewDesc}) = _$_ReviewDetailResponseDTO;

  factory _ReviewDetailResponseDTO.fromJson(Map<String, dynamic> json) =
      _$_ReviewDetailResponseDTO.fromJson;

  @override
  @DateTimeConverter()
  DateTime get createdAt;
  @override
  List<ConimalResponseDTO> get conimals;
  @override
  @JsonKey(name: 'diseaseTypes')
  List<DiseaseType> get diseaseTypeList;
  @override
  @JsonKey(name: 'diseaseList')
  List<DiseaseResponseDTO> get diseaseList;
  @override // required List<DiseaseResponseDTO> diseaseList,
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
  @JsonKey(name: 'placeThumbnail')
  String get placeThumbnail;
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
  @JsonKey(name: 'reviewImageList')
  List<String> get reviewImageList;
  @override
  List<ReviewItem> get reviewItems;
  @override
  String get reviewDesc;
  @override
  @JsonKey(ignore: true)
  _$$_ReviewDetailResponseDTOCopyWith<_$_ReviewDetailResponseDTO>
      get copyWith => throw _privateConstructorUsedError;
}
