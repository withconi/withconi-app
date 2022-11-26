import 'package:dartz/dartz.dart';
import 'package:withconi/core/network_handling/network_service.dart';
import 'package:withconi/core/tools/api_url.dart';
import 'package:withconi/data/model/dto/request_dto/abstract_request/request_info_abstract.dart';
import 'package:withconi/module/ui_model/user_ui_model.dart';
import '../../../../enums/enum.dart';
import '../abstract_request/request_dto_abstract.dart';

class UpdateUserInfoRequestDTO extends RequestConverter<
    UpdateUserInfoRequestDTO,
    Tuple2<UserUIModel, String?>> implements RequestDTO {
  final String email;
  final String displayName;
  final String nickname;
  final Provider provider;
  final bool isEmailVerified;
  final bool verificationSkipped;
  final String? photoURL;
  final bool isWrittenReview = false;

  @override
  bool get requiresToken => true;

  @override
  RequestType get requestType => RequestType.POST;

  @override
  String get url => HttpUrl.USER_UPDATE;

  UpdateUserInfoRequestDTO.fromData(
      {required UserUIModel data, String? photoRef})
      : email = data.email,
        displayName = data.diaplayName,
        nickname = data.nickname,
        provider = data.provider,
        isEmailVerified = data.isEmailVerified,
        verificationSkipped = data.verificationSkipped,
        photoURL = photoRef,
        super.fromData(Tuple2(data, photoRef));

  @override
  Map<String, dynamic> get dataMap {
    return {
      'email': email,
      'displayName': displayName,
      'nickname': nickname,
      'provider': provider.code,
      'isEmailVerified': isEmailVerified,
      'verificationSkipped': verificationSkipped,
      'profileImageRef': photoURL,
      'isWrittenReview': isWrittenReview,
    };
  }
}
