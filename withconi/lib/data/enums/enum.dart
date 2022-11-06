import 'dart:ui';

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

enum SortType {
  @JsonValue("recent")
  recent('recent', '최신순'),
  @JsonValue("popular")
  popular('popular', '인기순'),
  @JsonValue("nearest")
  nearest('nearest', '거리순'),
  @JsonValue("visiting")
  visiting('visiting', '많이 찾은순'),
  undefined('undefined', '');

  const SortType(this.code, this.displayName);
  final String code;
  final String displayName;

  factory SortType.getByCode(String code) {
    return SortType.values.firstWhere((value) => value.code == code,
        orElse: () => SortType.undefined);
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
  ),
  @JsonValue('cat')
  cat(
    'cat',
    '고양이',
    WcColors.blue80,
    WcColors.blue60,
    'assets/icons/cat_black.png',
  ),
  @JsonValue("dog")
  dog(
    'dog',
    '강아지',
    WcColors.orange100,
    WcColors.orange20,
    'assets/icons/dog.png',
  );

  const Species(this.code, this.displayName, this.mainColor,
      this.backgroundColor, this.imageSrc);
  final String code;
  final String displayName;
  final Color mainColor;
  final Color backgroundColor;
  final String imageSrc;

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

enum MoreOption {
  edit('edit', '수정하기', 'assets/icons/circle_edit.svg'),
  delete('delete', '삭제하기', 'assets/icons/circle_delete.svg'),
  report('report', '신고하기', 'assets/icons/circle_report.svg'),
  block('block', '더이상 보지 않기', 'assets/icons/circle_block.svg'),
  undefined('undefined', '', '');

  const MoreOption(this.code, this.displayName, this.svgSrc);
  final String code;
  final String displayName;
  final String svgSrc;

  factory MoreOption.getByCode(String code) {
    return MoreOption.values.firstWhere((value) => value.code == code,
        orElse: () => MoreOption.undefined);
  }
}

enum ReviewRate {
  @JsonValue("low")
  low(
      'low',
      '아쉬워요',
      LowRateReviewItem.values,
      '어떤 점이 아쉬우신가요?',
      WcColors.pink20,
      'assets/icons/bad_face.svg',
      'assets/icons/bad_face_inactive.svg',
      WcColors.pinkLight),
  @JsonValue("middle")
  middle(
      'middle',
      '적당해요',
      MiddleRateReviewItem.values,
      '어떤 점 때문에 아쉬우신가요?',
      WcColors.yellow20,
      'assets/icons/neutral_face.svg',
      'assets/icons/neutral_face_inactive.svg',
      WcColors.yellowLight),
  @JsonValue("high")
  high(
      'high',
      '추천해요',
      HightRateReviewItem.values,
      '어떤 점 때문에 추천하시나요?',
      WcColors.blue60,
      'assets/icons/good_face.svg',
      'assets/icons/good_face_inactive.svg',
      WcColors.blue80);

  const ReviewRate(
      this.code,
      this.displayName,
      this.reviewItems,
      this.question,
      this.activeBackgroundColor,
      this.activeIconSrc,
      this.inactiveIconSrc,
      this.mainColor);
  final String code;
  final String displayName;
  final List<ReviewItem> reviewItems;
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

abstract class ReviewItem {}

enum LowRateReviewItem implements ReviewItem {
  explanation('explanation', '설명이 상세하지 않아요'),
  kindness('kindness', '불친절해요'),
  price('price', '진료 금액이 생각보다 비싸요'),
  adequateExamination('adequate_examination', '필요 이상의 진료를 해요'),
  effectiveness('effectiveness', '진료 효과가 미비했어요'),
  waitingExperience('waiting_experience', '진료 대기 환경이 좋지 않아요');

  const LowRateReviewItem(this.code, this.displayText);
  final String code;
  final String displayText;

  factory LowRateReviewItem.getByCode(String code) {
    return LowRateReviewItem.values.firstWhere(
      (value) => value.code == code,
    );
  }
}

enum MiddleRateReviewItem implements ReviewItem {
  explanation('explanation', '설명이 상세해요'),
  kindness('kindness', '친절해요'),
  price('price', '진료 금액이 적당해요'),
  adequateExamination('adequate_examination', '필요한 진료만 해요'),
  effectiveness('effectiveness', '진료가 꽤 효과적이에요'),
  waitingExperience('waiting_experience', '진료 대기 환경이 괜찮았어요');

  const MiddleRateReviewItem(this.code, this.displayText);
  final String code;
  final String displayText;

  factory MiddleRateReviewItem.getByCode(String code) {
    return MiddleRateReviewItem.values.firstWhere(
      (value) => value.code == code,
    );
  }
}

enum HightRateReviewItem implements ReviewItem {
  explanation('explanation', '설명이 상세해요'),
  kindness('kindness', '친절해요'),
  price('price', '진료 금액이 적절해요'),
  adequateExamination('adequate_examination', '필요한 진료만 해요'),
  effectiveness('effectiveness', '진료가 효과적이에요'),
  waitingExperience('waiting_experience', '진료 대기 환경이 좋았어요');

  const HightRateReviewItem(this.code, this.displayText);
  final String code;
  final String displayText;

  factory HightRateReviewItem.getByCode(String code) {
    return HightRateReviewItem.values.firstWhere(
      (value) => value.code == code,
    );
  }
}

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
  kakao("kakao", '카카오'),
  @JsonValue("naver")
  naver("naver", '네이버'),
  @JsonValue("google")
  google("google", '구글'),
  @JsonValue("apple")
  apple("apple", '애플'),
  @JsonValue("email")
  email("email", '이메일'),
  @JsonValue("none")
  none("none", '');

  const Provider(this.code, this.displayName);
  final String code;
  final String displayName;

  factory Provider.getByCode(String code) {
    return Provider.values
        .firstWhere((value) => value.code == code, orElse: () => Provider.none);
  }
}

enum LocationType {
  mapLocation('mapLocation', '현재 지도 기준'),
  currentLocation('currentLocation', '내 위치 기준');

  const LocationType(this.code, this.displayName);
  final String code;
  final String displayName;

  factory LocationType.getByCode(String code) {
    return LocationType.values.firstWhere(
      (value) => value.code == code,
    );
  }
}

enum PlaceType {
  all('all', '전체', '', ''),
  hospital('hospital', '병원', "assets/icons/hospital_clicked.png",
      "assets/icons/hospital_unclicked.png"),
  pharmacy('pharmacy', '약국', "assets/icons/pharmacy_clicked.png",
      "assets/icons/pharmacy_unclicked.png");

  const PlaceType(this.code, this.displayName, this.selectedImagePng,
      this.unselectedImagePng);
  final String code;
  final String displayName;
  final String unselectedImagePng;
  final String selectedImagePng;

  factory PlaceType.getByCode(String code) {
    return PlaceType.values
        .firstWhere((value) => value.code == code, orElse: () => PlaceType.all);
  }
}

enum DiseaseType {
  all('all', '', WcColors.grey20),
  cardiovascular('cardiovascular', '심혈관', WcColors.pinkLight), //심혈관
  musculoskeletal('musculoskeletal', '근골격', WcColors.grey160), // 근골격
  digestive('digestive', '소화기/간담췌', WcColors.mintLight), //소화기,간담췌
  ophthalmology('ophthalmology', '안과', WcColors.blue100), // 안과
  urinary('urinary', '비뇨/신장', WcColors.yellowLight), // 비뇨신장
  respiratory('respiratory', '호흡기', WcColors.purpleLight), // 호흡기
  //예전버전은 여기까지
  otorhinolaryngology(
      'otorhinolaryngology', '이비인후', WcColors.mustardLight), // 이비인후
  infectiousDisease('infectiousDisease', '감염성', WcColors.grey110), //감염성
  brainNeurology('brainNeurology', '뇌/신경/정신', WcColors.orange100), // 뇌신경정신질환
  dentistry('dentistry', '치과', WcColors.babyPinkLight), //치과
  oncology('oncology', '암/종양혈액', Color.fromARGB(255, 0, 67, 149)), //암,종양혈액질환
  dermatology('dermatology', '피부과', WcColors.beidgeLight), //피부과
  endocrinology('endocrinology', '대사/면역', WcColors.green100), //내분비,호르몬
  emergency('emergency', '응급', WcColors.red100); //응급

  const DiseaseType(this.code, this.displayName, this.color);
  final String code;
  final String displayName;
  final Color color;

  factory DiseaseType.getByCode(String code) {
    return DiseaseType.values.firstWhere((value) => value.code == code,
        orElse: () => DiseaseType.all);
  }
}

enum OpeningStatus {
  open('open', '영업중'),
  all('all', '전체'),
  closed('closed', '영업종료');

  const OpeningStatus(this.code, this.displayName);
  final String code;
  final String displayName;

  factory OpeningStatus.getByCode(String code) {
    return OpeningStatus.values.firstWhere((value) => value.code == code,
        orElse: () => OpeningStatus.all);
  }
}

enum UserState { signIn, signUp, none }

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
