// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'place_detail_response_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

PlaceDetailResponseDTO _$PlaceDetailResponseDTOFromJson(
    Map<String, dynamic> json) {
  switch (json['runtimeType']) {
    case 'hospital':
      return HospitalPlaceDetailResponseDTO.fromJson(json);
    case 'pharmacy':
      return PharmacyPlaceDetailResponseDTO.fromJson(json);

    default:
      throw CheckedFromJsonException(
          json,
          'runtimeType',
          'PlaceDetailResponseDTO',
          'Invalid union type "${json['runtimeType']}"!');
  }
}

/// @nodoc
mixin _$PlaceDetailResponseDTO {
  @JsonKey(name: '_id')
  String get placeId => throw _privateConstructorUsedError;
  String get address => throw _privateConstructorUsedError;
  bool get isBookmarked => throw _privateConstructorUsedError;
  @JsonKey(name: 'diseaseHistory')
  DiseaseHistoryListResponseDTO get diseaseHistory =>
      throw _privateConstructorUsedError;
  @ReviewHistoryConverter()
  ReviewHistoryResponseDTO get reviewHistory =>
      throw _privateConstructorUsedError;
  @JsonKey(name: 'coordinate')
  LatLngResponseDTO? get coordinate => throw _privateConstructorUsedError;
  String get phone => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  OpeningStatus get openingStatus => throw _privateConstructorUsedError;
  String get thumbnail => throw _privateConstructorUsedError;
  @JsonKey(name: 'locType')
  PlaceType get placeType => throw _privateConstructorUsedError;
  int get totalVisitingCats => throw _privateConstructorUsedError;
  int get totalVisitingDogs => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            @JsonKey(name: '_id')
                String placeId,
            String address,
            bool isBookmarked,
            @JsonKey(name: 'diseaseHistory')
                DiseaseHistoryListResponseDTO diseaseHistory,
            @ReviewHistoryConverter()
                ReviewHistoryResponseDTO reviewHistory,
            @JsonKey(name: 'coordinate')
                LatLngResponseDTO? coordinate,
            String phone,
            String name,
            OpeningStatus openingStatus,
            String thumbnail,
            @JsonKey(name: 'locType')
                PlaceType placeType,
            int totalVisitingCats,
            int totalVisitingDogs)
        hospital,
    required TResult Function(
            @JsonKey(name: '_id')
                String placeId,
            String address,
            bool isBookmarked,
            @JsonKey(name: 'diseaseHistory')
                DiseaseHistoryListResponseDTO diseaseHistory,
            @ReviewHistoryConverter()
                ReviewHistoryResponseDTO reviewHistory,
            @JsonKey(name: 'coordinate')
                LatLngResponseDTO? coordinate,
            String phone,
            String name,
            OpeningStatus openingStatus,
            String thumbnail,
            @JsonKey(name: 'locType')
                PlaceType placeType,
            int totalVisitingCats,
            int totalVisitingDogs)
        pharmacy,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(
            @JsonKey(name: '_id')
                String placeId,
            String address,
            bool isBookmarked,
            @JsonKey(name: 'diseaseHistory')
                DiseaseHistoryListResponseDTO diseaseHistory,
            @ReviewHistoryConverter()
                ReviewHistoryResponseDTO reviewHistory,
            @JsonKey(name: 'coordinate')
                LatLngResponseDTO? coordinate,
            String phone,
            String name,
            OpeningStatus openingStatus,
            String thumbnail,
            @JsonKey(name: 'locType')
                PlaceType placeType,
            int totalVisitingCats,
            int totalVisitingDogs)?
        hospital,
    TResult? Function(
            @JsonKey(name: '_id')
                String placeId,
            String address,
            bool isBookmarked,
            @JsonKey(name: 'diseaseHistory')
                DiseaseHistoryListResponseDTO diseaseHistory,
            @ReviewHistoryConverter()
                ReviewHistoryResponseDTO reviewHistory,
            @JsonKey(name: 'coordinate')
                LatLngResponseDTO? coordinate,
            String phone,
            String name,
            OpeningStatus openingStatus,
            String thumbnail,
            @JsonKey(name: 'locType')
                PlaceType placeType,
            int totalVisitingCats,
            int totalVisitingDogs)?
        pharmacy,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(
            @JsonKey(name: '_id')
                String placeId,
            String address,
            bool isBookmarked,
            @JsonKey(name: 'diseaseHistory')
                DiseaseHistoryListResponseDTO diseaseHistory,
            @ReviewHistoryConverter()
                ReviewHistoryResponseDTO reviewHistory,
            @JsonKey(name: 'coordinate')
                LatLngResponseDTO? coordinate,
            String phone,
            String name,
            OpeningStatus openingStatus,
            String thumbnail,
            @JsonKey(name: 'locType')
                PlaceType placeType,
            int totalVisitingCats,
            int totalVisitingDogs)?
        hospital,
    TResult Function(
            @JsonKey(name: '_id')
                String placeId,
            String address,
            bool isBookmarked,
            @JsonKey(name: 'diseaseHistory')
                DiseaseHistoryListResponseDTO diseaseHistory,
            @ReviewHistoryConverter()
                ReviewHistoryResponseDTO reviewHistory,
            @JsonKey(name: 'coordinate')
                LatLngResponseDTO? coordinate,
            String phone,
            String name,
            OpeningStatus openingStatus,
            String thumbnail,
            @JsonKey(name: 'locType')
                PlaceType placeType,
            int totalVisitingCats,
            int totalVisitingDogs)?
        pharmacy,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(HospitalPlaceDetailResponseDTO value) hospital,
    required TResult Function(PharmacyPlaceDetailResponseDTO value) pharmacy,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(HospitalPlaceDetailResponseDTO value)? hospital,
    TResult? Function(PharmacyPlaceDetailResponseDTO value)? pharmacy,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(HospitalPlaceDetailResponseDTO value)? hospital,
    TResult Function(PharmacyPlaceDetailResponseDTO value)? pharmacy,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $PlaceDetailResponseDTOCopyWith<PlaceDetailResponseDTO> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PlaceDetailResponseDTOCopyWith<$Res> {
  factory $PlaceDetailResponseDTOCopyWith(PlaceDetailResponseDTO value,
          $Res Function(PlaceDetailResponseDTO) then) =
      _$PlaceDetailResponseDTOCopyWithImpl<$Res, PlaceDetailResponseDTO>;
  @useResult
  $Res call(
      {@JsonKey(name: '_id')
          String placeId,
      String address,
      bool isBookmarked,
      @JsonKey(name: 'diseaseHistory')
          DiseaseHistoryListResponseDTO diseaseHistory,
      @ReviewHistoryConverter()
          ReviewHistoryResponseDTO reviewHistory,
      @JsonKey(name: 'coordinate')
          LatLngResponseDTO? coordinate,
      String phone,
      String name,
      OpeningStatus openingStatus,
      String thumbnail,
      @JsonKey(name: 'locType')
          PlaceType placeType,
      int totalVisitingCats,
      int totalVisitingDogs});

  $DiseaseHistoryListResponseDTOCopyWith<$Res> get diseaseHistory;
  $ReviewHistoryResponseDTOCopyWith<$Res> get reviewHistory;
  $LatLngResponseDTOCopyWith<$Res>? get coordinate;
}

/// @nodoc
class _$PlaceDetailResponseDTOCopyWithImpl<$Res,
        $Val extends PlaceDetailResponseDTO>
    implements $PlaceDetailResponseDTOCopyWith<$Res> {
  _$PlaceDetailResponseDTOCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? placeId = null,
    Object? address = null,
    Object? isBookmarked = null,
    Object? diseaseHistory = null,
    Object? reviewHistory = null,
    Object? coordinate = freezed,
    Object? phone = null,
    Object? name = null,
    Object? openingStatus = null,
    Object? thumbnail = null,
    Object? placeType = null,
    Object? totalVisitingCats = null,
    Object? totalVisitingDogs = null,
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
      isBookmarked: null == isBookmarked
          ? _value.isBookmarked
          : isBookmarked // ignore: cast_nullable_to_non_nullable
              as bool,
      diseaseHistory: null == diseaseHistory
          ? _value.diseaseHistory
          : diseaseHistory // ignore: cast_nullable_to_non_nullable
              as DiseaseHistoryListResponseDTO,
      reviewHistory: null == reviewHistory
          ? _value.reviewHistory
          : reviewHistory // ignore: cast_nullable_to_non_nullable
              as ReviewHistoryResponseDTO,
      coordinate: freezed == coordinate
          ? _value.coordinate
          : coordinate // ignore: cast_nullable_to_non_nullable
              as LatLngResponseDTO?,
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
      totalVisitingCats: null == totalVisitingCats
          ? _value.totalVisitingCats
          : totalVisitingCats // ignore: cast_nullable_to_non_nullable
              as int,
      totalVisitingDogs: null == totalVisitingDogs
          ? _value.totalVisitingDogs
          : totalVisitingDogs // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $DiseaseHistoryListResponseDTOCopyWith<$Res> get diseaseHistory {
    return $DiseaseHistoryListResponseDTOCopyWith<$Res>(_value.diseaseHistory,
        (value) {
      return _then(_value.copyWith(diseaseHistory: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $ReviewHistoryResponseDTOCopyWith<$Res> get reviewHistory {
    return $ReviewHistoryResponseDTOCopyWith<$Res>(_value.reviewHistory,
        (value) {
      return _then(_value.copyWith(reviewHistory: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $LatLngResponseDTOCopyWith<$Res>? get coordinate {
    if (_value.coordinate == null) {
      return null;
    }

    return $LatLngResponseDTOCopyWith<$Res>(_value.coordinate!, (value) {
      return _then(_value.copyWith(coordinate: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$HospitalPlaceDetailResponseDTOCopyWith<$Res>
    implements $PlaceDetailResponseDTOCopyWith<$Res> {
  factory _$$HospitalPlaceDetailResponseDTOCopyWith(
          _$HospitalPlaceDetailResponseDTO value,
          $Res Function(_$HospitalPlaceDetailResponseDTO) then) =
      __$$HospitalPlaceDetailResponseDTOCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: '_id')
          String placeId,
      String address,
      bool isBookmarked,
      @JsonKey(name: 'diseaseHistory')
          DiseaseHistoryListResponseDTO diseaseHistory,
      @ReviewHistoryConverter()
          ReviewHistoryResponseDTO reviewHistory,
      @JsonKey(name: 'coordinate')
          LatLngResponseDTO? coordinate,
      String phone,
      String name,
      OpeningStatus openingStatus,
      String thumbnail,
      @JsonKey(name: 'locType')
          PlaceType placeType,
      int totalVisitingCats,
      int totalVisitingDogs});

  @override
  $DiseaseHistoryListResponseDTOCopyWith<$Res> get diseaseHistory;
  @override
  $ReviewHistoryResponseDTOCopyWith<$Res> get reviewHistory;
  @override
  $LatLngResponseDTOCopyWith<$Res>? get coordinate;
}

/// @nodoc
class __$$HospitalPlaceDetailResponseDTOCopyWithImpl<$Res>
    extends _$PlaceDetailResponseDTOCopyWithImpl<$Res,
        _$HospitalPlaceDetailResponseDTO>
    implements _$$HospitalPlaceDetailResponseDTOCopyWith<$Res> {
  __$$HospitalPlaceDetailResponseDTOCopyWithImpl(
      _$HospitalPlaceDetailResponseDTO _value,
      $Res Function(_$HospitalPlaceDetailResponseDTO) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? placeId = null,
    Object? address = null,
    Object? isBookmarked = null,
    Object? diseaseHistory = null,
    Object? reviewHistory = null,
    Object? coordinate = freezed,
    Object? phone = null,
    Object? name = null,
    Object? openingStatus = null,
    Object? thumbnail = null,
    Object? placeType = null,
    Object? totalVisitingCats = null,
    Object? totalVisitingDogs = null,
  }) {
    return _then(_$HospitalPlaceDetailResponseDTO(
      placeId: null == placeId
          ? _value.placeId
          : placeId // ignore: cast_nullable_to_non_nullable
              as String,
      address: null == address
          ? _value.address
          : address // ignore: cast_nullable_to_non_nullable
              as String,
      isBookmarked: null == isBookmarked
          ? _value.isBookmarked
          : isBookmarked // ignore: cast_nullable_to_non_nullable
              as bool,
      diseaseHistory: null == diseaseHistory
          ? _value.diseaseHistory
          : diseaseHistory // ignore: cast_nullable_to_non_nullable
              as DiseaseHistoryListResponseDTO,
      reviewHistory: null == reviewHistory
          ? _value.reviewHistory
          : reviewHistory // ignore: cast_nullable_to_non_nullable
              as ReviewHistoryResponseDTO,
      coordinate: freezed == coordinate
          ? _value.coordinate
          : coordinate // ignore: cast_nullable_to_non_nullable
              as LatLngResponseDTO?,
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
      totalVisitingCats: null == totalVisitingCats
          ? _value.totalVisitingCats
          : totalVisitingCats // ignore: cast_nullable_to_non_nullable
              as int,
      totalVisitingDogs: null == totalVisitingDogs
          ? _value.totalVisitingDogs
          : totalVisitingDogs // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

@JsonSerializable(explicitToJson: true)
class _$HospitalPlaceDetailResponseDTO
    implements HospitalPlaceDetailResponseDTO {
  const _$HospitalPlaceDetailResponseDTO(
      {@JsonKey(name: '_id') required this.placeId,
      required this.address,
      this.isBookmarked = false,
      @JsonKey(name: 'diseaseHistory') required this.diseaseHistory,
      @ReviewHistoryConverter() required this.reviewHistory,
      @JsonKey(name: 'coordinate') this.coordinate,
      required this.phone,
      required this.name,
      required this.openingStatus,
      this.thumbnail = '',
      @JsonKey(name: 'locType') required this.placeType,
      required this.totalVisitingCats,
      required this.totalVisitingDogs,
      final String? $type})
      : $type = $type ?? 'hospital';

  factory _$HospitalPlaceDetailResponseDTO.fromJson(
          Map<String, dynamic> json) =>
      _$$HospitalPlaceDetailResponseDTOFromJson(json);

  @override
  @JsonKey(name: '_id')
  final String placeId;
  @override
  final String address;
  @override
  @JsonKey()
  final bool isBookmarked;
  @override
  @JsonKey(name: 'diseaseHistory')
  final DiseaseHistoryListResponseDTO diseaseHistory;
  @override
  @ReviewHistoryConverter()
  final ReviewHistoryResponseDTO reviewHistory;
  @override
  @JsonKey(name: 'coordinate')
  final LatLngResponseDTO? coordinate;
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
  @override
  final int totalVisitingCats;
  @override
  final int totalVisitingDogs;

  @JsonKey(name: 'runtimeType')
  final String $type;

  @override
  String toString() {
    return 'PlaceDetailResponseDTO.hospital(placeId: $placeId, address: $address, isBookmarked: $isBookmarked, diseaseHistory: $diseaseHistory, reviewHistory: $reviewHistory, coordinate: $coordinate, phone: $phone, name: $name, openingStatus: $openingStatus, thumbnail: $thumbnail, placeType: $placeType, totalVisitingCats: $totalVisitingCats, totalVisitingDogs: $totalVisitingDogs)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$HospitalPlaceDetailResponseDTO &&
            (identical(other.placeId, placeId) || other.placeId == placeId) &&
            (identical(other.address, address) || other.address == address) &&
            (identical(other.isBookmarked, isBookmarked) ||
                other.isBookmarked == isBookmarked) &&
            (identical(other.diseaseHistory, diseaseHistory) ||
                other.diseaseHistory == diseaseHistory) &&
            (identical(other.reviewHistory, reviewHistory) ||
                other.reviewHistory == reviewHistory) &&
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
            (identical(other.totalVisitingCats, totalVisitingCats) ||
                other.totalVisitingCats == totalVisitingCats) &&
            (identical(other.totalVisitingDogs, totalVisitingDogs) ||
                other.totalVisitingDogs == totalVisitingDogs));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      placeId,
      address,
      isBookmarked,
      diseaseHistory,
      reviewHistory,
      coordinate,
      phone,
      name,
      openingStatus,
      thumbnail,
      placeType,
      totalVisitingCats,
      totalVisitingDogs);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$HospitalPlaceDetailResponseDTOCopyWith<_$HospitalPlaceDetailResponseDTO>
      get copyWith => __$$HospitalPlaceDetailResponseDTOCopyWithImpl<
          _$HospitalPlaceDetailResponseDTO>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            @JsonKey(name: '_id')
                String placeId,
            String address,
            bool isBookmarked,
            @JsonKey(name: 'diseaseHistory')
                DiseaseHistoryListResponseDTO diseaseHistory,
            @ReviewHistoryConverter()
                ReviewHistoryResponseDTO reviewHistory,
            @JsonKey(name: 'coordinate')
                LatLngResponseDTO? coordinate,
            String phone,
            String name,
            OpeningStatus openingStatus,
            String thumbnail,
            @JsonKey(name: 'locType')
                PlaceType placeType,
            int totalVisitingCats,
            int totalVisitingDogs)
        hospital,
    required TResult Function(
            @JsonKey(name: '_id')
                String placeId,
            String address,
            bool isBookmarked,
            @JsonKey(name: 'diseaseHistory')
                DiseaseHistoryListResponseDTO diseaseHistory,
            @ReviewHistoryConverter()
                ReviewHistoryResponseDTO reviewHistory,
            @JsonKey(name: 'coordinate')
                LatLngResponseDTO? coordinate,
            String phone,
            String name,
            OpeningStatus openingStatus,
            String thumbnail,
            @JsonKey(name: 'locType')
                PlaceType placeType,
            int totalVisitingCats,
            int totalVisitingDogs)
        pharmacy,
  }) {
    return hospital(
        placeId,
        address,
        isBookmarked,
        diseaseHistory,
        reviewHistory,
        coordinate,
        phone,
        name,
        openingStatus,
        thumbnail,
        placeType,
        totalVisitingCats,
        totalVisitingDogs);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(
            @JsonKey(name: '_id')
                String placeId,
            String address,
            bool isBookmarked,
            @JsonKey(name: 'diseaseHistory')
                DiseaseHistoryListResponseDTO diseaseHistory,
            @ReviewHistoryConverter()
                ReviewHistoryResponseDTO reviewHistory,
            @JsonKey(name: 'coordinate')
                LatLngResponseDTO? coordinate,
            String phone,
            String name,
            OpeningStatus openingStatus,
            String thumbnail,
            @JsonKey(name: 'locType')
                PlaceType placeType,
            int totalVisitingCats,
            int totalVisitingDogs)?
        hospital,
    TResult? Function(
            @JsonKey(name: '_id')
                String placeId,
            String address,
            bool isBookmarked,
            @JsonKey(name: 'diseaseHistory')
                DiseaseHistoryListResponseDTO diseaseHistory,
            @ReviewHistoryConverter()
                ReviewHistoryResponseDTO reviewHistory,
            @JsonKey(name: 'coordinate')
                LatLngResponseDTO? coordinate,
            String phone,
            String name,
            OpeningStatus openingStatus,
            String thumbnail,
            @JsonKey(name: 'locType')
                PlaceType placeType,
            int totalVisitingCats,
            int totalVisitingDogs)?
        pharmacy,
  }) {
    return hospital?.call(
        placeId,
        address,
        isBookmarked,
        diseaseHistory,
        reviewHistory,
        coordinate,
        phone,
        name,
        openingStatus,
        thumbnail,
        placeType,
        totalVisitingCats,
        totalVisitingDogs);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(
            @JsonKey(name: '_id')
                String placeId,
            String address,
            bool isBookmarked,
            @JsonKey(name: 'diseaseHistory')
                DiseaseHistoryListResponseDTO diseaseHistory,
            @ReviewHistoryConverter()
                ReviewHistoryResponseDTO reviewHistory,
            @JsonKey(name: 'coordinate')
                LatLngResponseDTO? coordinate,
            String phone,
            String name,
            OpeningStatus openingStatus,
            String thumbnail,
            @JsonKey(name: 'locType')
                PlaceType placeType,
            int totalVisitingCats,
            int totalVisitingDogs)?
        hospital,
    TResult Function(
            @JsonKey(name: '_id')
                String placeId,
            String address,
            bool isBookmarked,
            @JsonKey(name: 'diseaseHistory')
                DiseaseHistoryListResponseDTO diseaseHistory,
            @ReviewHistoryConverter()
                ReviewHistoryResponseDTO reviewHistory,
            @JsonKey(name: 'coordinate')
                LatLngResponseDTO? coordinate,
            String phone,
            String name,
            OpeningStatus openingStatus,
            String thumbnail,
            @JsonKey(name: 'locType')
                PlaceType placeType,
            int totalVisitingCats,
            int totalVisitingDogs)?
        pharmacy,
    required TResult orElse(),
  }) {
    if (hospital != null) {
      return hospital(
          placeId,
          address,
          isBookmarked,
          diseaseHistory,
          reviewHistory,
          coordinate,
          phone,
          name,
          openingStatus,
          thumbnail,
          placeType,
          totalVisitingCats,
          totalVisitingDogs);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(HospitalPlaceDetailResponseDTO value) hospital,
    required TResult Function(PharmacyPlaceDetailResponseDTO value) pharmacy,
  }) {
    return hospital(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(HospitalPlaceDetailResponseDTO value)? hospital,
    TResult? Function(PharmacyPlaceDetailResponseDTO value)? pharmacy,
  }) {
    return hospital?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(HospitalPlaceDetailResponseDTO value)? hospital,
    TResult Function(PharmacyPlaceDetailResponseDTO value)? pharmacy,
    required TResult orElse(),
  }) {
    if (hospital != null) {
      return hospital(this);
    }
    return orElse();
  }

  @override
  Map<String, dynamic> toJson() {
    return _$$HospitalPlaceDetailResponseDTOToJson(
      this,
    );
  }
}

abstract class HospitalPlaceDetailResponseDTO
    implements PlaceDetailResponseDTO {
  const factory HospitalPlaceDetailResponseDTO(
      {@JsonKey(name: '_id')
          required final String placeId,
      required final String address,
      final bool isBookmarked,
      @JsonKey(name: 'diseaseHistory')
          required final DiseaseHistoryListResponseDTO diseaseHistory,
      @ReviewHistoryConverter()
          required final ReviewHistoryResponseDTO reviewHistory,
      @JsonKey(name: 'coordinate')
          final LatLngResponseDTO? coordinate,
      required final String phone,
      required final String name,
      required final OpeningStatus openingStatus,
      final String thumbnail,
      @JsonKey(name: 'locType')
          required final PlaceType placeType,
      required final int totalVisitingCats,
      required final int totalVisitingDogs}) = _$HospitalPlaceDetailResponseDTO;

  factory HospitalPlaceDetailResponseDTO.fromJson(Map<String, dynamic> json) =
      _$HospitalPlaceDetailResponseDTO.fromJson;

  @override
  @JsonKey(name: '_id')
  String get placeId;
  @override
  String get address;
  @override
  bool get isBookmarked;
  @override
  @JsonKey(name: 'diseaseHistory')
  DiseaseHistoryListResponseDTO get diseaseHistory;
  @override
  @ReviewHistoryConverter()
  ReviewHistoryResponseDTO get reviewHistory;
  @override
  @JsonKey(name: 'coordinate')
  LatLngResponseDTO? get coordinate;
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
  @override
  int get totalVisitingCats;
  @override
  int get totalVisitingDogs;
  @override
  @JsonKey(ignore: true)
  _$$HospitalPlaceDetailResponseDTOCopyWith<_$HospitalPlaceDetailResponseDTO>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$PharmacyPlaceDetailResponseDTOCopyWith<$Res>
    implements $PlaceDetailResponseDTOCopyWith<$Res> {
  factory _$$PharmacyPlaceDetailResponseDTOCopyWith(
          _$PharmacyPlaceDetailResponseDTO value,
          $Res Function(_$PharmacyPlaceDetailResponseDTO) then) =
      __$$PharmacyPlaceDetailResponseDTOCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: '_id')
          String placeId,
      String address,
      bool isBookmarked,
      @JsonKey(name: 'diseaseHistory')
          DiseaseHistoryListResponseDTO diseaseHistory,
      @ReviewHistoryConverter()
          ReviewHistoryResponseDTO reviewHistory,
      @JsonKey(name: 'coordinate')
          LatLngResponseDTO? coordinate,
      String phone,
      String name,
      OpeningStatus openingStatus,
      String thumbnail,
      @JsonKey(name: 'locType')
          PlaceType placeType,
      int totalVisitingCats,
      int totalVisitingDogs});

  @override
  $DiseaseHistoryListResponseDTOCopyWith<$Res> get diseaseHistory;
  @override
  $ReviewHistoryResponseDTOCopyWith<$Res> get reviewHistory;
  @override
  $LatLngResponseDTOCopyWith<$Res>? get coordinate;
}

/// @nodoc
class __$$PharmacyPlaceDetailResponseDTOCopyWithImpl<$Res>
    extends _$PlaceDetailResponseDTOCopyWithImpl<$Res,
        _$PharmacyPlaceDetailResponseDTO>
    implements _$$PharmacyPlaceDetailResponseDTOCopyWith<$Res> {
  __$$PharmacyPlaceDetailResponseDTOCopyWithImpl(
      _$PharmacyPlaceDetailResponseDTO _value,
      $Res Function(_$PharmacyPlaceDetailResponseDTO) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? placeId = null,
    Object? address = null,
    Object? isBookmarked = null,
    Object? diseaseHistory = null,
    Object? reviewHistory = null,
    Object? coordinate = freezed,
    Object? phone = null,
    Object? name = null,
    Object? openingStatus = null,
    Object? thumbnail = null,
    Object? placeType = null,
    Object? totalVisitingCats = null,
    Object? totalVisitingDogs = null,
  }) {
    return _then(_$PharmacyPlaceDetailResponseDTO(
      placeId: null == placeId
          ? _value.placeId
          : placeId // ignore: cast_nullable_to_non_nullable
              as String,
      address: null == address
          ? _value.address
          : address // ignore: cast_nullable_to_non_nullable
              as String,
      isBookmarked: null == isBookmarked
          ? _value.isBookmarked
          : isBookmarked // ignore: cast_nullable_to_non_nullable
              as bool,
      diseaseHistory: null == diseaseHistory
          ? _value.diseaseHistory
          : diseaseHistory // ignore: cast_nullable_to_non_nullable
              as DiseaseHistoryListResponseDTO,
      reviewHistory: null == reviewHistory
          ? _value.reviewHistory
          : reviewHistory // ignore: cast_nullable_to_non_nullable
              as ReviewHistoryResponseDTO,
      coordinate: freezed == coordinate
          ? _value.coordinate
          : coordinate // ignore: cast_nullable_to_non_nullable
              as LatLngResponseDTO?,
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
      totalVisitingCats: null == totalVisitingCats
          ? _value.totalVisitingCats
          : totalVisitingCats // ignore: cast_nullable_to_non_nullable
              as int,
      totalVisitingDogs: null == totalVisitingDogs
          ? _value.totalVisitingDogs
          : totalVisitingDogs // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$PharmacyPlaceDetailResponseDTO
    implements PharmacyPlaceDetailResponseDTO {
  const _$PharmacyPlaceDetailResponseDTO(
      {@JsonKey(name: '_id') required this.placeId,
      required this.address,
      this.isBookmarked = false,
      @JsonKey(name: 'diseaseHistory') required this.diseaseHistory,
      @ReviewHistoryConverter() required this.reviewHistory,
      @JsonKey(name: 'coordinate') this.coordinate,
      required this.phone,
      required this.name,
      required this.openingStatus,
      this.thumbnail = '',
      @JsonKey(name: 'locType') required this.placeType,
      required this.totalVisitingCats,
      required this.totalVisitingDogs,
      final String? $type})
      : $type = $type ?? 'pharmacy';

  factory _$PharmacyPlaceDetailResponseDTO.fromJson(
          Map<String, dynamic> json) =>
      _$$PharmacyPlaceDetailResponseDTOFromJson(json);

  @override
  @JsonKey(name: '_id')
  final String placeId;
  @override
  final String address;
  @override
  @JsonKey()
  final bool isBookmarked;
  @override
  @JsonKey(name: 'diseaseHistory')
  final DiseaseHistoryListResponseDTO diseaseHistory;
  @override
  @ReviewHistoryConverter()
  final ReviewHistoryResponseDTO reviewHistory;
  @override
  @JsonKey(name: 'coordinate')
  final LatLngResponseDTO? coordinate;
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
  @override
  final int totalVisitingCats;
  @override
  final int totalVisitingDogs;

  @JsonKey(name: 'runtimeType')
  final String $type;

  @override
  String toString() {
    return 'PlaceDetailResponseDTO.pharmacy(placeId: $placeId, address: $address, isBookmarked: $isBookmarked, diseaseHistory: $diseaseHistory, reviewHistory: $reviewHistory, coordinate: $coordinate, phone: $phone, name: $name, openingStatus: $openingStatus, thumbnail: $thumbnail, placeType: $placeType, totalVisitingCats: $totalVisitingCats, totalVisitingDogs: $totalVisitingDogs)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PharmacyPlaceDetailResponseDTO &&
            (identical(other.placeId, placeId) || other.placeId == placeId) &&
            (identical(other.address, address) || other.address == address) &&
            (identical(other.isBookmarked, isBookmarked) ||
                other.isBookmarked == isBookmarked) &&
            (identical(other.diseaseHistory, diseaseHistory) ||
                other.diseaseHistory == diseaseHistory) &&
            (identical(other.reviewHistory, reviewHistory) ||
                other.reviewHistory == reviewHistory) &&
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
            (identical(other.totalVisitingCats, totalVisitingCats) ||
                other.totalVisitingCats == totalVisitingCats) &&
            (identical(other.totalVisitingDogs, totalVisitingDogs) ||
                other.totalVisitingDogs == totalVisitingDogs));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      placeId,
      address,
      isBookmarked,
      diseaseHistory,
      reviewHistory,
      coordinate,
      phone,
      name,
      openingStatus,
      thumbnail,
      placeType,
      totalVisitingCats,
      totalVisitingDogs);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$PharmacyPlaceDetailResponseDTOCopyWith<_$PharmacyPlaceDetailResponseDTO>
      get copyWith => __$$PharmacyPlaceDetailResponseDTOCopyWithImpl<
          _$PharmacyPlaceDetailResponseDTO>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            @JsonKey(name: '_id')
                String placeId,
            String address,
            bool isBookmarked,
            @JsonKey(name: 'diseaseHistory')
                DiseaseHistoryListResponseDTO diseaseHistory,
            @ReviewHistoryConverter()
                ReviewHistoryResponseDTO reviewHistory,
            @JsonKey(name: 'coordinate')
                LatLngResponseDTO? coordinate,
            String phone,
            String name,
            OpeningStatus openingStatus,
            String thumbnail,
            @JsonKey(name: 'locType')
                PlaceType placeType,
            int totalVisitingCats,
            int totalVisitingDogs)
        hospital,
    required TResult Function(
            @JsonKey(name: '_id')
                String placeId,
            String address,
            bool isBookmarked,
            @JsonKey(name: 'diseaseHistory')
                DiseaseHistoryListResponseDTO diseaseHistory,
            @ReviewHistoryConverter()
                ReviewHistoryResponseDTO reviewHistory,
            @JsonKey(name: 'coordinate')
                LatLngResponseDTO? coordinate,
            String phone,
            String name,
            OpeningStatus openingStatus,
            String thumbnail,
            @JsonKey(name: 'locType')
                PlaceType placeType,
            int totalVisitingCats,
            int totalVisitingDogs)
        pharmacy,
  }) {
    return pharmacy(
        placeId,
        address,
        isBookmarked,
        diseaseHistory,
        reviewHistory,
        coordinate,
        phone,
        name,
        openingStatus,
        thumbnail,
        placeType,
        totalVisitingCats,
        totalVisitingDogs);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(
            @JsonKey(name: '_id')
                String placeId,
            String address,
            bool isBookmarked,
            @JsonKey(name: 'diseaseHistory')
                DiseaseHistoryListResponseDTO diseaseHistory,
            @ReviewHistoryConverter()
                ReviewHistoryResponseDTO reviewHistory,
            @JsonKey(name: 'coordinate')
                LatLngResponseDTO? coordinate,
            String phone,
            String name,
            OpeningStatus openingStatus,
            String thumbnail,
            @JsonKey(name: 'locType')
                PlaceType placeType,
            int totalVisitingCats,
            int totalVisitingDogs)?
        hospital,
    TResult? Function(
            @JsonKey(name: '_id')
                String placeId,
            String address,
            bool isBookmarked,
            @JsonKey(name: 'diseaseHistory')
                DiseaseHistoryListResponseDTO diseaseHistory,
            @ReviewHistoryConverter()
                ReviewHistoryResponseDTO reviewHistory,
            @JsonKey(name: 'coordinate')
                LatLngResponseDTO? coordinate,
            String phone,
            String name,
            OpeningStatus openingStatus,
            String thumbnail,
            @JsonKey(name: 'locType')
                PlaceType placeType,
            int totalVisitingCats,
            int totalVisitingDogs)?
        pharmacy,
  }) {
    return pharmacy?.call(
        placeId,
        address,
        isBookmarked,
        diseaseHistory,
        reviewHistory,
        coordinate,
        phone,
        name,
        openingStatus,
        thumbnail,
        placeType,
        totalVisitingCats,
        totalVisitingDogs);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(
            @JsonKey(name: '_id')
                String placeId,
            String address,
            bool isBookmarked,
            @JsonKey(name: 'diseaseHistory')
                DiseaseHistoryListResponseDTO diseaseHistory,
            @ReviewHistoryConverter()
                ReviewHistoryResponseDTO reviewHistory,
            @JsonKey(name: 'coordinate')
                LatLngResponseDTO? coordinate,
            String phone,
            String name,
            OpeningStatus openingStatus,
            String thumbnail,
            @JsonKey(name: 'locType')
                PlaceType placeType,
            int totalVisitingCats,
            int totalVisitingDogs)?
        hospital,
    TResult Function(
            @JsonKey(name: '_id')
                String placeId,
            String address,
            bool isBookmarked,
            @JsonKey(name: 'diseaseHistory')
                DiseaseHistoryListResponseDTO diseaseHistory,
            @ReviewHistoryConverter()
                ReviewHistoryResponseDTO reviewHistory,
            @JsonKey(name: 'coordinate')
                LatLngResponseDTO? coordinate,
            String phone,
            String name,
            OpeningStatus openingStatus,
            String thumbnail,
            @JsonKey(name: 'locType')
                PlaceType placeType,
            int totalVisitingCats,
            int totalVisitingDogs)?
        pharmacy,
    required TResult orElse(),
  }) {
    if (pharmacy != null) {
      return pharmacy(
          placeId,
          address,
          isBookmarked,
          diseaseHistory,
          reviewHistory,
          coordinate,
          phone,
          name,
          openingStatus,
          thumbnail,
          placeType,
          totalVisitingCats,
          totalVisitingDogs);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(HospitalPlaceDetailResponseDTO value) hospital,
    required TResult Function(PharmacyPlaceDetailResponseDTO value) pharmacy,
  }) {
    return pharmacy(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(HospitalPlaceDetailResponseDTO value)? hospital,
    TResult? Function(PharmacyPlaceDetailResponseDTO value)? pharmacy,
  }) {
    return pharmacy?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(HospitalPlaceDetailResponseDTO value)? hospital,
    TResult Function(PharmacyPlaceDetailResponseDTO value)? pharmacy,
    required TResult orElse(),
  }) {
    if (pharmacy != null) {
      return pharmacy(this);
    }
    return orElse();
  }

  @override
  Map<String, dynamic> toJson() {
    return _$$PharmacyPlaceDetailResponseDTOToJson(
      this,
    );
  }
}

abstract class PharmacyPlaceDetailResponseDTO
    implements PlaceDetailResponseDTO {
  const factory PharmacyPlaceDetailResponseDTO(
      {@JsonKey(name: '_id')
          required final String placeId,
      required final String address,
      final bool isBookmarked,
      @JsonKey(name: 'diseaseHistory')
          required final DiseaseHistoryListResponseDTO diseaseHistory,
      @ReviewHistoryConverter()
          required final ReviewHistoryResponseDTO reviewHistory,
      @JsonKey(name: 'coordinate')
          final LatLngResponseDTO? coordinate,
      required final String phone,
      required final String name,
      required final OpeningStatus openingStatus,
      final String thumbnail,
      @JsonKey(name: 'locType')
          required final PlaceType placeType,
      required final int totalVisitingCats,
      required final int totalVisitingDogs}) = _$PharmacyPlaceDetailResponseDTO;

  factory PharmacyPlaceDetailResponseDTO.fromJson(Map<String, dynamic> json) =
      _$PharmacyPlaceDetailResponseDTO.fromJson;

  @override
  @JsonKey(name: '_id')
  String get placeId;
  @override
  String get address;
  @override
  bool get isBookmarked;
  @override
  @JsonKey(name: 'diseaseHistory')
  DiseaseHistoryListResponseDTO get diseaseHistory;
  @override
  @ReviewHistoryConverter()
  ReviewHistoryResponseDTO get reviewHistory;
  @override
  @JsonKey(name: 'coordinate')
  LatLngResponseDTO? get coordinate;
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
  @override
  int get totalVisitingCats;
  @override
  int get totalVisitingDogs;
  @override
  @JsonKey(ignore: true)
  _$$PharmacyPlaceDetailResponseDTOCopyWith<_$PharmacyPlaceDetailResponseDTO>
      get copyWith => throw _privateConstructorUsedError;
}
