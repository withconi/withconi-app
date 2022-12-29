import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:withconi/core/tools/helpers/url_launcher.dart';
import 'package:withconi/data/enums/enum.dart';
import 'package:withconi/data/repository/signup_repository.dart';

import '../../../core/error_handling/failure_ui_interpreter.dart';
import '../../../core/error_handling/failures.dart';
import '../../../core/signing_auth_info.dart';
import '../../../data/repository/image_repository.dart';
import '../../../global_widgets/loading/loading_overlay.dart';
import '../../../import_basic.dart';
import '../../auth/auth_controller.dart';
import '../../signup/signup_data_storage.dart';

class TermsAndConditionController extends GetxController {
  TermsAndConditionController(
      this._signUpDataManager, this._signupRepository, this._imageRepository);

  final SignUpDataStorage _signUpDataManager;
  final ImageRepository _imageRepository;
  final SignUpRepository _signupRepository;
  RxBool isButtonValid = false.obs;
  RxBool termsConfirmed = false.obs;
  RxBool privacyPolicyConfirmed = false.obs;
  String termsAndConditionText =
      '''본 이용약관(이하 “이용약관”)은 위드코니 앱 관련하여 본 이용약관의 적용을 받으며, 위드코니 앱에서 업로드 및 다운로드, 공유되는 모든 정보 및 텍스트, 사진, 기타 자료(이하 통칭 “콘텐츠”)에 대한 접근 및 이용에 관한 사항을 규정합니다. 본 이용약관에 동의하지 않는 경우 위드코니를 이용할 수 없습니다.\n\n< 위드코니 >('withconi.page.link'이하 '위드코니')은(는) 「개인정보 보호법」 제30조에 따라 정보주체의 개인정보를 보호하고 이와 관련한 고충을 신속하고 원활하게 처리할 수 있도록 하기 위하여 다음과 같이 개인정보 처리방침을 수립·공개합니다.

''';
  String privacyPolicyText =
      '''위드코니는 위드코니 서비스 관련하여 아래와 같이 최소한의 개인정보를 수집 및 이용합니다. 위드코니에서 수집한 개인정보는 정보통신망 이용촉진 및 정보보호 등에 관한 법률, 개인정보보호법 등 관계 법령에 따라 안전하게 관리됩니다.
      
○ 이 개인정보처리방침은 2022년 1월 1부터 적용됩니다.

제1조(개인정보의 처리 목적)

< 위드코니 >('withconi'이하 '위드코니')은(는) 다음의 목적을 위하여 개인정보를 처리합니다. 처리하고 있는 개인정보는 다음의 목적 이외의 용도로는 이용되지 않으며 이용 목적이 변경되는 경우에는 「개인정보 보호법」 제18조에 따라 별도의 동의를 받는 등 필요한 조치를 이행할 예정입니다.

1. 홈페이지 회원가입 및 관리

회원 가입의사 확인, 회원제 서비스 제공에 따른 본인 식별·인증, 회원자격 유지·관리, 서비스 부정이용 방지 목적으로 개인정보를 처리합니다.

2. 재화 또는 서비스 제공

콘텐츠 제공, 맞춤서비스 제공을 목적으로 개인정보를 처리합니다.


제2조(개인정보의 처리 및 보유 기간)

① < 위드코니 >은(는) 법령에 따른 개인정보 보유·이용기간 또는 정보주체로부터 개인정보를 수집 시에 동의받은 개인정보 보유·이용기간 내에서 개인정보를 처리·보유합니다.

② 각각의 개인정보 처리 및 보유 기간은 다음과 같습니다.

1.<홈페이지 회원가입 및 관리>
<홈페이지 회원가입 및 관리>와 관련한 개인정보는 수집.이용에 관한 동의일로부터<별도 요청 시 파기>까지 위 이용목적을 위하여 보유.이용됩니다.
보유근거 : 회원가입 및 로그인을 위한 중복검사를 위해 보유함

제3조(처리하는 개인정보의 항목)

① < 위드코니 >은(는) 다음의 개인정보 항목을 처리하고 있습니다.

< 홈페이지 회원가입 및 관리 >
필수항목 : 이메일, 비밀번호, 이름

      ''';

  @override
  void onInit() {
    super.onInit();
  }

  validateButton() {
    if (termsConfirmed.value && privacyPolicyConfirmed.value) {
      isButtonValid.value = true;
    } else {
      isButtonValid.value = false;
    }
    return isButtonValid.value;
  }

  onAllConfirmButtonTap(bool confirmed) {
    termsConfirmed.value = confirmed;
    privacyPolicyConfirmed.value = confirmed;
  }

  onTermsButtonTap(bool confirmed) {
    termsConfirmed.value = confirmed;
  }

  onPrivacyPolicyButtonTap(bool confirmed) {
    privacyPolicyConfirmed.value = confirmed;
  }

  Future<void> signUp() async {
    await showLoading(() async {
      User? newUser = await _signUpDataManager.signUpDataModel.signingAuthInfo!
          .map(
              tokenAuthInfo: (value) => signUpTokenAuthInfo(value),
              credentialAuthInfo: (value) => signUpCredentialAuthInfo(value),
              emailPwdAuthInfo: (value) => signUpEmailPwdAuthInfo(value));

      if (newUser != null) {
        await signUpDB(newUser);
      } else {
        return;
      }
    });
  }

  Future<User?> signUpCredentialAuthInfo(
      CredentialSigningAuthInfo authInfo) async {
    var signUpResult = await _signupRepository.signUpWithCredential(
        oAuthCredential: authInfo.oAuthCredential);

    if (signUpResult.isRight()) {
      return signUpResult.fold((l) => null, (user) => user);
    } else {
      return null;
    }
  }

  Future<User?> signUpEmailPwdAuthInfo(EmailPwdSigningAuthInfo authInfo) async {
    var signUpResult = await _signupRepository.signUpWithEmailPwd(
        email: authInfo.email, password: authInfo.password);

    if (signUpResult.isRight()) {
      return signUpResult.fold((l) => null, (user) => user);
    } else {
      return null;
    }
  }

  Future<User?> signUpTokenAuthInfo(TokenSigningAuthInfo tokenAuthInfo) async {
    var customTokenResult = await _signupRepository.createFirebaseCustomToken(
        platformToken: tokenAuthInfo.platformToken,
        provider: tokenAuthInfo.provider);

    if (customTokenResult.isRight()) {
      return customTokenResult.fold((l) => null, (r) async {
        Either<Failure, User?> _signUpResult = await _signupRepository
            .signUpWithFirebaseToken(firebaseToken: r.accessToken);
        return _signUpResult.fold((l) => null, (user) {
          return user;
        });
      });
    } else {
      return null;
    }
  }

  Future<void> signUpDB(firebaseUser) async {
    String? profileImageRef;
    if (_signUpDataManager.signUpDataModel.profileImage != null) {
      var uploadEither = await _imageRepository.uploadImageFile(
          imageItem: _signUpDataManager.signUpDataModel.profileImage!);

      profileImageRef = uploadEither.fold((l) => null, (imageRef) => imageRef);
    }

    Either<Failure, Map<String, dynamic>> dbUserEither =
        await _signupRepository.signUpUserDB(
            signUpData: _signUpDataManager.signUpDataModel,
            firebaseUid: firebaseUser.uid,
            profileUploadRef: profileImageRef);

    bool success = dbUserEither.fold((l) {
      FailureInterpreter().mapFailureToSnackbar(l, 'signUpDB');
      return false;
    }, (r) => true);
    // return success;

    if (success) {
      await AuthController.to.setUserAuthInfo();
      Get.offAllNamed(Routes.NAVIGATION);
    }
    return;
  }

  onTapTermsDetail() {
    UrlLauncher.launchLink(
        'https://withconi.notion.site/c48d1e719e2c410fa8cfde177fce5884');
  }

  onTapPrivacyPolicyDetail() {
    UrlLauncher.launchLink(
        'https://www.notion.so/withconi/5fcbf6913f374997b3e4d9ff24d1709d');
  }
}
