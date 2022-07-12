import 'package:freezed_annotation/freezed_annotation.dart';
part 'failures.freezed.dart';

@freezed
class Failure with _$Failure {
  const Failure._(); // This constructor is needed to have custom methods in Freezed.
  const factory Failure.serverFailure() = ServerFailure;
  const factory Failure.dataParsingFailure() = DataParsingFailure;
  const factory Failure.noConnectionFailure() = NoConnectionFailure;
  const factory Failure.notFoundFailure() = NotFoundFailure;
  const factory Failure.noUserDataFailure() = NoUserDataFailure;
  const factory Failure.maxDiseaseFailure() = MaxDiseaseFailure;
  const factory Failure.maxConimalFailure() = MaxConimalFailure;
  const factory Failure.emptyListFailure() = EmptyListFailure;
  const factory Failure.noSuchDataInListFailure() = NoSuchDataInListFailure;
  const factory Failure.registerConimalFaiure() = RegisterConimalFailure;
  const factory Failure.removeConimalFailure() = RemoveConimalFailure;
  const factory Failure.getConimalListFailure() = GetConimalListFailure;
  const factory Failure.signInCredentialFailure() = SignInCredentialFailure;
  const factory Failure.signInTokenFailure() = SignInTokenFailure;
  const factory Failure.naverSigninFailure() = NaverSigninFailure;
  const factory Failure.kakaoSigninFailure() = KakaoSigninFailure;
  const factory Failure.googleSigninFailure() = GoogleSigninFailure;
  const factory Failure.appleSigninFailure() = AppleSigninFailure;
  const factory Failure.emailSigninFailure() = EmailSigninFailure;
  const factory Failure.getUserFailure() = GetUserInfoFailure;
  const factory Failure.wrongPasswordFailure() = WrongPasswordFailure;
  const factory Failure.noEmailUserFailure() = NoEmailUserFailure;
  const factory Failure.existingEmailFailure() = ExistingEmailFailure;
  const factory Failure.userEnabledFailure() = UserEnabledFailure;
  const factory Failure.weakPasswordFailure() = WeakPasswordFailure;
}
