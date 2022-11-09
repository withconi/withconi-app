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
  String get definition => throw _privateConstructorUsedError;
  String get diagnosisTechnique => throw _privateConstructorUsedError;
  String get treatment => throw _privateConstructorUsedError;
  String get advice => throw _privateConstructorUsedError;
  List<SymptomGroup> get symptomGroupList => throw _privateConstructorUsedError;
  DiseaseType get diseaseType => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ReviewDetailResponseDTOCopyWith<ReviewDetailResponseDTO> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ReviewDetailResponseDTOCopyWith<$Res> {
  factory $ReviewDetailResponseDTOCopyWith(ReviewDetailResponseDTO value,
          $Res Function(ReviewDetailResponseDTO) then) =
      _$ReviewDetailResponseDTOCopyWithImpl<$Res>;
  $Res call(
      {@DateTimeConverter() DateTime createdAt,
      PlacePreviewResponseDTO placePreview,
      List<ConimalResponseDTO> conimals,
      List<DiseaseType> diseaseTypeList,
      List<DiseaseResponseDTO> diseaseList,
      ReviewRate reviewRate,
      List<ReviewItem> reviewItems,
      String reviewDesc,
      String definition,
      String diagnosisTechnique,
      String treatment,
      String advice,
      List<SymptomGroup> symptomGroupList,
      DiseaseType diseaseType});

  $PlacePreviewResponseDTOCopyWith<$Res> get placePreview;
}

/// @nodoc
class _$ReviewDetailResponseDTOCopyWithImpl<$Res>
    implements $ReviewDetailResponseDTOCopyWith<$Res> {
  _$ReviewDetailResponseDTOCopyWithImpl(this._value, this._then);

  final ReviewDetailResponseDTO _value;
  // ignore: unused_field
  final $Res Function(ReviewDetailResponseDTO) _then;

  @override
  $Res call({
    Object? createdAt = freezed,
    Object? placePreview = freezed,
    Object? conimals = freezed,
    Object? diseaseTypeList = freezed,
    Object? diseaseList = freezed,
    Object? reviewRate = freezed,
    Object? reviewItems = freezed,
    Object? reviewDesc = freezed,
    Object? definition = freezed,
    Object? diagnosisTechnique = freezed,
    Object? treatment = freezed,
    Object? advice = freezed,
    Object? symptomGroupList = freezed,
    Object? diseaseType = freezed,
  }) {
    return _then(_value.copyWith(
      createdAt: createdAt == freezed
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      placePreview: placePreview == freezed
          ? _value.placePreview
          : placePreview // ignore: cast_nullable_to_non_nullable
              as PlacePreviewResponseDTO,
      conimals: conimals == freezed
          ? _value.conimals
          : conimals // ignore: cast_nullable_to_non_nullable
              as List<ConimalResponseDTO>,
      diseaseTypeList: diseaseTypeList == freezed
          ? _value.diseaseTypeList
          : diseaseTypeList // ignore: cast_nullable_to_non_nullable
              as List<DiseaseType>,
      diseaseList: diseaseList == freezed
          ? _value.diseaseList
          : diseaseList // ignore: cast_nullable_to_non_nullable
              as List<DiseaseResponseDTO>,
      reviewRate: reviewRate == freezed
          ? _value.reviewRate
          : reviewRate // ignore: cast_nullable_to_non_nullable
              as ReviewRate,
      reviewItems: reviewItems == freezed
          ? _value.reviewItems
          : reviewItems // ignore: cast_nullable_to_non_nullable
              as List<ReviewItem>,
      reviewDesc: reviewDesc == freezed
          ? _value.reviewDesc
          : reviewDesc // ignore: cast_nullable_to_non_nullable
              as String,
      definition: definition == freezed
          ? _value.definition
          : definition // ignore: cast_nullable_to_non_nullable
              as String,
      diagnosisTechnique: diagnosisTechnique == freezed
          ? _value.diagnosisTechnique
          : diagnosisTechnique // ignore: cast_nullable_to_non_nullable
              as String,
      treatment: treatment == freezed
          ? _value.treatment
          : treatment // ignore: cast_nullable_to_non_nullable
              as String,
      advice: advice == freezed
          ? _value.advice
          : advice // ignore: cast_nullable_to_non_nullable
              as String,
      symptomGroupList: symptomGroupList == freezed
          ? _value.symptomGroupList
          : symptomGroupList // ignore: cast_nullable_to_non_nullable
              as List<SymptomGroup>,
      diseaseType: diseaseType == freezed
          ? _value.diseaseType
          : diseaseType // ignore: cast_nullable_to_non_nullable
              as DiseaseType,
    ));
  }

  @override
  $PlacePreviewResponseDTOCopyWith<$Res> get placePreview {
    return $PlacePreviewResponseDTOCopyWith<$Res>(_value.placePreview, (value) {
      return _then(_value.copyWith(placePreview: value));
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
  $Res call(
      {@DateTimeConverter() DateTime createdAt,
      PlacePreviewResponseDTO placePreview,
      List<ConimalResponseDTO> conimals,
      List<DiseaseType> diseaseTypeList,
      List<DiseaseResponseDTO> diseaseList,
      ReviewRate reviewRate,
      List<ReviewItem> reviewItems,
      String reviewDesc,
      String definition,
      String diagnosisTechnique,
      String treatment,
      String advice,
      List<SymptomGroup> symptomGroupList,
      DiseaseType diseaseType});

  @override
  $PlacePreviewResponseDTOCopyWith<$Res> get placePreview;
}

/// @nodoc
class __$$_ReviewDetailResponseDTOCopyWithImpl<$Res>
    extends _$ReviewDetailResponseDTOCopyWithImpl<$Res>
    implements _$$_ReviewDetailResponseDTOCopyWith<$Res> {
  __$$_ReviewDetailResponseDTOCopyWithImpl(_$_ReviewDetailResponseDTO _value,
      $Res Function(_$_ReviewDetailResponseDTO) _then)
      : super(_value, (v) => _then(v as _$_ReviewDetailResponseDTO));

  @override
  _$_ReviewDetailResponseDTO get _value =>
      super._value as _$_ReviewDetailResponseDTO;

  @override
  $Res call({
    Object? createdAt = freezed,
    Object? placePreview = freezed,
    Object? conimals = freezed,
    Object? diseaseTypeList = freezed,
    Object? diseaseList = freezed,
    Object? reviewRate = freezed,
    Object? reviewItems = freezed,
    Object? reviewDesc = freezed,
    Object? definition = freezed,
    Object? diagnosisTechnique = freezed,
    Object? treatment = freezed,
    Object? advice = freezed,
    Object? symptomGroupList = freezed,
    Object? diseaseType = freezed,
  }) {
    return _then(_$_ReviewDetailResponseDTO(
      createdAt: createdAt == freezed
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      placePreview: placePreview == freezed
          ? _value.placePreview
          : placePreview // ignore: cast_nullable_to_non_nullable
              as PlacePreviewResponseDTO,
      conimals: conimals == freezed
          ? _value._conimals
          : conimals // ignore: cast_nullable_to_non_nullable
              as List<ConimalResponseDTO>,
      diseaseTypeList: diseaseTypeList == freezed
          ? _value._diseaseTypeList
          : diseaseTypeList // ignore: cast_nullable_to_non_nullable
              as List<DiseaseType>,
      diseaseList: diseaseList == freezed
          ? _value._diseaseList
          : diseaseList // ignore: cast_nullable_to_non_nullable
              as List<DiseaseResponseDTO>,
      reviewRate: reviewRate == freezed
          ? _value.reviewRate
          : reviewRate // ignore: cast_nullable_to_non_nullable
              as ReviewRate,
      reviewItems: reviewItems == freezed
          ? _value._reviewItems
          : reviewItems // ignore: cast_nullable_to_non_nullable
              as List<ReviewItem>,
      reviewDesc: reviewDesc == freezed
          ? _value.reviewDesc
          : reviewDesc // ignore: cast_nullable_to_non_nullable
              as String,
      definition: definition == freezed
          ? _value.definition
          : definition // ignore: cast_nullable_to_non_nullable
              as String,
      diagnosisTechnique: diagnosisTechnique == freezed
          ? _value.diagnosisTechnique
          : diagnosisTechnique // ignore: cast_nullable_to_non_nullable
              as String,
      treatment: treatment == freezed
          ? _value.treatment
          : treatment // ignore: cast_nullable_to_non_nullable
              as String,
      advice: advice == freezed
          ? _value.advice
          : advice // ignore: cast_nullable_to_non_nullable
              as String,
      symptomGroupList: symptomGroupList == freezed
          ? _value._symptomGroupList
          : symptomGroupList // ignore: cast_nullable_to_non_nullable
              as List<SymptomGroup>,
      diseaseType: diseaseType == freezed
          ? _value.diseaseType
          : diseaseType // ignore: cast_nullable_to_non_nullable
              as DiseaseType,
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
      required this.reviewDesc,
      this.definition = '',
      this.diagnosisTechnique = '',
      this.treatment = '',
      this.advice = '',
      final List<SymptomGroup> symptomGroupList = const [],
      this.diseaseType = DiseaseType.brainNeurology})
      : _conimals = conimals,
        _diseaseTypeList = diseaseTypeList,
        _diseaseList = diseaseList,
        _reviewItems = reviewItems,
        _symptomGroupList = symptomGroupList;

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
  @JsonKey()
  final String definition;
  @override
  @JsonKey()
  final String diagnosisTechnique;
  @override
  @JsonKey()
  final String treatment;
  @override
  @JsonKey()
  final String advice;
  final List<SymptomGroup> _symptomGroupList;
  @override
  @JsonKey()
  List<SymptomGroup> get symptomGroupList {
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_symptomGroupList);
  }

  @override
  @JsonKey()
  final DiseaseType diseaseType;

  @override
  String toString() {
    return 'ReviewDetailResponseDTO(createdAt: $createdAt, placePreview: $placePreview, conimals: $conimals, diseaseTypeList: $diseaseTypeList, diseaseList: $diseaseList, reviewRate: $reviewRate, reviewItems: $reviewItems, reviewDesc: $reviewDesc, definition: $definition, diagnosisTechnique: $diagnosisTechnique, treatment: $treatment, advice: $advice, symptomGroupList: $symptomGroupList, diseaseType: $diseaseType)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_ReviewDetailResponseDTO &&
            const DeepCollectionEquality().equals(other.createdAt, createdAt) &&
            const DeepCollectionEquality()
                .equals(other.placePreview, placePreview) &&
            const DeepCollectionEquality().equals(other._conimals, _conimals) &&
            const DeepCollectionEquality()
                .equals(other._diseaseTypeList, _diseaseTypeList) &&
            const DeepCollectionEquality()
                .equals(other._diseaseList, _diseaseList) &&
            const DeepCollectionEquality()
                .equals(other.reviewRate, reviewRate) &&
            const DeepCollectionEquality()
                .equals(other._reviewItems, _reviewItems) &&
            const DeepCollectionEquality()
                .equals(other.reviewDesc, reviewDesc) &&
            const DeepCollectionEquality()
                .equals(other.definition, definition) &&
            const DeepCollectionEquality()
                .equals(other.diagnosisTechnique, diagnosisTechnique) &&
            const DeepCollectionEquality().equals(other.treatment, treatment) &&
            const DeepCollectionEquality().equals(other.advice, advice) &&
            const DeepCollectionEquality()
                .equals(other._symptomGroupList, _symptomGroupList) &&
            const DeepCollectionEquality()
                .equals(other.diseaseType, diseaseType));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(createdAt),
      const DeepCollectionEquality().hash(placePreview),
      const DeepCollectionEquality().hash(_conimals),
      const DeepCollectionEquality().hash(_diseaseTypeList),
      const DeepCollectionEquality().hash(_diseaseList),
      const DeepCollectionEquality().hash(reviewRate),
      const DeepCollectionEquality().hash(_reviewItems),
      const DeepCollectionEquality().hash(reviewDesc),
      const DeepCollectionEquality().hash(definition),
      const DeepCollectionEquality().hash(diagnosisTechnique),
      const DeepCollectionEquality().hash(treatment),
      const DeepCollectionEquality().hash(advice),
      const DeepCollectionEquality().hash(_symptomGroupList),
      const DeepCollectionEquality().hash(diseaseType));

  @JsonKey(ignore: true)
  @override
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
      required final String reviewDesc,
      final String definition,
      final String diagnosisTechnique,
      final String treatment,
      final String advice,
      final List<SymptomGroup> symptomGroupList,
      final DiseaseType diseaseType}) = _$_ReviewDetailResponseDTO;

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
  String get definition;
  @override
  String get diagnosisTechnique;
  @override
  String get treatment;
  @override
  String get advice;
  @override
  List<SymptomGroup> get symptomGroupList;
  @override
  DiseaseType get diseaseType;
  @override
  @JsonKey(ignore: true)
  _$$_ReviewDetailResponseDTOCopyWith<_$_ReviewDetailResponseDTO>
      get copyWith => throw _privateConstructorUsedError;
}
