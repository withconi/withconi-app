// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'place_preview_response_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

PlacePreviewResponseDTO _$PlacePreviewResponseDTOFromJson(
    Map<String, dynamic> json) {
  switch (json['runtimeType']) {
    case 'pharmacy':
      return PharmacyPreviewResponseDTO.fromJson(json);
    case 'hospital':
      return HospitalPreviewResponseDTO.fromJson(json);

    default:
      throw CheckedFromJsonException(
          json,
          'runtimeType',
          'PlacePreviewResponseDTO',
          'Invalid union type "${json['runtimeType']}"!');
  }
}

/// @nodoc
mixin _$PlacePreviewResponseDTO {
  @JsonKey(name: '_id')
  String get placeId => throw _privateConstructorUsedError;
  String get address => throw _privateConstructorUsedError;
  @JsonKey(name: 'isPhotoReview')
  bool get isPhotoReview => throw _privateConstructorUsedError;
  bool get isBookmarked => throw _privateConstructorUsedError;
  LatLngResponseDTO get coordinate => throw _privateConstructorUsedError;
  String get phone => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  OpeningStatus get openingStatus => throw _privateConstructorUsedError;
  String get thumbnail => throw _privateConstructorUsedError;
  @JsonKey(name: 'locType')
  PlaceType get placeType =>
      throw _privateConstructorUsedError; // @JsonKey(name: 'nono')
  DiseaseType get mostVisitedDiseaseType => throw _privateConstructorUsedError;
  int get totalReviews => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            @JsonKey(name: '_id') String placeId,
            String address,
            @JsonKey(name: 'isPhotoReview') bool isPhotoReview,
            bool isBookmarked,
            LatLngResponseDTO coordinate,
            String phone,
            String name,
            OpeningStatus openingStatus,
            String thumbnail,
            @JsonKey(name: 'locType') PlaceType placeType,
            DiseaseType mostVisitedDiseaseType,
            int totalReviews)
        pharmacy,
    required TResult Function(
            @JsonKey(name: '_id') String placeId,
            String address,
            @JsonKey(name: 'isPhotoReview') bool isPhotoReview,
            bool isBookmarked,
            LatLngResponseDTO coordinate,
            String phone,
            String name,
            OpeningStatus openingStatus,
            String thumbnail,
            @JsonKey(name: 'locType') PlaceType placeType,
            DiseaseType mostVisitedDiseaseType,
            int totalReviews)
        hospital,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(
            @JsonKey(name: '_id') String placeId,
            String address,
            @JsonKey(name: 'isPhotoReview') bool isPhotoReview,
            bool isBookmarked,
            LatLngResponseDTO coordinate,
            String phone,
            String name,
            OpeningStatus openingStatus,
            String thumbnail,
            @JsonKey(name: 'locType') PlaceType placeType,
            DiseaseType mostVisitedDiseaseType,
            int totalReviews)?
        pharmacy,
    TResult? Function(
            @JsonKey(name: '_id') String placeId,
            String address,
            @JsonKey(name: 'isPhotoReview') bool isPhotoReview,
            bool isBookmarked,
            LatLngResponseDTO coordinate,
            String phone,
            String name,
            OpeningStatus openingStatus,
            String thumbnail,
            @JsonKey(name: 'locType') PlaceType placeType,
            DiseaseType mostVisitedDiseaseType,
            int totalReviews)?
        hospital,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(
            @JsonKey(name: '_id') String placeId,
            String address,
            @JsonKey(name: 'isPhotoReview') bool isPhotoReview,
            bool isBookmarked,
            LatLngResponseDTO coordinate,
            String phone,
            String name,
            OpeningStatus openingStatus,
            String thumbnail,
            @JsonKey(name: 'locType') PlaceType placeType,
            DiseaseType mostVisitedDiseaseType,
            int totalReviews)?
        pharmacy,
    TResult Function(
            @JsonKey(name: '_id') String placeId,
            String address,
            @JsonKey(name: 'isPhotoReview') bool isPhotoReview,
            bool isBookmarked,
            LatLngResponseDTO coordinate,
            String phone,
            String name,
            OpeningStatus openingStatus,
            String thumbnail,
            @JsonKey(name: 'locType') PlaceType placeType,
            DiseaseType mostVisitedDiseaseType,
            int totalReviews)?
        hospital,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(PharmacyPreviewResponseDTO value) pharmacy,
    required TResult Function(HospitalPreviewResponseDTO value) hospital,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(PharmacyPreviewResponseDTO value)? pharmacy,
    TResult? Function(HospitalPreviewResponseDTO value)? hospital,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(PharmacyPreviewResponseDTO value)? pharmacy,
    TResult Function(HospitalPreviewResponseDTO value)? hospital,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $PlacePreviewResponseDTOCopyWith<PlacePreviewResponseDTO> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PlacePreviewResponseDTOCopyWith<$Res> {
  factory $PlacePreviewResponseDTOCopyWith(PlacePreviewResponseDTO value,
          $Res Function(PlacePreviewResponseDTO) then) =
      _$PlacePreviewResponseDTOCopyWithImpl<$Res, PlacePreviewResponseDTO>;
  @useResult
  $Res call(
      {@JsonKey(name: '_id') String placeId,
      String address,
      @JsonKey(name: 'isPhotoReview') bool isPhotoReview,
      bool isBookmarked,
      LatLngResponseDTO coordinate,
      String phone,
      String name,
      OpeningStatus openingStatus,
      String thumbnail,
      @JsonKey(name: 'locType') PlaceType placeType,
      DiseaseType mostVisitedDiseaseType,
      int totalReviews});

  $LatLngResponseDTOCopyWith<$Res> get coordinate;
}

/// @nodoc
class _$PlacePreviewResponseDTOCopyWithImpl<$Res,
        $Val extends PlacePreviewResponseDTO>
    implements $PlacePreviewResponseDTOCopyWith<$Res> {
  _$PlacePreviewResponseDTOCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? placeId = null,
    Object? address = null,
    Object? isPhotoReview = null,
    Object? isBookmarked = null,
    Object? coordinate = null,
    Object? phone = null,
    Object? name = null,
    Object? openingStatus = null,
    Object? thumbnail = null,
    Object? placeType = null,
    Object? mostVisitedDiseaseType = null,
    Object? totalReviews = null,
  }) {
    return _then(_value.copyWith(
      placeId: null == placeId
          ? _value.placeId
          : placeId // ignore: cast_nullable_to_non_nullable
              as String,
      address: null == address
          ? _value.address
          : address // ignore: cast_nullable_to_non_nullable
              as String,
      isPhotoReview: null == isPhotoReview
          ? _value.isPhotoReview
          : isPhotoReview // ignore: cast_nullable_to_non_nullable
              as bool,
      isBookmarked: null == isBookmarked
          ? _value.isBookmarked
          : isBookmarked // ignore: cast_nullable_to_non_nullable
              as bool,
      coordinate: null == coordinate
          ? _value.coordinate
          : coordinate // ignore: cast_nullable_to_non_nullable
              as LatLngResponseDTO,
      phone: null == phone
          ? _value.phone
          : phone // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      openingStatus: null == openingStatus
          ? _value.openingStatus
          : openingStatus // ignore: cast_nullable_to_non_nullable
              as OpeningStatus,
      thumbnail: null == thumbnail
          ? _value.thumbnail
          : thumbnail // ignore: cast_nullable_to_non_nullable
              as String,
      placeType: null == placeType
          ? _value.placeType
          : placeType // ignore: cast_nullable_to_non_nullable
              as PlaceType,
      mostVisitedDiseaseType: null == mostVisitedDiseaseType
          ? _value.mostVisitedDiseaseType
          : mostVisitedDiseaseType // ignore: cast_nullable_to_non_nullable
              as DiseaseType,
      totalReviews: null == totalReviews
          ? _value.totalReviews
          : totalReviews // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $LatLngResponseDTOCopyWith<$Res> get coordinate {
    return $LatLngResponseDTOCopyWith<$Res>(_value.coordinate, (value) {
      return _then(_value.copyWith(coordinate: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$PharmacyPreviewResponseDTOCopyWith<$Res>
    implements $PlacePreviewResponseDTOCopyWith<$Res> {
  factory _$$PharmacyPreviewResponseDTOCopyWith(
          _$PharmacyPreviewResponseDTO value,
          $Res Function(_$PharmacyPreviewResponseDTO) then) =
      __$$PharmacyPreviewResponseDTOCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: '_id') String placeId,
      String address,
      @JsonKey(name: 'isPhotoReview') bool isPhotoReview,
      bool isBookmarked,
      LatLngResponseDTO coordinate,
      String phone,
      String name,
      OpeningStatus openingStatus,
      String thumbnail,
      @JsonKey(name: 'locType') PlaceType placeType,
      DiseaseType mostVisitedDiseaseType,
      int totalReviews});

  @override
  $LatLngResponseDTOCopyWith<$Res> get coordinate;
}

/// @nodoc
class __$$PharmacyPreviewResponseDTOCopyWithImpl<$Res>
    extends _$PlacePreviewResponseDTOCopyWithImpl<$Res,
        _$PharmacyPreviewResponseDTO>
    implements _$$PharmacyPreviewResponseDTOCopyWith<$Res> {
  __$$PharmacyPreviewResponseDTOCopyWithImpl(
      _$PharmacyPreviewResponseDTO _value,
      $Res Function(_$PharmacyPreviewResponseDTO) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? placeId = null,
    Object? address = null,
    Object? isPhotoReview = null,
    Object? isBookmarked = null,
    Object? coordinate = null,
    Object? phone = null,
    Object? name = null,
    Object? openingStatus = null,
    Object? thumbnail = null,
    Object? placeType = null,
    Object? mostVisitedDiseaseType = null,
    Object? totalReviews = null,
  }) {
    return _then(_$PharmacyPreviewResponseDTO(
      placeId: null == placeId
          ? _value.placeId
          : placeId // ignore: cast_nullable_to_non_nullable
              as String,
      address: null == address
          ? _value.address
          : address // ignore: cast_nullable_to_non_nullable
              as String,
      isPhotoReview: null == isPhotoReview
          ? _value.isPhotoReview
          : isPhotoReview // ignore: cast_nullable_to_non_nullable
              as bool,
      isBookmarked: null == isBookmarked
          ? _value.isBookmarked
          : isBookmarked // ignore: cast_nullable_to_non_nullable
              as bool,
      coordinate: null == coordinate
          ? _value.coordinate
          : coordinate // ignore: cast_nullable_to_non_nullable
              as LatLngResponseDTO,
      phone: null == phone
          ? _value.phone
          : phone // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      openingStatus: null == openingStatus
          ? _value.openingStatus
          : openingStatus // ignore: cast_nullable_to_non_nullable
              as OpeningStatus,
      thumbnail: null == thumbnail
          ? _value.thumbnail
          : thumbnail // ignore: cast_nullable_to_non_nullable
              as String,
      placeType: null == placeType
          ? _value.placeType
          : placeType // ignore: cast_nullable_to_non_nullable
              as PlaceType,
      mostVisitedDiseaseType: null == mostVisitedDiseaseType
          ? _value.mostVisitedDiseaseType
          : mostVisitedDiseaseType // ignore: cast_nullable_to_non_nullable
              as DiseaseType,
      totalReviews: null == totalReviews
          ? _value.totalReviews
          : totalReviews // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

@JsonSerializable(explicitToJson: true)
class _$PharmacyPreviewResponseDTO implements PharmacyPreviewResponseDTO {
  const _$PharmacyPreviewResponseDTO(
      {@JsonKey(name: '_id') required this.placeId,
      required this.address,
      @JsonKey(name: 'isPhotoReview') this.isPhotoReview = false,
      required this.isBookmarked,
      required this.coordinate,
      required this.phone,
      required this.name,
      required this.openingStatus,
      this.thumbnail = '',
      @JsonKey(name: 'locType') required this.placeType,
      this.mostVisitedDiseaseType = DiseaseType.undefined,
      required this.totalReviews,
      final String? $type})
      : $type = $type ?? 'pharmacy';

  factory _$PharmacyPreviewResponseDTO.fromJson(Map<String, dynamic> json) =>
      _$$PharmacyPreviewResponseDTOFromJson(json);

  @override
  @JsonKey(name: '_id')
  final String placeId;
  @override
  final String address;
  @override
  @JsonKey(name: 'isPhotoReview')
  final bool isPhotoReview;
  @override
  final bool isBookmarked;
  @override
  final LatLngResponseDTO coordinate;
  @override
  final String phone;
  @override
  final String name;
  @override
  final OpeningStatus openingStatus;
  @override
  @JsonKey()
  final String thumbnail;
  @override
  @JsonKey(name: 'locType')
  final PlaceType placeType;
// @JsonKey(name: 'nono')
  @override
  @JsonKey()
  final DiseaseType mostVisitedDiseaseType;
  @override
  final int totalReviews;

  @JsonKey(name: 'runtimeType')
  final String $type;

  @override
  String toString() {
    return 'PlacePreviewResponseDTO.pharmacy(placeId: $placeId, address: $address, isPhotoReview: $isPhotoReview, isBookmarked: $isBookmarked, coordinate: $coordinate, phone: $phone, name: $name, openingStatus: $openingStatus, thumbnail: $thumbnail, placeType: $placeType, mostVisitedDiseaseType: $mostVisitedDiseaseType, totalReviews: $totalReviews)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PharmacyPreviewResponseDTO &&
            (identical(other.placeId, placeId) || other.placeId == placeId) &&
            (identical(other.address, address) || other.address == address) &&
            (identical(other.isPhotoReview, isPhotoReview) ||
                other.isPhotoReview == isPhotoReview) &&
            (identical(other.isBookmarked, isBookmarked) ||
                other.isBookmarked == isBookmarked) &&
            (identical(other.coordinate, coordinate) ||
                other.coordinate == coordinate) &&
            (identical(other.phone, phone) || other.phone == phone) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.openingStatus, openingStatus) ||
                other.openingStatus == openingStatus) &&
            (identical(other.thumbnail, thumbnail) ||
                other.thumbnail == thumbnail) &&
            (identical(other.placeType, placeType) ||
                other.placeType == placeType) &&
            (identical(other.mostVisitedDiseaseType, mostVisitedDiseaseType) ||
                other.mostVisitedDiseaseType == mostVisitedDiseaseType) &&
            (identical(other.totalReviews, totalReviews) ||
                other.totalReviews == totalReviews));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      placeId,
      address,
      isPhotoReview,
      isBookmarked,
      coordinate,
      phone,
      name,
      openingStatus,
      thumbnail,
      placeType,
      mostVisitedDiseaseType,
      totalReviews);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$PharmacyPreviewResponseDTOCopyWith<_$PharmacyPreviewResponseDTO>
      get copyWith => __$$PharmacyPreviewResponseDTOCopyWithImpl<
          _$PharmacyPreviewResponseDTO>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            @JsonKey(name: '_id') String placeId,
            String address,
            @JsonKey(name: 'isPhotoReview') bool isPhotoReview,
            bool isBookmarked,
            LatLngResponseDTO coordinate,
            String phone,
            String name,
            OpeningStatus openingStatus,
            String thumbnail,
            @JsonKey(name: 'locType') PlaceType placeType,
            DiseaseType mostVisitedDiseaseType,
            int totalReviews)
        pharmacy,
    required TResult Function(
            @JsonKey(name: '_id') String placeId,
            String address,
            @JsonKey(name: 'isPhotoReview') bool isPhotoReview,
            bool isBookmarked,
            LatLngResponseDTO coordinate,
            String phone,
            String name,
            OpeningStatus openingStatus,
            String thumbnail,
            @JsonKey(name: 'locType') PlaceType placeType,
            DiseaseType mostVisitedDiseaseType,
            int totalReviews)
        hospital,
  }) {
    return pharmacy(
        placeId,
        address,
        isPhotoReview,
        isBookmarked,
        coordinate,
        phone,
        name,
        openingStatus,
        thumbnail,
        placeType,
        mostVisitedDiseaseType,
        totalReviews);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(
            @JsonKey(name: '_id') String placeId,
            String address,
            @JsonKey(name: 'isPhotoReview') bool isPhotoReview,
            bool isBookmarked,
            LatLngResponseDTO coordinate,
            String phone,
            String name,
            OpeningStatus openingStatus,
            String thumbnail,
            @JsonKey(name: 'locType') PlaceType placeType,
            DiseaseType mostVisitedDiseaseType,
            int totalReviews)?
        pharmacy,
    TResult? Function(
            @JsonKey(name: '_id') String placeId,
            String address,
            @JsonKey(name: 'isPhotoReview') bool isPhotoReview,
            bool isBookmarked,
            LatLngResponseDTO coordinate,
            String phone,
            String name,
            OpeningStatus openingStatus,
            String thumbnail,
            @JsonKey(name: 'locType') PlaceType placeType,
            DiseaseType mostVisitedDiseaseType,
            int totalReviews)?
        hospital,
  }) {
    return pharmacy?.call(
        placeId,
        address,
        isPhotoReview,
        isBookmarked,
        coordinate,
        phone,
        name,
        openingStatus,
        thumbnail,
        placeType,
        mostVisitedDiseaseType,
        totalReviews);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(
            @JsonKey(name: '_id') String placeId,
            String address,
            @JsonKey(name: 'isPhotoReview') bool isPhotoReview,
            bool isBookmarked,
            LatLngResponseDTO coordinate,
            String phone,
            String name,
            OpeningStatus openingStatus,
            String thumbnail,
            @JsonKey(name: 'locType') PlaceType placeType,
            DiseaseType mostVisitedDiseaseType,
            int totalReviews)?
        pharmacy,
    TResult Function(
            @JsonKey(name: '_id') String placeId,
            String address,
            @JsonKey(name: 'isPhotoReview') bool isPhotoReview,
            bool isBookmarked,
            LatLngResponseDTO coordinate,
            String phone,
            String name,
            OpeningStatus openingStatus,
            String thumbnail,
            @JsonKey(name: 'locType') PlaceType placeType,
            DiseaseType mostVisitedDiseaseType,
            int totalReviews)?
        hospital,
    required TResult orElse(),
  }) {
    if (pharmacy != null) {
      return pharmacy(
          placeId,
          address,
          isPhotoReview,
          isBookmarked,
          coordinate,
          phone,
          name,
          openingStatus,
          thumbnail,
          placeType,
          mostVisitedDiseaseType,
          totalReviews);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(PharmacyPreviewResponseDTO value) pharmacy,
    required TResult Function(HospitalPreviewResponseDTO value) hospital,
  }) {
    return pharmacy(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(PharmacyPreviewResponseDTO value)? pharmacy,
    TResult? Function(HospitalPreviewResponseDTO value)? hospital,
  }) {
    return pharmacy?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(PharmacyPreviewResponseDTO value)? pharmacy,
    TResult Function(HospitalPreviewResponseDTO value)? hospital,
    required TResult orElse(),
  }) {
    if (pharmacy != null) {
      return pharmacy(this);
    }
    return orElse();
  }

  @override
  Map<String, dynamic> toJson() {
    return _$$PharmacyPreviewResponseDTOToJson(
      this,
    );
  }
}

abstract class PharmacyPreviewResponseDTO implements PlacePreviewResponseDTO {
  const factory PharmacyPreviewResponseDTO(
      {@JsonKey(name: '_id') required final String placeId,
      required final String address,
      @JsonKey(name: 'isPhotoReview') final bool isPhotoReview,
      required final bool isBookmarked,
      required final LatLngResponseDTO coordinate,
      required final String phone,
      required final String name,
      required final OpeningStatus openingStatus,
      final String thumbnail,
      @JsonKey(name: 'locType') required final PlaceType placeType,
      final DiseaseType mostVisitedDiseaseType,
      required final int totalReviews}) = _$PharmacyPreviewResponseDTO;

  factory PharmacyPreviewResponseDTO.fromJson(Map<String, dynamic> json) =
      _$PharmacyPreviewResponseDTO.fromJson;

  @override
  @JsonKey(name: '_id')
  String get placeId;
  @override
  String get address;
  @override
  @JsonKey(name: 'isPhotoReview')
  bool get isPhotoReview;
  @override
  bool get isBookmarked;
  @override
  LatLngResponseDTO get coordinate;
  @override
  String get phone;
  @override
  String get name;
  @override
  OpeningStatus get openingStatus;
  @override
  String get thumbnail;
  @override
  @JsonKey(name: 'locType')
  PlaceType get placeType;
  @override // @JsonKey(name: 'nono')
  DiseaseType get mostVisitedDiseaseType;
  @override
  int get totalReviews;
  @override
  @JsonKey(ignore: true)
  _$$PharmacyPreviewResponseDTOCopyWith<_$PharmacyPreviewResponseDTO>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$HospitalPreviewResponseDTOCopyWith<$Res>
    implements $PlacePreviewResponseDTOCopyWith<$Res> {
  factory _$$HospitalPreviewResponseDTOCopyWith(
          _$HospitalPreviewResponseDTO value,
          $Res Function(_$HospitalPreviewResponseDTO) then) =
      __$$HospitalPreviewResponseDTOCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: '_id') String placeId,
      String address,
      @JsonKey(name: 'isPhotoReview') bool isPhotoReview,
      bool isBookmarked,
      LatLngResponseDTO coordinate,
      String phone,
      String name,
      OpeningStatus openingStatus,
      String thumbnail,
      @JsonKey(name: 'locType') PlaceType placeType,
      DiseaseType mostVisitedDiseaseType,
      int totalReviews});

  @override
  $LatLngResponseDTOCopyWith<$Res> get coordinate;
}

/// @nodoc
class __$$HospitalPreviewResponseDTOCopyWithImpl<$Res>
    extends _$PlacePreviewResponseDTOCopyWithImpl<$Res,
        _$HospitalPreviewResponseDTO>
    implements _$$HospitalPreviewResponseDTOCopyWith<$Res> {
  __$$HospitalPreviewResponseDTOCopyWithImpl(
      _$HospitalPreviewResponseDTO _value,
      $Res Function(_$HospitalPreviewResponseDTO) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? placeId = null,
    Object? address = null,
    Object? isPhotoReview = null,
    Object? isBookmarked = null,
    Object? coordinate = null,
    Object? phone = null,
    Object? name = null,
    Object? openingStatus = null,
    Object? thumbnail = null,
    Object? placeType = null,
    Object? mostVisitedDiseaseType = null,
    Object? totalReviews = null,
  }) {
    return _then(_$HospitalPreviewResponseDTO(
      placeId: null == placeId
          ? _value.placeId
          : placeId // ignore: cast_nullable_to_non_nullable
              as String,
      address: null == address
          ? _value.address
          : address // ignore: cast_nullable_to_non_nullable
              as String,
      isPhotoReview: null == isPhotoReview
          ? _value.isPhotoReview
          : isPhotoReview // ignore: cast_nullable_to_non_nullable
              as bool,
      isBookmarked: null == isBookmarked
          ? _value.isBookmarked
          : isBookmarked // ignore: cast_nullable_to_non_nullable
              as bool,
      coordinate: null == coordinate
          ? _value.coordinate
          : coordinate // ignore: cast_nullable_to_non_nullable
              as LatLngResponseDTO,
      phone: null == phone
          ? _value.phone
          : phone // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      openingStatus: null == openingStatus
          ? _value.openingStatus
          : openingStatus // ignore: cast_nullable_to_non_nullable
              as OpeningStatus,
      thumbnail: null == thumbnail
          ? _value.thumbnail
          : thumbnail // ignore: cast_nullable_to_non_nullable
              as String,
      placeType: null == placeType
          ? _value.placeType
          : placeType // ignore: cast_nullable_to_non_nullable
              as PlaceType,
      mostVisitedDiseaseType: null == mostVisitedDiseaseType
          ? _value.mostVisitedDiseaseType
          : mostVisitedDiseaseType // ignore: cast_nullable_to_non_nullable
              as DiseaseType,
      totalReviews: null == totalReviews
          ? _value.totalReviews
          : totalReviews // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$HospitalPreviewResponseDTO implements HospitalPreviewResponseDTO {
  const _$HospitalPreviewResponseDTO(
      {@JsonKey(name: '_id') required this.placeId,
      required this.address,
      @JsonKey(name: 'isPhotoReview') this.isPhotoReview = false,
      required this.isBookmarked,
      required this.coordinate,
      required this.phone,
      required this.name,
      required this.openingStatus,
      this.thumbnail = '',
      @JsonKey(name: 'locType') required this.placeType,
      this.mostVisitedDiseaseType = DiseaseType.undefined,
      required this.totalReviews,
      final String? $type})
      : $type = $type ?? 'hospital';

  factory _$HospitalPreviewResponseDTO.fromJson(Map<String, dynamic> json) =>
      _$$HospitalPreviewResponseDTOFromJson(json);

  @override
  @JsonKey(name: '_id')
  final String placeId;
  @override
  final String address;
  @override
  @JsonKey(name: 'isPhotoReview')
  final bool isPhotoReview;
  @override
  final bool isBookmarked;
  @override
  final LatLngResponseDTO coordinate;
  @override
  final String phone;
  @override
  final String name;
  @override
  final OpeningStatus openingStatus;
  @override
  @JsonKey()
  final String thumbnail;
  @override
  @JsonKey(name: 'locType')
  final PlaceType placeType;
// @JsonKey(name: 'nono')
  @override
  @JsonKey()
  final DiseaseType mostVisitedDiseaseType;
  @override
  final int totalReviews;

  @JsonKey(name: 'runtimeType')
  final String $type;

  @override
  String toString() {
    return 'PlacePreviewResponseDTO.hospital(placeId: $placeId, address: $address, isPhotoReview: $isPhotoReview, isBookmarked: $isBookmarked, coordinate: $coordinate, phone: $phone, name: $name, openingStatus: $openingStatus, thumbnail: $thumbnail, placeType: $placeType, mostVisitedDiseaseType: $mostVisitedDiseaseType, totalReviews: $totalReviews)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$HospitalPreviewResponseDTO &&
            (identical(other.placeId, placeId) || other.placeId == placeId) &&
            (identical(other.address, address) || other.address == address) &&
            (identical(other.isPhotoReview, isPhotoReview) ||
                other.isPhotoReview == isPhotoReview) &&
            (identical(other.isBookmarked, isBookmarked) ||
                other.isBookmarked == isBookmarked) &&
            (identical(other.coordinate, coordinate) ||
                other.coordinate == coordinate) &&
            (identical(other.phone, phone) || other.phone == phone) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.openingStatus, openingStatus) ||
                other.openingStatus == openingStatus) &&
            (identical(other.thumbnail, thumbnail) ||
                other.thumbnail == thumbnail) &&
            (identical(other.placeType, placeType) ||
                other.placeType == placeType) &&
            (identical(other.mostVisitedDiseaseType, mostVisitedDiseaseType) ||
                other.mostVisitedDiseaseType == mostVisitedDiseaseType) &&
            (identical(other.totalReviews, totalReviews) ||
                other.totalReviews == totalReviews));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      placeId,
      address,
      isPhotoReview,
      isBookmarked,
      coordinate,
      phone,
      name,
      openingStatus,
      thumbnail,
      placeType,
      mostVisitedDiseaseType,
      totalReviews);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$HospitalPreviewResponseDTOCopyWith<_$HospitalPreviewResponseDTO>
      get copyWith => __$$HospitalPreviewResponseDTOCopyWithImpl<
          _$HospitalPreviewResponseDTO>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            @JsonKey(name: '_id') String placeId,
            String address,
            @JsonKey(name: 'isPhotoReview') bool isPhotoReview,
            bool isBookmarked,
            LatLngResponseDTO coordinate,
            String phone,
            String name,
            OpeningStatus openingStatus,
            String thumbnail,
            @JsonKey(name: 'locType') PlaceType placeType,
            DiseaseType mostVisitedDiseaseType,
            int totalReviews)
        pharmacy,
    required TResult Function(
            @JsonKey(name: '_id') String placeId,
            String address,
            @JsonKey(name: 'isPhotoReview') bool isPhotoReview,
            bool isBookmarked,
            LatLngResponseDTO coordinate,
            String phone,
            String name,
            OpeningStatus openingStatus,
            String thumbnail,
            @JsonKey(name: 'locType') PlaceType placeType,
            DiseaseType mostVisitedDiseaseType,
            int totalReviews)
        hospital,
  }) {
    return hospital(
        placeId,
        address,
        isPhotoReview,
        isBookmarked,
        coordinate,
        phone,
        name,
        openingStatus,
        thumbnail,
        placeType,
        mostVisitedDiseaseType,
        totalReviews);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(
            @JsonKey(name: '_id') String placeId,
            String address,
            @JsonKey(name: 'isPhotoReview') bool isPhotoReview,
            bool isBookmarked,
            LatLngResponseDTO coordinate,
            String phone,
            String name,
            OpeningStatus openingStatus,
            String thumbnail,
            @JsonKey(name: 'locType') PlaceType placeType,
            DiseaseType mostVisitedDiseaseType,
            int totalReviews)?
        pharmacy,
    TResult? Function(
            @JsonKey(name: '_id') String placeId,
            String address,
            @JsonKey(name: 'isPhotoReview') bool isPhotoReview,
            bool isBookmarked,
            LatLngResponseDTO coordinate,
            String phone,
            String name,
            OpeningStatus openingStatus,
            String thumbnail,
            @JsonKey(name: 'locType') PlaceType placeType,
            DiseaseType mostVisitedDiseaseType,
            int totalReviews)?
        hospital,
  }) {
    return hospital?.call(
        placeId,
        address,
        isPhotoReview,
        isBookmarked,
        coordinate,
        phone,
        name,
        openingStatus,
        thumbnail,
        placeType,
        mostVisitedDiseaseType,
        totalReviews);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(
            @JsonKey(name: '_id') String placeId,
            String address,
            @JsonKey(name: 'isPhotoReview') bool isPhotoReview,
            bool isBookmarked,
            LatLngResponseDTO coordinate,
            String phone,
            String name,
            OpeningStatus openingStatus,
            String thumbnail,
            @JsonKey(name: 'locType') PlaceType placeType,
            DiseaseType mostVisitedDiseaseType,
            int totalReviews)?
        pharmacy,
    TResult Function(
            @JsonKey(name: '_id') String placeId,
            String address,
            @JsonKey(name: 'isPhotoReview') bool isPhotoReview,
            bool isBookmarked,
            LatLngResponseDTO coordinate,
            String phone,
            String name,
            OpeningStatus openingStatus,
            String thumbnail,
            @JsonKey(name: 'locType') PlaceType placeType,
            DiseaseType mostVisitedDiseaseType,
            int totalReviews)?
        hospital,
    required TResult orElse(),
  }) {
    if (hospital != null) {
      return hospital(
          placeId,
          address,
          isPhotoReview,
          isBookmarked,
          coordinate,
          phone,
          name,
          openingStatus,
          thumbnail,
          placeType,
          mostVisitedDiseaseType,
          totalReviews);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(PharmacyPreviewResponseDTO value) pharmacy,
    required TResult Function(HospitalPreviewResponseDTO value) hospital,
  }) {
    return hospital(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(PharmacyPreviewResponseDTO value)? pharmacy,
    TResult? Function(HospitalPreviewResponseDTO value)? hospital,
  }) {
    return hospital?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(PharmacyPreviewResponseDTO value)? pharmacy,
    TResult Function(HospitalPreviewResponseDTO value)? hospital,
    required TResult orElse(),
  }) {
    if (hospital != null) {
      return hospital(this);
    }
    return orElse();
  }

  @override
  Map<String, dynamic> toJson() {
    return _$$HospitalPreviewResponseDTOToJson(
      this,
    );
  }
}

abstract class HospitalPreviewResponseDTO implements PlacePreviewResponseDTO {
  const factory HospitalPreviewResponseDTO(
      {@JsonKey(name: '_id') required final String placeId,
      required final String address,
      @JsonKey(name: 'isPhotoReview') final bool isPhotoReview,
      required final bool isBookmarked,
      required final LatLngResponseDTO coordinate,
      required final String phone,
      required final String name,
      required final OpeningStatus openingStatus,
      final String thumbnail,
      @JsonKey(name: 'locType') required final PlaceType placeType,
      final DiseaseType mostVisitedDiseaseType,
      required final int totalReviews}) = _$HospitalPreviewResponseDTO;

  factory HospitalPreviewResponseDTO.fromJson(Map<String, dynamic> json) =
      _$HospitalPreviewResponseDTO.fromJson;

  @override
  @JsonKey(name: '_id')
  String get placeId;
  @override
  String get address;
  @override
  @JsonKey(name: 'isPhotoReview')
  bool get isPhotoReview;
  @override
  bool get isBookmarked;
  @override
  LatLngResponseDTO get coordinate;
  @override
  String get phone;
  @override
  String get name;
  @override
  OpeningStatus get openingStatus;
  @override
  String get thumbnail;
  @override
  @JsonKey(name: 'locType')
  PlaceType get placeType;
  @override // @JsonKey(name: 'nono')
  DiseaseType get mostVisitedDiseaseType;
  @override
  int get totalReviews;
  @override
  @JsonKey(ignore: true)
  _$$HospitalPreviewResponseDTOCopyWith<_$HospitalPreviewResponseDTO>
      get copyWith => throw _privateConstructorUsedError;
}
