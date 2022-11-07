// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'hospital_detail_response_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

HospitalDetailResponseDTO _$HospitalDetailResponseDTOFromJson(
    Map<String, dynamic> json) {
  return _HospitalDetailResponseDTO.fromJson(json);
}

/// @nodoc
mixin _$HospitalDetailResponseDTO {
  String get locId => throw _privateConstructorUsedError;
  String get address => throw _privateConstructorUsedError;
  bool get visitVerified => throw _privateConstructorUsedError;
  bool get isBookmarked => throw _privateConstructorUsedError;
  DiseaseHistoryGroupResponseDTO get diseaseHistoryGroup =>
      throw _privateConstructorUsedError;
  ReviewHistoryGroupResponseDTO get reviewHistoryGroup =>
      throw _privateConstructorUsedError;
  LatLngResponseDTO get coordinate => throw _privateConstructorUsedError;
  String get phone => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  OpeningStatus get openingStatus => throw _privateConstructorUsedError;
  String get thumbnail => throw _privateConstructorUsedError;
  PlaceType get placeType => throw _privateConstructorUsedError;
  int get totalVisitingCats => throw _privateConstructorUsedError;
  int get totalVisitingDogs => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $HospitalDetailResponseDTOCopyWith<HospitalDetailResponseDTO> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $HospitalDetailResponseDTOCopyWith<$Res> {
  factory $HospitalDetailResponseDTOCopyWith(HospitalDetailResponseDTO value,
          $Res Function(HospitalDetailResponseDTO) then) =
      _$HospitalDetailResponseDTOCopyWithImpl<$Res>;
  $Res call(
      {String locId,
      String address,
      bool visitVerified,
      bool isBookmarked,
      DiseaseHistoryGroupResponseDTO diseaseHistoryGroup,
      ReviewHistoryGroupResponseDTO reviewHistoryGroup,
      LatLngResponseDTO coordinate,
      String phone,
      String name,
      OpeningStatus openingStatus,
      String thumbnail,
      PlaceType placeType,
      int totalVisitingCats,
      int totalVisitingDogs});

  $DiseaseHistoryGroupResponseDTOCopyWith<$Res> get diseaseHistoryGroup;
  $ReviewHistoryGroupResponseDTOCopyWith<$Res> get reviewHistoryGroup;
  $LatLngResponseDTOCopyWith<$Res> get coordinate;
}

/// @nodoc
class _$HospitalDetailResponseDTOCopyWithImpl<$Res>
    implements $HospitalDetailResponseDTOCopyWith<$Res> {
  _$HospitalDetailResponseDTOCopyWithImpl(this._value, this._then);

  final HospitalDetailResponseDTO _value;
  // ignore: unused_field
  final $Res Function(HospitalDetailResponseDTO) _then;

  @override
  $Res call({
    Object? locId = freezed,
    Object? address = freezed,
    Object? visitVerified = freezed,
    Object? isBookmarked = freezed,
    Object? diseaseHistoryGroup = freezed,
    Object? reviewHistoryGroup = freezed,
    Object? coordinate = freezed,
    Object? phone = freezed,
    Object? name = freezed,
    Object? openingStatus = freezed,
    Object? thumbnail = freezed,
    Object? placeType = freezed,
    Object? totalVisitingCats = freezed,
    Object? totalVisitingDogs = freezed,
  }) {
    return _then(_value.copyWith(
      locId: locId == freezed
          ? _value.locId
          : locId // ignore: cast_nullable_to_non_nullable
              as String,
      address: address == freezed
          ? _value.address
          : address // ignore: cast_nullable_to_non_nullable
              as String,
      visitVerified: visitVerified == freezed
          ? _value.visitVerified
          : visitVerified // ignore: cast_nullable_to_non_nullable
              as bool,
      isBookmarked: isBookmarked == freezed
          ? _value.isBookmarked
          : isBookmarked // ignore: cast_nullable_to_non_nullable
              as bool,
      diseaseHistoryGroup: diseaseHistoryGroup == freezed
          ? _value.diseaseHistoryGroup
          : diseaseHistoryGroup // ignore: cast_nullable_to_non_nullable
              as DiseaseHistoryGroupResponseDTO,
      reviewHistoryGroup: reviewHistoryGroup == freezed
          ? _value.reviewHistoryGroup
          : reviewHistoryGroup // ignore: cast_nullable_to_non_nullable
              as ReviewHistoryGroupResponseDTO,
      coordinate: coordinate == freezed
          ? _value.coordinate
          : coordinate // ignore: cast_nullable_to_non_nullable
              as LatLngResponseDTO,
      phone: phone == freezed
          ? _value.phone
          : phone // ignore: cast_nullable_to_non_nullable
              as String,
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      openingStatus: openingStatus == freezed
          ? _value.openingStatus
          : openingStatus // ignore: cast_nullable_to_non_nullable
              as OpeningStatus,
      thumbnail: thumbnail == freezed
          ? _value.thumbnail
          : thumbnail // ignore: cast_nullable_to_non_nullable
              as String,
      placeType: placeType == freezed
          ? _value.placeType
          : placeType // ignore: cast_nullable_to_non_nullable
              as PlaceType,
      totalVisitingCats: totalVisitingCats == freezed
          ? _value.totalVisitingCats
          : totalVisitingCats // ignore: cast_nullable_to_non_nullable
              as int,
      totalVisitingDogs: totalVisitingDogs == freezed
          ? _value.totalVisitingDogs
          : totalVisitingDogs // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }

  @override
  $DiseaseHistoryGroupResponseDTOCopyWith<$Res> get diseaseHistoryGroup {
    return $DiseaseHistoryGroupResponseDTOCopyWith<$Res>(
        _value.diseaseHistoryGroup, (value) {
      return _then(_value.copyWith(diseaseHistoryGroup: value));
    });
  }

  @override
  $ReviewHistoryGroupResponseDTOCopyWith<$Res> get reviewHistoryGroup {
    return $ReviewHistoryGroupResponseDTOCopyWith<$Res>(
        _value.reviewHistoryGroup, (value) {
      return _then(_value.copyWith(reviewHistoryGroup: value));
    });
  }

  @override
  $LatLngResponseDTOCopyWith<$Res> get coordinate {
    return $LatLngResponseDTOCopyWith<$Res>(_value.coordinate, (value) {
      return _then(_value.copyWith(coordinate: value));
    });
  }
}

/// @nodoc
abstract class _$$_HospitalDetailResponseDTOCopyWith<$Res>
    implements $HospitalDetailResponseDTOCopyWith<$Res> {
  factory _$$_HospitalDetailResponseDTOCopyWith(
          _$_HospitalDetailResponseDTO value,
          $Res Function(_$_HospitalDetailResponseDTO) then) =
      __$$_HospitalDetailResponseDTOCopyWithImpl<$Res>;
  @override
  $Res call(
      {String locId,
      String address,
      bool visitVerified,
      bool isBookmarked,
      DiseaseHistoryGroupResponseDTO diseaseHistoryGroup,
      ReviewHistoryGroupResponseDTO reviewHistoryGroup,
      LatLngResponseDTO coordinate,
      String phone,
      String name,
      OpeningStatus openingStatus,
      String thumbnail,
      PlaceType placeType,
      int totalVisitingCats,
      int totalVisitingDogs});

  @override
  $DiseaseHistoryGroupResponseDTOCopyWith<$Res> get diseaseHistoryGroup;
  @override
  $ReviewHistoryGroupResponseDTOCopyWith<$Res> get reviewHistoryGroup;
  @override
  $LatLngResponseDTOCopyWith<$Res> get coordinate;
}

/// @nodoc
class __$$_HospitalDetailResponseDTOCopyWithImpl<$Res>
    extends _$HospitalDetailResponseDTOCopyWithImpl<$Res>
    implements _$$_HospitalDetailResponseDTOCopyWith<$Res> {
  __$$_HospitalDetailResponseDTOCopyWithImpl(
      _$_HospitalDetailResponseDTO _value,
      $Res Function(_$_HospitalDetailResponseDTO) _then)
      : super(_value, (v) => _then(v as _$_HospitalDetailResponseDTO));

  @override
  _$_HospitalDetailResponseDTO get _value =>
      super._value as _$_HospitalDetailResponseDTO;

  @override
  $Res call({
    Object? locId = freezed,
    Object? address = freezed,
    Object? visitVerified = freezed,
    Object? isBookmarked = freezed,
    Object? diseaseHistoryGroup = freezed,
    Object? reviewHistoryGroup = freezed,
    Object? coordinate = freezed,
    Object? phone = freezed,
    Object? name = freezed,
    Object? openingStatus = freezed,
    Object? thumbnail = freezed,
    Object? placeType = freezed,
    Object? totalVisitingCats = freezed,
    Object? totalVisitingDogs = freezed,
  }) {
    return _then(_$_HospitalDetailResponseDTO(
      locId: locId == freezed
          ? _value.locId
          : locId // ignore: cast_nullable_to_non_nullable
              as String,
      address: address == freezed
          ? _value.address
          : address // ignore: cast_nullable_to_non_nullable
              as String,
      visitVerified: visitVerified == freezed
          ? _value.visitVerified
          : visitVerified // ignore: cast_nullable_to_non_nullable
              as bool,
      isBookmarked: isBookmarked == freezed
          ? _value.isBookmarked
          : isBookmarked // ignore: cast_nullable_to_non_nullable
              as bool,
      diseaseHistoryGroup: diseaseHistoryGroup == freezed
          ? _value.diseaseHistoryGroup
          : diseaseHistoryGroup // ignore: cast_nullable_to_non_nullable
              as DiseaseHistoryGroupResponseDTO,
      reviewHistoryGroup: reviewHistoryGroup == freezed
          ? _value.reviewHistoryGroup
          : reviewHistoryGroup // ignore: cast_nullable_to_non_nullable
              as ReviewHistoryGroupResponseDTO,
      coordinate: coordinate == freezed
          ? _value.coordinate
          : coordinate // ignore: cast_nullable_to_non_nullable
              as LatLngResponseDTO,
      phone: phone == freezed
          ? _value.phone
          : phone // ignore: cast_nullable_to_non_nullable
              as String,
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      openingStatus: openingStatus == freezed
          ? _value.openingStatus
          : openingStatus // ignore: cast_nullable_to_non_nullable
              as OpeningStatus,
      thumbnail: thumbnail == freezed
          ? _value.thumbnail
          : thumbnail // ignore: cast_nullable_to_non_nullable
              as String,
      placeType: placeType == freezed
          ? _value.placeType
          : placeType // ignore: cast_nullable_to_non_nullable
              as PlaceType,
      totalVisitingCats: totalVisitingCats == freezed
          ? _value.totalVisitingCats
          : totalVisitingCats // ignore: cast_nullable_to_non_nullable
              as int,
      totalVisitingDogs: totalVisitingDogs == freezed
          ? _value.totalVisitingDogs
          : totalVisitingDogs // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

@JsonSerializable(explicitToJson: true)
class _$_HospitalDetailResponseDTO implements _HospitalDetailResponseDTO {
  _$_HospitalDetailResponseDTO(
      {required this.locId,
      required this.address,
      required this.visitVerified,
      required this.isBookmarked,
      required this.diseaseHistoryGroup,
      required this.reviewHistoryGroup,
      required this.coordinate,
      required this.phone,
      required this.name,
      required this.openingStatus,
      required this.thumbnail,
      required this.placeType,
      required this.totalVisitingCats,
      required this.totalVisitingDogs});

  factory _$_HospitalDetailResponseDTO.fromJson(Map<String, dynamic> json) =>
      _$$_HospitalDetailResponseDTOFromJson(json);

  @override
  final String locId;
  @override
  final String address;
  @override
  final bool visitVerified;
  @override
  final bool isBookmarked;
  @override
  final DiseaseHistoryGroupResponseDTO diseaseHistoryGroup;
  @override
  final ReviewHistoryGroupResponseDTO reviewHistoryGroup;
  @override
  final LatLngResponseDTO coordinate;
  @override
  final String phone;
  @override
  final String name;
  @override
  final OpeningStatus openingStatus;
  @override
  final String thumbnail;
  @override
  final PlaceType placeType;
  @override
  final int totalVisitingCats;
  @override
  final int totalVisitingDogs;

  @override
  String toString() {
    return 'HospitalDetailResponseDTO(locId: $locId, address: $address, visitVerified: $visitVerified, isBookmarked: $isBookmarked, diseaseHistoryGroup: $diseaseHistoryGroup, reviewHistoryGroup: $reviewHistoryGroup, coordinate: $coordinate, phone: $phone, name: $name, openingStatus: $openingStatus, thumbnail: $thumbnail, placeType: $placeType, totalVisitingCats: $totalVisitingCats, totalVisitingDogs: $totalVisitingDogs)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_HospitalDetailResponseDTO &&
            const DeepCollectionEquality().equals(other.locId, locId) &&
            const DeepCollectionEquality().equals(other.address, address) &&
            const DeepCollectionEquality()
                .equals(other.visitVerified, visitVerified) &&
            const DeepCollectionEquality()
                .equals(other.isBookmarked, isBookmarked) &&
            const DeepCollectionEquality()
                .equals(other.diseaseHistoryGroup, diseaseHistoryGroup) &&
            const DeepCollectionEquality()
                .equals(other.reviewHistoryGroup, reviewHistoryGroup) &&
            const DeepCollectionEquality()
                .equals(other.coordinate, coordinate) &&
            const DeepCollectionEquality().equals(other.phone, phone) &&
            const DeepCollectionEquality().equals(other.name, name) &&
            const DeepCollectionEquality()
                .equals(other.openingStatus, openingStatus) &&
            const DeepCollectionEquality().equals(other.thumbnail, thumbnail) &&
            const DeepCollectionEquality().equals(other.placeType, placeType) &&
            const DeepCollectionEquality()
                .equals(other.totalVisitingCats, totalVisitingCats) &&
            const DeepCollectionEquality()
                .equals(other.totalVisitingDogs, totalVisitingDogs));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(locId),
      const DeepCollectionEquality().hash(address),
      const DeepCollectionEquality().hash(visitVerified),
      const DeepCollectionEquality().hash(isBookmarked),
      const DeepCollectionEquality().hash(diseaseHistoryGroup),
      const DeepCollectionEquality().hash(reviewHistoryGroup),
      const DeepCollectionEquality().hash(coordinate),
      const DeepCollectionEquality().hash(phone),
      const DeepCollectionEquality().hash(name),
      const DeepCollectionEquality().hash(openingStatus),
      const DeepCollectionEquality().hash(thumbnail),
      const DeepCollectionEquality().hash(placeType),
      const DeepCollectionEquality().hash(totalVisitingCats),
      const DeepCollectionEquality().hash(totalVisitingDogs));

  @JsonKey(ignore: true)
  @override
  _$$_HospitalDetailResponseDTOCopyWith<_$_HospitalDetailResponseDTO>
      get copyWith => __$$_HospitalDetailResponseDTOCopyWithImpl<
          _$_HospitalDetailResponseDTO>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_HospitalDetailResponseDTOToJson(
      this,
    );
  }
}

abstract class _HospitalDetailResponseDTO implements HospitalDetailResponseDTO {
  factory _HospitalDetailResponseDTO(
      {required final String locId,
      required final String address,
      required final bool visitVerified,
      required final bool isBookmarked,
      required final DiseaseHistoryGroupResponseDTO diseaseHistoryGroup,
      required final ReviewHistoryGroupResponseDTO reviewHistoryGroup,
      required final LatLngResponseDTO coordinate,
      required final String phone,
      required final String name,
      required final OpeningStatus openingStatus,
      required final String thumbnail,
      required final PlaceType placeType,
      required final int totalVisitingCats,
      required final int totalVisitingDogs}) = _$_HospitalDetailResponseDTO;

  factory _HospitalDetailResponseDTO.fromJson(Map<String, dynamic> json) =
      _$_HospitalDetailResponseDTO.fromJson;

  @override
  String get locId;
  @override
  String get address;
  @override
  bool get visitVerified;
  @override
  bool get isBookmarked;
  @override
  DiseaseHistoryGroupResponseDTO get diseaseHistoryGroup;
  @override
  ReviewHistoryGroupResponseDTO get reviewHistoryGroup;
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
  PlaceType get placeType;
  @override
  int get totalVisitingCats;
  @override
  int get totalVisitingDogs;
  @override
  @JsonKey(ignore: true)
  _$$_HospitalDetailResponseDTOCopyWith<_$_HospitalDetailResponseDTO>
      get copyWith => throw _privateConstructorUsedError;
}
