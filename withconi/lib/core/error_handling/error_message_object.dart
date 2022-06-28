import 'package:equatable/equatable.dart';
import 'failures.dart';

class ErrorMessage extends Equatable {
  const ErrorMessage({
    required this.title,
    required this.message,
  });

  final String title;
  final String message;

  @override
  List<Object?> get props => [title, message];

  static ErrorMessage mapFailureToErrorMessage({required Failure failure}) {
    return failure.when(
      serverFailure: () => const ErrorMessage(
        title: '인터넷 서버 에러',
        message: '정보를 불러올 수 없어요',
      ),
      dataParsingFailure: () => const ErrorMessage(
        title: '데이터 파싱 에러',
        message: '해당 정보를 불러올 수 없어요',
      ),
      noConnectionFailure: () => const ErrorMessage(
        title: '인터넷 연결 실패',
        message: '인터넷과 연결되어있지 않네요',
      ),
      maxConimalFailure: () => const ErrorMessage(
        title: '등록된 코니멀이 3마리 이상',
        message: '최대 3마리까지만 등록 가능해요',
      ),
      maxDiseaseFailure: () => const ErrorMessage(
        title: '등록된 질병이 4개 이상',
        message: '최대 4개의 질병까지만 등록 가능해요',
      ),
      noUserDataFailure: () => const ErrorMessage(
        title: '사용자 정보 불러오기 실패',
        message: '사용자 정보를 불러오지 못했어요',
      ),
      emptyListFailure: () =>
          const ErrorMessage(title: '빈 리스트 접근 에러', message: '불러올 수 있는 정보가 없어요'),
      noSuchDataInListFailure: () => const ErrorMessage(
          title: '해당 인덱스의 데이터가 없음', message: '정보를 불러올 수 없어요'),
      registerConimalFaiure: () =>
          const ErrorMessage(title: '코니멀 등록 실패', message: '코니멀을 등록할 수 없어요'),
      removeConimalFailure: () =>
          const ErrorMessage(title: '코니멀 삭제 실패', message: '코니멀을 삭제할 수 없어요'),
      getConimalListFailure: () => const ErrorMessage(
          title: '코니멀 리스트 불러오기 실패', message: '코니멀 정보를 불러올 수 없어요'),
      signInCredentialFailure: () => const ErrorMessage(
          title: 'credential 로그인 실패', message: '회원가입 정보를 불러올 수 없어요'),
      signInTokenFailure: () => const ErrorMessage(
          title: 'token 로그인 실패', message: '회원가입 정보를 불러올 수 없어요'),
      naverSigninFailure: () =>
          const ErrorMessage(title: '네이버 로그인 실패', message: '네이버 정보를 불러올 수 없어요'),
      appleSigninFailure: () =>
          const ErrorMessage(title: '애플 로그인 실패', message: '애플 정보를 불러올 수 없어요'),
      emailSigninFailure: () =>
          const ErrorMessage(title: '이메일 로그인 실패', message: '이메일 정보를 불러올 수 없어요'),
      getUserFailure: () => const ErrorMessage(
          title: '유저 정보db에서 가져오기 실패', message: '정보를 불러올 수 없어요'),
      googleSigninFailure: () =>
          const ErrorMessage(title: '구글 로그인 실패', message: '구글 정보를 불러올 수 없어요'),
      kakaoSigninFailure: () =>
          const ErrorMessage(title: '카카오 로그인 실패', message: '카카오 정보를 불러올 수 없어요'),
      notFoundFailure: () => const ErrorMessage(
          title: '404 not found 에러', message: '사용자 정보를 불러올 수 없어요'),
    );
  }
}
