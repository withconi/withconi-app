import 'package:json_annotation/json_annotation.dart';

enum Gender {
  @JsonValue('female')
  female('female', '암컷'),
  @JsonValue("male")
  male('male', '수컷');

  const Gender(this.code, this.displayName);
  final String code;
  final String displayName;

  factory Gender.getByCode(String code) {
    return Gender.values.firstWhere((value) => value.code == code);
  }
}

enum PostType {
  @JsonValue('cat')
  cat('cat', '고양이'),
  @JsonValue("dog")
  dog('dog', '강아지'),
  @JsonValue("all")
  all('all', '모두'),
  undefined('undefined', '');

  const PostType(this.code, this.displayName);
  final String code;
  final String displayName;

  factory PostType.getByCode(String code) {
    return PostType.values.firstWhere((value) => value.code == code,
        orElse: () => PostType.undefined);
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
  @JsonValue('cat')
  cat('cat', '고양이'),
  @JsonValue("dog")
  dog('dog', '강아지'),
  @JsonValue("all")
  all('all', '모두'),
  undefined('undefined', '');

  const Species(this.code, this.displayName);
  final String code;
  final String displayName;

  factory Species.getByCode(String? code) {
    return Species.values.firstWhere((value) => value.code == code,
        orElse: () => Species.undefined);
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
  high('high', '높은의심'),
  @JsonValue("middle")
  middle('middle', '보통의심'),
  @JsonValue("low")
  low('low', '낮은의심'),
  undefined('undefined', '');

  const DiseasePosibility(this.code, this.displayName);
  final String code;
  final String displayName;

  factory DiseasePosibility.getByCode(String code) {
    return DiseasePosibility.values.firstWhere((value) => value.code == code,
        orElse: () => DiseasePosibility.undefined);
  }
}

enum ReviewRate {
  @JsonValue("low")
  low('low', '아쉬워요'),
  @JsonValue("middle")
  middle('middle', '적당해요'),
  @JsonValue("high")
  high('high', '추천해요');

  const ReviewRate(this.code, this.displayName);
  final String code;
  final String displayName;

  factory ReviewRate.getByCode(String code) {
    return ReviewRate.values.firstWhere(
      (value) => value.code == code,
    );
  }
}

enum MoreOption {
  edit('edit', '수정하기'),
  delete('delete', '삭제하기'),
  report('report', '신고하기'),
  block('block', '더이상 보지 않기'),
  undefined('undefined', '');

  const MoreOption(this.code, this.displayName);
  final String code;
  final String displayName;

  factory MoreOption.getByCode(String code) {
    return MoreOption.values.firstWhere((value) => value.code == code,
        orElse: () => MoreOption.undefined);
  }
}

enum ReviewItems {
  explanation('explanation', '설명'),
  kindness('kindness', '친절도'),
  price('price', '가격'),
  adequateExamination('adequate_examination', '검사의 적절성'),
  effectiveness('effectiveness', '효과'),
  waitingExperience('waiting_experience', '대기환경');

  const ReviewItems(this.code, this.displayName);
  final String code;
  final String displayName;

  factory ReviewItems.getByCode(String code) {
    return ReviewItems.values.firstWhere(
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
  all('all', '전체'),
  hospital('hospital', '병원'),
  pharmacy('pharmacy', '약국');

  const PlaceType(this.code, this.displayName);
  final String code;
  final String displayName;

  factory PlaceType.getByCode(String code) {
    return PlaceType.values
        .firstWhere((value) => value.code == code, orElse: () => PlaceType.all);
  }
}

enum DiseaseType {
  cardiovascular('cardiovascular', '심혈관'), //심혈관
  musculoskeletal('musculoskeletal', '근골격'), // 근골격
  digestive('digestive', '소화기/간담췌'), //소화기,간담췌
  ophthalmology('ophthalmology', '안과'), // 안과
  urinary('urinary', '비뇨/신장'), // 비뇨신장
  respiratory('respiratory', '호흡기'), // 호흡기
  //예전버전은 여기까지
  otorhinolaryngology('otorhinolaryngology', '이비인후'), // 이비인후
  infectiousDisease('infectiousDisease', '감염성'), //감염성
  brainNeurology('brainNeurology', '뇌/신경/정신'), // 뇌신경정신질환
  dentistry('dentistry', '치과'), //치과
  oncology('oncology', '암/종양혈액'), //암,종양혈액질환
  dermatology('dermatology', '피부과'), //피부과
  endocrinology('endocrinology', '대사/면역'), //내분비,호르몬
  emergency('emergency', '응급'), //응급
  all('all', '');

  const DiseaseType(this.code, this.displayName);
  final String code;
  final String displayName;

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
