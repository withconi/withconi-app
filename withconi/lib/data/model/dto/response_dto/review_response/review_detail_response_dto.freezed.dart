// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

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
  PlacePreviewResponseDTO get placePreview =>
      throw _privateConstructorUsedError;
  List<ConimalResponseDTO> get conimals => throw _privateConstructorUsedError;
  List<DiseaseType> get diseaseTypeList => throw _privateConstructorUsedError;
  List<DiseaseResponseDTO> get diseaseList =>
      throw _privateConstructorUsedError;
  ReviewRate get reviewRate => throw _privateConstructorUsedError;
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
      PlacePreviewResponseDTO placePreview,
      List<ConimalResponseDTO> conimals,
      List<DiseaseType> diseaseTypeList,
      List<DiseaseResponseDTO> diseaseList,
      ReviewRate reviewRate,
      List<ReviewItem> reviewItems,
      String reviewDesc});

  $PlacePreviewResponseDTOCopyWith<$Res> get placePreview;
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
    Object? placePreview = null,
    Object? conimals = null,
    Object? diseaseTypeList = null,
    Object? diseaseList = null,
    Object? reviewRate = null,
    Object? reviewItems = null,
    Object? reviewDesc = null,
  }) {
    return _then(_value.copyWith(
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      placePreview: null == placePreview
          ? _value.placePreview
          : placePreview // ignore: cast_nullable_to_non_nullable
              as PlacePreviewResponseDTO,
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
      reviewRate: null == reviewRate
          ? _value.reviewRate
          : reviewRate // ignore: cast_nullable_to_non_nullable
              as ReviewRate,
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

  @override
  @pragma('vm:prefer-inline')
  $PlacePreviewResponseDTOCopyWith<$Res> get placePreview {
    return $PlacePreviewResponseDTOCopyWith<$Res>(_value.placePreview, (value) {
      return _then(_value.copyWith(placePreview: value) as $Val);
    });
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
      PlacePreviewResponseDTO placePreview,
      List<ConimalResponseDTO> conimals,
      List<DiseaseType> diseaseTypeList,
      List<DiseaseResponseDTO> diseaseList,
      ReviewRate reviewRate,
      List<ReviewItem> reviewItems,
      String reviewDesc});

  @override
  $PlacePreviewResponseDTOCopyWith<$Res> get placePreview;
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
    Object? placePreview = null,
    Object? conimals = null,
    Object? diseaseTypeList = null,
    Object? diseaseList = null,
    Object? reviewRate = null,
    Object? reviewItems = null,
    Object? reviewDesc = null,
  }) {
    return _then(_$_ReviewDetailResponseDTO(
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      placePreview: null == placePreview
          ? _value.placePreview
          : placePreview // ignore: cast_nullable_to_non_nullable
              as PlacePreviewResponseDTO,
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
      reviewRate: null == reviewRate
          ? _value.reviewRate
          : reviewRate // ignore: cast_nullable_to_non_nullable
              as ReviewRate,
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
      {@DateTimeConverter() required this.createdAt,
      required this.placePreview,
      required final List<ConimalResponseDTO> conimals,
      required final List<DiseaseType> diseaseTypeList,
      required final List<DiseaseResponseDTO> diseaseList,
      required this.reviewRate,
      required final List<ReviewItem> reviewItems,
      required this.reviewDesc})
      : _conimals = conimals,
        _diseaseTypeList = diseaseTypeList,
        _diseaseList = diseaseList,
        _reviewItems = reviewItems;

  factory _$_ReviewDetailResponseDTO.fromJson(Map<String, dynamic> json) =>
      _$$_ReviewDetailResponseDTOFromJson(json);

  @override
  @DateTimeConverter()
  final DateTime createdAt;
  @override
  final PlacePreviewResponseDTO placePreview;
  final List<ConimalResponseDTO> _conimals;
  @override
  List<ConimalResponseDTO> get conimals {
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_conimals);
  }

  final List<DiseaseType> _diseaseTypeList;
  @override
  List<DiseaseType> get diseaseTypeList {
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_diseaseTypeList);
  }

  final List<DiseaseResponseDTO> _diseaseList;
  @override
  List<DiseaseResponseDTO> get diseaseList {
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_diseaseList);
  }

  @override
  final ReviewRate reviewRate;
  final List<ReviewItem> _reviewItems;
  @override
  List<ReviewItem> get reviewItems {
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_reviewItems);
  }

  @override
  final String reviewDesc;

  @override
  String toString() {
    return 'ReviewDetailResponseDTO(createdAt: $createdAt, placePreview: $placePreview, conimals: $conimals, diseaseTypeList: $diseaseTypeList, diseaseList: $diseaseList, reviewRate: $reviewRate, reviewItems: $reviewItems, reviewDesc: $reviewDesc)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_ReviewDetailResponseDTO &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.placePreview, placePreview) ||
                other.placePreview == placePreview) &&
            const DeepCollectionEquality().equals(other._conimals, _conimals) &&
            const DeepCollectionEquality()
                .equals(other._diseaseTypeList, _diseaseTypeList) &&
            const DeepCollectionEquality()
                .equals(other._diseaseList, _diseaseList) &&
            (identical(other.reviewRate, reviewRate) ||
                other.reviewRate == reviewRate) &&
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
      placePreview,
      const DeepCollectionEquality().hash(_conimals),
      const DeepCollectionEquality().hash(_diseaseTypeList),
      const DeepCollectionEquality().hash(_diseaseList),
      reviewRate,
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
      required final PlacePreviewResponseDTO placePreview,
      required final List<ConimalResponseDTO> conimals,
      required final List<DiseaseType> diseaseTypeList,
      required final List<DiseaseResponseDTO> diseaseList,
      required final ReviewRate reviewRate,
      required final List<ReviewItem> reviewItems,
      required final String reviewDesc}) = _$_ReviewDetailResponseDTO;

  factory _ReviewDetailResponseDTO.fromJson(Map<String, dynamic> json) =
      _$_ReviewDetailResponseDTO.fromJson;

  @override
  @DateTimeConverter()
  DateTime get createdAt;
  @override
  PlacePreviewResponseDTO get placePreview;
  @override
  List<ConimalResponseDTO> get conimals;
  @override
  List<DiseaseType> get diseaseTypeList;
  @override
  List<DiseaseResponseDTO> get diseaseList;
  @override
  ReviewRate get reviewRate;
  @override
  List<ReviewItem> get reviewItems;
  @override
  String get reviewDesc;
  @override
  @JsonKey(ignore: true)
  _$$_ReviewDetailResponseDTOCopyWith<_$_ReviewDetailResponseDTO>
      get copyWith => throw _privateConstructorUsedError;
}
