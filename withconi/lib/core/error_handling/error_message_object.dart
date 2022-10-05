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
      noEmailUserFailure: () => const ErrorMessage(
          title: '이메일 로그인 no User error', message: '이메일로 등록된 유저를 찾을 수 없어요'),
      wrongPasswordFailure: () => const ErrorMessage(
          title: '이메일 wrong password 에러', message: '비밀번호가 맞지 않네요'),
      existingEmailFailure: () => const ErrorMessage(
        title: '이미 존재하는 이메일입니다',
        message: '이미 등록된 이메일이에요',
      ),
      userEnabledFailure: () => const ErrorMessage(
        title: ' 비활성화된 사용자',
        message: '비활성화된 사용자에요',
      ),
      weakPasswordFailure: () => const ErrorMessage(
        title: '비밀번호가 약해요',
        message: '비밀번호가 취약하네요',
      ),
      maxImageSizeFailure: () => const ErrorMessage(
        title: '이미지 사이즈 크기 에러',
        message: '이미지 사이즈가 너무 크네요',
      ),
      maxImageNumFailure: () => const ErrorMessage(
        title: '이미지 갯수 초과',
        message: '이미지는 4개까지만 추가 가능해요',
      ),
      noPostContentsFailure: () => const ErrorMessage(
        title: '글쓰기 post contents 오류',
        message: '글 내용을 입력해주세요',
      ),
      noPostTypeSelectedFailure: () => const ErrorMessage(
        title: '글쓰기 post Type 선택 오류',
        message: '관련된 코니멀을 선택해주세요',
      ),
      notEditablePasswordFailure: () => const ErrorMessage(
        title: 'sns로그인 비밀번호 변경 불가',
        message: 'SNS 로그인은 비밀번호를 바꿀 수 없어요',
      ),
      userInfoUpdateFailure: () => const ErrorMessage(
        title: '유저정보 업데이트 실패',
        message: '사용자 정보를 수정할 수 없었어요',
      ),
      permissionDeniedFailure: () => const ErrorMessage(
        title: '권한 거절 에러',
        message: '권한을 얻을 수 없어요',
      ),
      permissionPermanentlyDeniedFailure: () => const ErrorMessage(
        title: '권한 거절 에러',
        message: '권한을 얻을 수 없어요',
      ),
      notFoundPostFailure: () => const ErrorMessage(
        title: '게시물 not found error',
        message: '삭제된 게시물입니다',
      ),
    );
  }
}
