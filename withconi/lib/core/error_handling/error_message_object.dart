import 'package:equatable/equatable.dart';
import 'package:withconi/data/model/dto/response_dto/place_response/review_history_response_dto.dart';
import 'failures.dart';

class ErrorObject extends Equatable {
  const ErrorObject({
    required this.title,
    required this.message,
  });

  final String title;
  final String message;

  @override
  List<Object?> get props => [title, message];

  static ErrorObject mapFailureToErrorMessage({required Failure failure}) {
    return failure.when(
        versionCheckFailure: () => const ErrorObject(
              title: '버전 체크 에러',
              message: '앱 버전을 확인할 수 없어요',
            ),
        serverFailure: () => const ErrorObject(
              title: '인터넷 서버 에러',
              message: '정보를 불러올 수 없어요',
            ),
        dataParsingFailure: () => const ErrorObject(
              title: '데이터 파싱 에러',
              message: '해당 정보를 불러올 수 없어요',
            ),
        noConnectionFailure: () => const ErrorObject(
              title: '인터넷 연결 실패',
              message: '인터넷과 연결되어있지 않네요',
            ),
        wrongTokenFailure: () => const ErrorObject(
              title: '토큰 오류',
              message: '사용자를 인증할 수 없어요',
            ),
        maxConimalFailure: () => const ErrorObject(
              title: '등록된 코니멀이 3마리 이상',
              message: '최대 3마리까지만 등록 가능해요',
            ),
        maxDiseaseFailure: () => const ErrorObject(
              title: '등록된 질병이 3개 이상',
              message: '최대 3개의 질병까지만 등록 가능해요',
            ),
        noUserDataFailure: () => const ErrorObject(
              title: '사용자 정보 불러오기 실패',
              message: '정보를 불러오지 못했어요',
            ),
        emptyListFailure: () => const ErrorObject(
            title: '빈 리스트 접근 에러', message: '불러올 수 있는 정보가 없어요'),
        noSuchDataInListFailure: () => const ErrorObject(
            title: '해당 인덱스의 데이터가 없음', message: '정보를 불러올 수 없어요'),
        registerConimalFaiure: () =>
            const ErrorObject(title: '코니멀 등록 실패', message: '코니멀을 등록할 수 없어요'),
        removeConimalFailure: () =>
            const ErrorObject(title: '코니멀 삭제 실패', message: '코니멀을 삭제할 수 없어요'),
        getConimalListFailure: () => const ErrorObject(
            title: '코니멀 리스트 불러오기 실패', message: '코니멀 정보를 불러올 수 없어요'),
        signInCredentialFailure: () => const ErrorObject(
            title: 'credential 로그인 실패', message: '회원가입 정보를 불러올 수 없어요'),
        signInTokenFailure: () => const ErrorObject(
            title: 'token 로그인 실패', message: '회원가입 정보를 불러올 수 없어요'),
        naverSigninFailure: () => const ErrorObject(
            title: '네이버 로그인 실패', message: '네이버 정보를 불러올 수 없어요'),
        appleSigninFailure: () =>
            const ErrorObject(title: '애플 로그인 실패', message: '애플 정보를 불러올 수 없어요'),
        emailSigninFailure: () => const ErrorObject(
            title: '이메일 로그인 실패', message: '이메일 정보를 불러올 수 없어요'),
        getUserFailure: () => const ErrorObject(
            title: '유저 정보db에서 가져오기 실패', message: '정보를 불러올 수 없어요'),
        googleSigninFailure: () =>
            const ErrorObject(title: '구글 로그인 실패', message: '구글 정보를 불러올 수 없어요'),
        kakaoSigninFailure: () => const ErrorObject(
            title: '카카오 로그인 실패', message: '카카오 정보를 불러올 수 없어요'),
        notFoundFailure: () => const ErrorObject(
            title: '404 not found 에러', message: '사용자 정보를 불러올 수 없어요'),
        noEmailUserFailure: () => const ErrorObject(
            title: '이메일 로그인 no User error', message: '이메일로 등록된 유저를 찾을 수 없어요'),
        wrongPasswordFailure: () => const ErrorObject(
            title: '이메일 wrong password 에러', message: '비밀번호가 맞지 않네요'),
        existingEmailFailure: () => const ErrorObject(
              title: '이미 존재하는 이메일입니다',
              message: '이미 등록된 이메일이에요',
            ),
        userEnabledFailure: () => const ErrorObject(
              title: ' 비활성화된 사용자',
              message: '비활성화된 사용자에요',
            ),
        weakPasswordFailure: () => const ErrorObject(
              title: '비밀번호가 약해요',
              message: '비밀번호가 취약하네요',
            ),
        maxImageSizeFailure: () => const ErrorObject(
              title: '이미지 사이즈 크기 에러',
              message: '이미지 사이즈가 너무 크네요',
            ),
        maxImageNumFailure: () => const ErrorObject(
              title: '이미지 갯수 초과',
              message: '이미지는 4개까지만 추가 가능해요',
            ),
        noPostContentsFailure: () => const ErrorObject(
              title: '글쓰기 post contents 오류',
              message: '글 내용을 입력해주세요',
            ),
        noPostTypeSelectedFailure: () => const ErrorObject(
              title: '글쓰기 post Type 선택 오류',
              message: '관련된 코니멀을 선택해주세요',
            ),
        notEditablePasswordFailure: () => const ErrorObject(
              title: 'sns로그인 비밀번호 변경 불가',
              message: 'SNS 로그인은 비밀번호를 바꿀 수 없어요',
            ),
        userInfoUpdateFailure: () => const ErrorObject(
              title: '유저정보 업데이트 실패',
              message: '사용자 정보를 수정할 수 없었어요',
            ),
        permissionDeniedFailure: () => const ErrorObject(
              title: '권한 거절 에러',
              message: '권한을 얻을 수 없어요',
            ),
        permissionPermanentlyDeniedFailure: () => const ErrorObject(
              title: '권한 거절 에러',
              message: '권한을 얻을 수 없어요',
            ),
        notFoundPostFailure: () => const ErrorObject(
              title: '게시물 not found error',
              message: '삭제된 게시물입니다',
            ),
        sendVerificationEmailFailure: () =>
            const ErrorObject(title: '인증메일 전송 실패', message: '인증 메일 전송에 실패했습니다'),
        checkVerificationFailure: () =>
            const ErrorObject(title: '인증 검증 실패', message: '인증코드 검증에 실패했습니다'));
  }
}
