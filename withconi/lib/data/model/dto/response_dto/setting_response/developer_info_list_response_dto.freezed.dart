// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'developer_info_list_response_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

DeveloperInfoListResponseDTO _$DeveloperInfoListResponseDTOFromJson(
    Map<String, dynamic> json) {
  return _DeveloperInfoListResponseDTO.fromJson(json);
}

/// @nodoc
mixin _$DeveloperInfoListResponseDTO {
  DeveloperInfoResponseDTO get frontend => throw _privateConstructorUsedError;
  DeveloperInfoResponseDTO get backend => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $DeveloperInfoListResponseDTOCopyWith<DeveloperInfoListResponseDTO>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DeveloperInfoListResponseDTOCopyWith<$Res> {
  factory $DeveloperInfoListResponseDTOCopyWith(
          DeveloperInfoListResponseDTO value,
          $Res Function(DeveloperInfoListResponseDTO) then) =
      _$DeveloperInfoListResponseDTOCopyWithImpl<$Res,
          DeveloperInfoListResponseDTO>;
  @useResult
  $Res call(
      {DeveloperInfoResponseDTO frontend, DeveloperInfoResponseDTO backend});

  $DeveloperInfoResponseDTOCopyWith<$Res> get frontend;
  $DeveloperInfoResponseDTOCopyWith<$Res> get backend;
}

/// @nodoc
class _$DeveloperInfoListResponseDTOCopyWithImpl<$Res,
        $Val extends DeveloperInfoListResponseDTO>
    implements $DeveloperInfoListResponseDTOCopyWith<$Res> {
  _$DeveloperInfoListResponseDTOCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? frontend = null,
    Object? backend = null,
  }) {
    return _then(_value.copyWith(
      frontend: null == frontend
          ? _value.frontend
          : frontend // ignore: cast_nullable_to_non_nullable
              as DeveloperInfoResponseDTO,
      backend: null == backend
          ? _value.backend
          : backend // ignore: cast_nullable_to_non_nullable
              as DeveloperInfoResponseDTO,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $DeveloperInfoResponseDTOCopyWith<$Res> get frontend {
    return $DeveloperInfoResponseDTOCopyWith<$Res>(_value.frontend, (value) {
      return _then(_value.copyWith(frontend: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $DeveloperInfoResponseDTOCopyWith<$Res> get backend {
    return $DeveloperInfoResponseDTOCopyWith<$Res>(_value.backend, (value) {
      return _then(_value.copyWith(backend: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$_DeveloperInfoListResponseDTOCopyWith<$Res>
    implements $DeveloperInfoListResponseDTOCopyWith<$Res> {
  factory _$$_DeveloperInfoListResponseDTOCopyWith(
          _$_DeveloperInfoListResponseDTO value,
          $Res Function(_$_DeveloperInfoListResponseDTO) then) =
      __$$_DeveloperInfoListResponseDTOCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {DeveloperInfoResponseDTO frontend, DeveloperInfoResponseDTO backend});

  @override
  $DeveloperInfoResponseDTOCopyWith<$Res> get frontend;
  @override
  $DeveloperInfoResponseDTOCopyWith<$Res> get backend;
}

/// @nodoc
class __$$_DeveloperInfoListResponseDTOCopyWithImpl<$Res>
    extends _$DeveloperInfoListResponseDTOCopyWithImpl<$Res,
        _$_DeveloperInfoListResponseDTO>
    implements _$$_DeveloperInfoListResponseDTOCopyWith<$Res> {
  __$$_DeveloperInfoListResponseDTOCopyWithImpl(
      _$_DeveloperInfoListResponseDTO _value,
      $Res Function(_$_DeveloperInfoListResponseDTO) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? frontend = null,
    Object? backend = null,
  }) {
    return _then(_$_DeveloperInfoListResponseDTO(
      frontend: null == frontend
          ? _value.frontend
          : frontend // ignore: cast_nullable_to_non_nullable
              as DeveloperInfoResponseDTO,
      backend: null == backend
          ? _value.backend
          : backend // ignore: cast_nullable_to_non_nullable
              as DeveloperInfoResponseDTO,
    ));
  }
}

/// @nodoc

@JsonSerializable(explicitToJson: true)
class _$_DeveloperInfoListResponseDTO implements _DeveloperInfoListResponseDTO {
  _$_DeveloperInfoListResponseDTO(
      {required this.frontend, required this.backend});

  factory _$_DeveloperInfoListResponseDTO.fromJson(Map<String, dynamic> json) =>
      _$$_DeveloperInfoListResponseDTOFromJson(json);

  @override
  final DeveloperInfoResponseDTO frontend;
  @override
  final DeveloperInfoResponseDTO backend;

  @override
  String toString() {
    return 'DeveloperInfoListResponseDTO(frontend: $frontend, backend: $backend)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_DeveloperInfoListResponseDTO &&
            (identical(other.frontend, frontend) ||
                other.frontend == frontend) &&
            (identical(other.backend, backend) || other.backend == backend));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, frontend, backend);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_DeveloperInfoListResponseDTOCopyWith<_$_DeveloperInfoListResponseDTO>
      get copyWith => __$$_DeveloperInfoListResponseDTOCopyWithImpl<
          _$_DeveloperInfoListResponseDTO>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_DeveloperInfoListResponseDTOToJson(
      this,
    );
  }
}

abstract class _DeveloperInfoListResponseDTO
    implements DeveloperInfoListResponseDTO {
  factory _DeveloperInfoListResponseDTO(
          {required final DeveloperInfoResponseDTO frontend,
          required final DeveloperInfoResponseDTO backend}) =
      _$_DeveloperInfoListResponseDTO;

  factory _DeveloperInfoListResponseDTO.fromJson(Map<String, dynamic> json) =
      _$_DeveloperInfoListResponseDTO.fromJson;

  @override
  DeveloperInfoResponseDTO get frontend;
  @override
  DeveloperInfoResponseDTO get backend;
  @override
  @JsonKey(ignore: true)
  _$$_DeveloperInfoListResponseDTOCopyWith<_$_DeveloperInfoListResponseDTO>
      get copyWith => throw _privateConstructorUsedError;
}
