import 'dart:io';
import 'dart:ui';

import 'package:image_picker/image_picker.dart';
import 'package:json_annotation/json_annotation.dart';

import '../../import_basic.dart';
import '../../module/theme/colors.dart';

enum Gender {
  @JsonValue('female')
  female('female', '암컷', WcColors.red100, WcColors.red20,
      'assets/icons/gender_female.svg'),
  @JsonValue("male")
  male('male', '수컷', WcColors.blue100, WcColors.blue20,
      'assets/icons/gender_male.svg');

  // @JsonValue("mail")
  // mail('male', '수컷', WcColors.blue100, WcColors.blue20,
  //     'assets/icons/gender_male.svg');

  const Gender(this.code, this.displayName, this.mainColor, this.backgoundColor,
      this.svgSrc);
  final String code;
  final String displayName;
  final Color mainColor;
  final Color backgoundColor;
  final String svgSrc;

  factory Gender.getByCode(String code) {
    return Gender.values.firstWhere((value) => value.code == code);
  }
}

enum PostType {
  @JsonValue("all")
  all('all', '모두', WcColors.green100, WcColors.green40),
  @JsonValue('cat')
  cat('cat', '고양이', WcColors.blue100, WcColors.blue60),
  @JsonValue("dog")
  dog('dog', '강아지', WcColors.orange100, WcColors.orange20);

  const PostType(
      this.code, this.displayName, this.textColor, this.backgroundColor);
  final String code;
  final String displayName;
  final Color textColor;
  final Color backgroundColor;

  factory PostType.getByCode(String code) {
    return PostType.values.firstWhere(
      (value) => value.code == code,
    );
  }
}

enum Sorting {
  // @JsonValue("recent")
  // recent('recent', '최신순'),
  // @JsonValue("popular")
  // popular('popular', '인기순'),
  @JsonValue("nearest")
  nearest('nearest', '거리순'),
  @JsonValue("visiting")
  visiting('visiting', '많이 찾은순');
  // undefined('undefined', '');

  const Sorting(this.code, this.displayName);
  final String code;
  final String displayName;

  factory Sorting.getByCode(String code) {
    return Sorting.values.firstWhere(
      (value) => value.code == code,
    );
  }
}

enum Species {
  @JsonValue("all")
  all(
    'all',
    '모두',
    WcColors.white,
    WcColors.white,
    '',
    WcColors.white,
  ),
  @JsonValue('cat')
  cat(
    'cat',
    '고양이',
    WcColors.blue100,
    WcColors.blue60,
    'assets/icons/cat_black.png',
    WcColors.blue80,
  ),
  @JsonValue("dog")
  dog('dog', '강아지', WcColors.orange100, WcColors.orange20,
      'assets/icons/dog.png', WcColors.green80);

  const Species(this.code, this.displayName, this.mainColor,
      this.backgroundColor, this.imageSrc, this.graphColor);
  final String code;
  final String displayName;
  final Color mainColor;
  final Color backgroundColor;
  final String imageSrc;
  final Color graphColor;

  factory Species.getByCode(String? code) {
    return Species.values.firstWhere(
      (value) => value.code == code,
    );
  }
}

enum Symptom {
  @JsonValue("action")
  action('action', '행동'),
  @JsonValue("bone")
  bone('bone', '근골격'),
  @JsonValue("eat")
  eat('eat', '섭취'),
  @JsonValue("eye")
  eye('eye', '안구'),
  @JsonValue("lung")
  lung('lung', '호흡기'),
  @JsonValue("mouth")
  mouth('mouth', '구강'),
  @JsonValue("nerve")
  nerve('nerve', '신경'),
  @JsonValue("stomach")
  stomach('stomach', '복부'),
  @JsonValue("stomach")
  skin('skin', '피부'),
  @JsonValue("urinary")
  urinary('urinary', '생식비뇨');

  const Symptom(this.code, this.displayName);
  final String code;
  final String displayName;

  factory Symptom.getByCode(String code) {
    return Symptom.values.firstWhere((value) => value.code == code);
  }
}

enum DiseasePosibility {
  @JsonValue("high")
  high('high', '높은의심', WcColors.red100),
  @JsonValue("middle")
  middle('middle', '보통의심', WcColors.orange100),
  @JsonValue("low")
  low('low', '낮은의심', WcColors.yellowLight),
  undefined('undefined', '', WcColors.white);

  const DiseasePosibility(this.code, this.displayName, this.mainColor);
  final String code;
  final String displayName;
  final Color mainColor;

  factory DiseasePosibility.getByCode(String code) {
    return DiseasePosibility.values.firstWhere((value) => value.code == code,
        orElse: () => DiseasePosibility.undefined);
  }
}

enum MoreBottomSheetOption {
  edit('edit', '수정하기', 'assets/icons/circle_edit.svg'),
  delete('delete', '삭제하기', 'assets/icons/circle_delete.svg'),
  report('report', '신고하기', 'assets/icons/circle_report.svg'),
  block('block', '더이상 보지 않기', 'assets/icons/circle_block.svg'),
  undefined('undefined', '', '');

  const MoreBottomSheetOption(this.code, this.displayName, this.svgSrc);
  final String code;
  final String displayName;
  final String svgSrc;

  factory MoreBottomSheetOption.getByCode(String code) {
    return MoreBottomSheetOption.values.firstWhere(
        (value) => value.code == code,
        orElse: () => MoreBottomSheetOption.undefined);
  }
}

enum ImagePickOption {
  camera(ImageSource.camera, 'camera', '카메라', 'assets/icons/camera.svg'),
  gallery(ImageSource.gallery, 'gallery', '갤러리', 'assets/icons/gallery.svg'),
  deleteAll(null, 'delete', '사진 삭제', 'assets/icons/remove_image.svg');

  const ImagePickOption(
      this.imageSource, this.code, this.displayName, this.svgSrc);
  final ImageSource? imageSource;
  final String code;
  final String displayName;
  final String svgSrc;

  factory ImagePickOption.getByCode(String code) {
    return ImagePickOption.values.firstWhere(
      (value) => value.code == code,
    );
  }
}

enum ReviewRate {
  @JsonValue("low")
  low(
      'low',
      '아쉬워요',
      '어떤 점이 아쉬우신가요?',
      WcColors.pink20,
      'assets/icons/bad_face.svg',
      'assets/icons/bad_face_inactive.svg',
      WcColors.pinkLight),
  @JsonValue("middle")
  middle(
      'middle',
      '적당해요',
      '어떤 점 때문에 적당하신가요?',
      WcColors.yellow20,
      'assets/icons/neutral_face.svg',
      'assets/icons/neutral_face_inactive.svg',
      WcColors.yellowLight),
  @JsonValue("high")
  high(
      'high',
      '추천해요',
      '어떤 점 때문에 추천하시나요?',
      WcColors.blue60,
      'assets/icons/good_face.svg',
      'assets/icons/good_face_inactive.svg',
      WcColors.blue80);

  const ReviewRate(
      this.code,
      this.displayName,
      this.question,
      this.activeBackgroundColor,
      this.activeIconSrc,
      this.inactiveIconSrc,
      this.mainColor);
  final String code;
  final String displayName;
  final String question;
  final String activeIconSrc;
  final String inactiveIconSrc;
  final Color mainColor;
  final Color activeBackgroundColor;
  final Color inactiveBackgroundColor = WcColors.grey20;

  factory ReviewRate.getByCode(String code) {
    return ReviewRate.values.firstWhere(
      (value) => value.code == code,
    );
  }
}

// extension ParseToString on ReviewItem {
//   String toShortString() {
//     return toString().split('.').last;
//   }

//   List<Re> get values => T.values;
// }

// enum ReviewItems {
//   low(),
//   middle(),
//   high();

//   const ReviewItems();
//   List items() {
//     return [];
//   }
// }

enum ReviewItem {
  @JsonValue("explanation")
  explanation(
      'explanation', '설명이 상세하지 않아요', '설명이 상세해요', '설명이 상세해요', ReviewRate.values),

  @JsonValue("kindness")
  kindness('kindness', '불친절해요', '친절해요', '친절해요', ReviewRate.values),

  @JsonValue("price")
  price('price', '진료 금액이 생각보다 비싸요', '진료금액이 적당해요', '진료금액이 합리적이에요',
      ReviewRate.values),

  @JsonValue("adequateExamination")
  adequateExamination('adequateExamination', '필요 이상의 진료를 해요', '필요한 진료만 해요',
      '필요한 진료만 해요', ReviewRate.values),

  @JsonValue("effectiveness")
  effectiveness('effectiveness', '진료 효과가 미비했어요', '진료가 꽤 효과적이에요', '진료가 효과적이에요',
      ReviewRate.values),

  @JsonValue("waitingExperience")
  waitingExperience('waitingExperience', '진료 대기 환경이 좋지 않아요', '진료 대기 환경이 괜찮았어요',
      '진료 대기 환경이 좋았어요', ReviewRate.values);

  const ReviewItem(this.itemCode, this._lowRateText, this._middleRateText,
      this._highRateText, this.itemReviewRateList);

  final String itemCode;

  final String _highRateText;
  final String _middleRateText;
  final String _lowRateText;
  final List<ReviewRate> itemReviewRateList;

  factory ReviewItem.getByCode(String code) {
    return ReviewItem.values.firstWhere(
      (value) => value.itemCode == code,
    );
  }
}

extension ReviewRateItems on ReviewRate {
  List<ReviewItem> get reviewItems => ReviewItem.values
      .where((element) => element.itemReviewRateList.contains(this))
      .toList();
}

extension ReviewItemDisplayText on ReviewItem {
  String displayText(ReviewRate reviewRate) {
    switch (reviewRate) {
      case ReviewRate.low:
        return _lowRateText;
      case ReviewRate.middle:
        return _middleRateText;
      case ReviewRate.high:
        return _highRateText;
      default:
        return '리뷰 항목을 표시할 수 없습니다';
    }
  }
}

// enum MiddleRateReviewItem implements ReviewItem<MiddleRateReviewItem> {
//   @JsonValue("explanation")
//   explanation('explanation', '설명이 상세해요'),

//   @JsonValue("kindness")
//   kindness('kindness', '친절해요'),

//   @JsonValue("price")
//   price('price', '진료 금액이 적당해요'),

//   @JsonValue("adequate_examination")
//   adequateExamination('adequate_examination', '필요한 진료만 해요'),

//   @JsonValue("effectiveness")
//   effectiveness('effectiveness', '진료가 꽤 효과적이에요'),

//   @JsonValue("waiting_experience")
//   waitingExperience('waiting_experience', '진료 대기 환경이 괜찮았어요');

//   const MiddleRateReviewItem(this.itemCode, this.displayText);
//   @override
//   final String itemCode;
//   @override
//   final String displayText;

//   factory MiddleRateReviewItem.getByCode(String code) {
//     return MiddleRateReviewItem.values.firstWhere(
//       (value) => value.itemCode == code,
//     );
//   }
// }

// // @jsonSerializable
// // @Json(enumValues: Category.values)
// enum HighRateReviewItem implements ReviewItem<HighRateReviewItem> {
//   @JsonValue("explanation")
//   explanation('explanation', '설명이 상세해요'),

//   @JsonValue("kindness")
//   kindness('kindness', '친절해요'),

//   @JsonValue("price")
//   price('price', '진료 금액이 적절해요'),

//   @JsonValue("adequate_examination")
//   adequateExamination('adequate_examination', '필요한 진료만 해요'),

//   @JsonValue("effectiveness")
//   effectiveness('effectiveness', '진료가 효과적이에요'),

//   @JsonValue("waiting_experience")
//   waitingExperience('waiting_experience', '진료 대기 환경이 좋았어요');

//   const HighRateReviewItem(this.itemCode, this.displayText);
//   @override
//   final String itemCode;
//   @override
//   final String displayText;

//   factory HighRateReviewItem.getByCode(String code) {
//     return HighRateReviewItem.values.firstWhere(
//       (value) => value.itemCode == code,
//     );
//   }
// }

enum ReportItem {
  animalCruelty('animalCruelty', "동물 학대 관련 글"),
  maliciousContents('maliciousContents', '악의적인 컨텐츠'),
  wrongInformation('wrongInformation', '잘못된 정보'),
  sexualContents('sexualContents', '성적인 컨텐츠'),
  promotionalContents('promotionalContents', '영리목적/홍보성 글'),
  ect('ect', '기타');

  const ReportItem(this.code, this.displayName);
  final String code;
  final String displayName;

  factory ReportItem.getByCode(String code) {
    return ReportItem.values.firstWhere(
      (value) => value.code == code,
    );
  }
}

enum Provider {
  @JsonValue("kakao")
  kakao("kakao", '카카오', SignMethod.sns, 'assets/icons/kakao.png',
      ['ios', 'android']),
  @JsonValue("naver")
  naver("naver", '네이버', SignMethod.sns, 'assets/icons/naver.png', []),
  @JsonValue("google")
  google("google", '구글', SignMethod.sns, 'assets/icons/google.png',
      ['ios', 'android']),
  @JsonValue("apple")
  apple("apple", '애플', SignMethod.sns, 'assets/icons/apple.png', ['ios']),
  @JsonValue("email")
  email("email", '이메일', SignMethod.email, 'assets/icons/email.png',
      ['ios', 'android']),
  // @JsonValue("password")
  // password("email", '이메일', SignMethod.email, 'assets/icons/email.png'),
  @JsonValue('undefined')
  undefined('undefined', '', SignMethod.undefined,
      'assets/icons/paw_icon_grey.png', []);
  // @JsonValue("none")
  // none("none", '');

  const Provider(this.code, this.displayName, this.signMethod, this.iconSrc,
      this.platform);
  final String code;
  final String displayName;
  final SignMethod signMethod;
  final String iconSrc;
  final List<String> platform;

  factory Provider.getByCode(String code) {
    if (code == 'password' || code == 'email') {
      return Provider.email;
    }
    return Provider.values.firstWhere((value) => value.code == code);
  }
}

// enum SignMethod { token, credential, pwd, undefined }

enum SignMethod { sns, email, undefined }

enum DistanceBaseType {
  mapLocation('mapLocation', '현재 지도 기준 거리'),
  currentLocation('currentLocation', '내 위치 기준 거리');

  const DistanceBaseType(this.code, this.displayName);
  final String code;
  final String displayName;

  factory DistanceBaseType.getByCode(String code) {
    return DistanceBaseType.values.firstWhere(
      (value) => value.code == code,
    );
  }
}

enum PlaceType {
  all('all', '전체', '', '', WcColors.blue100),
  hospital('hospital', '병원', "assets/icons/hospital_clicked.png",
      "assets/icons/hospital_unclicked.png", WcColors.blue100),
  pharmacy('pharmacy', '약국', "assets/icons/pharmacy_clicked.png",
      "assets/icons/pharmacy_unclicked.png", WcColors.orange100);

  const PlaceType(this.code, this.displayName, this.selectedImagePng,
      this.unselectedImagePng, this.mainColor);
  final String code;
  final String displayName;
  final String unselectedImagePng;
  final String selectedImagePng;
  final Color mainColor;

  factory PlaceType.getByCode(String code) {
    return PlaceType.values
        .firstWhere((value) => value.code == code, orElse: () => PlaceType.all);
  }
}

enum DiseaseType {
  all('all', '', WcColors.grey20),
  oncology('oncology', '암/종양혈액', Color.fromARGB(255, 0, 87, 193)), //암,종양혈액질환
  endocrinology('endocrinology', '대사/면역', WcColors.green100), //내분비,호르몬
  urinary('urinary', '비뇨/신장', WcColors.yellowLight), // 비뇨신장
  cardiovacular(
      'cardiovacular', '심혈관', Color.fromARGB(255, 255, 90, 173)), //심혈관
  digestive('digestive', '소화기/간담췌', WcColors.mintLight), //소화기,간담췌
  infectiousDisease('infectiousDisease', '감염성', WcColors.greenLight), //감염성
  musculoskeletal('musculoskeletal', '근골격', WcColors.grey160), // 근골격
  brainNeurology(
      'brainNeurology', '뇌/신경정신', Color.fromARGB(255, 12, 190, 255)), // 뇌신경정신질환
  dermatology('dermatology', '피부과', WcColors.beidgeLight), //피부과
  otorhinolaryngology(
      'otorhinolaryngology', '이비인후', WcColors.mustardLight), // 이비인후
  respiratory('respiratory', '호흡기', WcColors.purpleLight), // 호흡기
  dentistry('dentistry', '치과', WcColors.babyPinkLight), //치과
  ophthalmology('ophthalmology', '안과', Color.fromARGB(255, 0, 119, 231)), // 안과
  emergency('emergency', '응급', Color.fromARGB(255, 233, 27, 0)),
  @JsonValue("")
  undefined('undefined', '', WcColors.grey110); //응급

  const DiseaseType(this.code, this.displayName, this.color);
  final String code;
  final String displayName;
  final Color color;

  factory DiseaseType.getByCode(String code) {
    return DiseaseType.values.firstWhere((value) => value.code == code,
        orElse: () => DiseaseType.undefined);
  }
}

enum OpeningStatus {
  @JsonValue("open")
  open('open', '영업중'),
  @JsonValue(null)
  all('', '전체'),
  @JsonValue("closed")
  closed('closed', '영업종료');

  const OpeningStatus(this.code, this.displayName);
  final String code;
  final String displayName;

  factory OpeningStatus.getByCode(String code) {
    return OpeningStatus.values.firstWhere((value) => value.code == code,
        orElse: () => OpeningStatus.all);
  }
}

enum SigningState {
  signInEmail('로그인'),
  signUpEmail('회원가입'),
  signInSns('SNS 계정 로그인'),
  signUp('회원가입'),
  none('다음');
  // signInSns('SNS 계정으로 로그인');

  const SigningState(this.displayName);

  final String displayName;
}

enum CacheControllerKey {
  accessToken,
  refreshToken,
  provider,
  emailVerified,
  emailVerifySkipped,
  email,
  appleIdToken,
  rawNonce,
}
