import 'package:dartz/dartz.dart';
import 'package:withconi/data/model/dto/request_dto/abstract_request/request_dto_abstract.dart';
import 'package:withconi/data/model/dto/request_dto/abstract_request/request_info_abstract.dart';
import 'package:withconi/data/model/dto/request_dto/conimal_request/create_conimal_request_dto.dart';
import 'package:withconi/module/ui_model/signup_user_ui_model.dart';
import '../../../../../core/network_handling/network_service.dart';
import '../../../../../core/tools/api_url.dart';
import '../../../../enums/enum.dart';

class CreateSignUpDBRequestDTO extends RequestConverter<
    CreateSignUpDBRequestDTO,
    Tuple3<SignUpDataModel, String, String?>> implements RequestDTO {
  final String uid;
  final String email;
  final String displayName;
  final String nickname;
  final Provider provider;
  final bool isEmailVerified;
  final bool verificationSkipped;
  final String? photoURL;
  final bool isWrittenReview = false;
  final List<CreateConimalRequestDTO> conimals;

  @override
  bool get requiresToken => false;

  @override
  RequestType get requestType => RequestType.POST;

  @override
  String get url => HttpUrl.SIGN_UP;

  CreateSignUpDBRequestDTO.fromData(
      {required SignUpDataModel data,
      required String firebaseUid,
      String? photoRef})
      : uid = firebaseUid,
        email = data.email,
        displayName = data.name,
        nickname = data.nickname,
        provider = data.signingAuthInfo!.map(
          tokenAuthInfo: (value) => value.provider,
          credentialAuthInfo: (value) => value.provider,
          emailPwdAuthInfo: (value) => value.provider,
        ),
        isEmailVerified = data.isEmailVerified,
        verificationSkipped = data.verificationSkipped,
        photoURL = photoRef,
        conimals = data.conimals
            .map((e) => CreateConimalRequestDTO.fromData(data: e))
            .toList(),
        super.fromData(Tuple3(data, firebaseUid, photoRef));

  @override
  Map<String, dynamic> get dataMap {
    return {
      'uid': uid,
      'email': email,
      'displayName': displayName,
      'nickname': nickname,
      'provider': provider.code,
      'isEmailVerified': isEmailVerified,
      'verificationSkipped': verificationSkipped,
      'profileImageRef': photoURL,
      'isWrittenReview': isWrittenReview,
      'conimals': conimals.map((e) => e.dataMap).toList()
    };
  }
}
