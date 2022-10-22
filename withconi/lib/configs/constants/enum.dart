import 'package:json_annotation/json_annotation.dart';

enum Gender {
  @JsonValue("female")
  female,
  @JsonValue("male")
  male,
}

enum PostType {
  @JsonValue("cat")
  cat,
  @JsonValue("dog")
  dog,
  @JsonValue("all")
  all,
}

enum SortType {
  @JsonValue("recent")
  recent,
  @JsonValue("popular")
  popular,
  @JsonValue("nearest")
  nearest,
  @JsonValue("visiting")
  visiting,
}

enum Species {
  @JsonValue("cat")
  cat,
  @JsonValue("dog")
  dog,
  @JsonValue("all")
  all,
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

enum UserState {
  signInEmail,
  signInAuthCredential,
  signInToken,
  signUpEmail,
  signUpSns,
  none
}

enum UserState2 { signIn, signUp, none }

enum Provider {
  @JsonValue("kakao")
  kakao,
  @JsonValue("naver")
  naver,
  @JsonValue("google")
  google,
  @JsonValue("apple")
  apple,
  @JsonValue("email")
  email,
  @JsonValue("none")
  none,
}

enum PlaceType { all, hospital, pharmacy }

enum OpeningStatus { open, closed }

enum ReviewRate {
  @JsonValue("low")
  low,
  @JsonValue("middle")
  middle,
  @JsonValue("high")
  high
}

enum MoreOption { edit, delete, report, block }

String moreOptionsToKorean(
    {required MoreOption option, required String authorName}) {
  switch (option) {
    case MoreOption.block:
      return '$authorName의 글 더이상 보지 않기';
    case MoreOption.report:
      return '신고하기';
    case MoreOption.edit:
      return '수정하기';
    case MoreOption.delete:
      return '삭제하기';

    default:
      return '';
  }
}

enum ReviewItems {
  explanation,
  kindness,
  price,
  adequateExamination,
  effectiveness,
  waitingExperience,
}

enum ReportItem {
  animalCruelty,
  maliciousContents,
  wrongInformation,
  sexualContents,
  promotionalContents,
  ect,
}

String reportItemToKorean(ReportItem? reportItem) {
  switch (reportItem) {
    case ReportItem.animalCruelty:
      return "동물 학대 관련 글";
    case ReportItem.maliciousContents:
      return "잘못된 정보";
    case ReportItem.wrongInformation:
      return "악의적인 컨텐츠";
    case ReportItem.sexualContents:
      return "성적인 컨텐츠";
    case ReportItem.promotionalContents:
      return "영리목적/홍보성 글";
    case ReportItem.ect:
      return "기타";
    default:
      return "";
  }
}

String sortTypeToKorean(SortType? sortType) {
  switch (sortType) {
    case SortType.popular:
      return "인기순";
    case SortType.visiting:
      return "많이 찾은순";
    case SortType.nearest:
      return "거리순";
    case SortType.recent:
      return "최신순";
    default:
      return "";
  }
}

enum LocationType { mapLocation, currentLocation }

String locationTypeToKorean(LocationType? loctionType) {
  switch (loctionType) {
    case LocationType.mapLocation:
      return "현재 지도 기준";
    case LocationType.currentLocation:
      return "내위치 기준";

    default:
      return "";
  }
}

String postTypeToKorean(PostType? postType) {
  switch (postType) {
    case PostType.all:
      return "모두";
    case PostType.cat:
      return "고양이";
    case PostType.dog:
      return "강아지";
    default:
      return "";
  }
}

String postTypeToValue(PostType? postType) {
  switch (postType) {
    case PostType.all:
      return "all";
    case PostType.cat:
      return "cat";
    case PostType.dog:
      return "dog";
    default:
      return "";
  }
}

String sortTypeToValue(SortType? sortType) {
  switch (sortType) {
    case SortType.recent:
      return "recent";
    case SortType.popular:
      return "popular";
    default:
      return "";
  }
}

SortType koreanToSortType(String sortType) {
  switch (sortType) {
    case "최신순":
      return SortType.recent;
    case "인기순":
      return SortType.popular;
    default:
      return SortType.recent;
  }
}

String speciesToValue(Species? species) {
  switch (species) {
    case Species.cat:
      return 'cat';
    case Species.dog:
      return 'dog';
    default:
      return '';
  }
}

String speciesToKorean(Species? species) {
  switch (species) {
    case Species.cat:
      return '고양이';
    case Species.dog:
      return '강아지';
    default:
      return '';
  }
}

String providerToValue(Provider provider) {
  switch (provider) {
    case Provider.apple:
      return 'apple';
    case Provider.email:
      return 'email';
    case Provider.kakao:
      return 'kakao';
    case Provider.naver:
      return 'naver';
    case Provider.google:
      return 'google';
    default:
      return '';
  }
}

String placeTypeToValue(PlaceType? placeType) {
  switch (placeType) {
    case PlaceType.hospital:
      return 'hospital';
    case PlaceType.pharmacy:
      return 'pharmacy';

    default:
      return 'all';
  }
}

PlaceType placeTypeFromString(String? placeType) {
  switch (placeType) {
    case 'hospital':
      return PlaceType.hospital;
    case 'pharmacy':
      return PlaceType.pharmacy;
    default:
      return PlaceType.all;
  }
}

enum DiseaseType {
  cardiovascular, //심혈관
  musculoskeletal, // 근골격
  digestive, //소화기,간담췌
  ophthalmology, // 안과
  urinary, // 비뇨신장
  respiratory, // 호흡기

  //예전버전은 여기까지
  otorhinolaryngology, // 이비인후
  infectiousDisease, //감염성
  brainNeurology, // 뇌신경정신질환
  dentistry, //치과
  oncology, //암,종양혈액질환
  dermatology, //피부과
  endocrinology, //내분비,호르몬
  emergency, //응급

}

String diseaseTypeToValue(DiseaseType? diseaseType) {
  switch (diseaseType) {
    case DiseaseType.cardiovascular:
      return 'cardiovascular';
    case DiseaseType.musculoskeletal:
      return 'musculoskeletal';
    case DiseaseType.digestive:
      return 'digestive';
    case DiseaseType.ophthalmology:
      return 'ophthalmology';
    case DiseaseType.urinary:
      return 'urinary';
    case DiseaseType.respiratory:
      return 'respiratory';
    case DiseaseType.otorhinolaryngology:
      return 'otorhinolaryngology';
    case DiseaseType.infectiousDisease:
      return 'infectious_disease';
    case DiseaseType.brainNeurology:
      return 'brain_neurology';
    case DiseaseType.dentistry:
      return 'dentistry';
    case DiseaseType.oncology:
      return 'oncology';
    case DiseaseType.dermatology:
      return 'dermatology';
    case DiseaseType.endocrinology:
      return 'endocrinology';
    case DiseaseType.emergency:
      return 'emergency';
    default:
      return '';
  }
}

String diseaseTypeToKorean(DiseaseType? diseaseType) {
  switch (diseaseType) {
    case DiseaseType.cardiovascular:
      return '심혈관';
    case DiseaseType.musculoskeletal:
      return '근골격';
    case DiseaseType.digestive:
      return '소화기/간담췌';
    case DiseaseType.ophthalmology:
      return '안과';
    case DiseaseType.urinary:
      return '비뇨신장';
    case DiseaseType.respiratory:
      return '호흡기';

    case DiseaseType.otorhinolaryngology:
      return '이비인후';
    case DiseaseType.infectiousDisease:
      return '감염';
    case DiseaseType.brainNeurology:
      return '뇌/신경/정신';
    case DiseaseType.dentistry:
      return '치과';
    case DiseaseType.oncology:
      return '암/종양혈액';
    case DiseaseType.dermatology:
      return '피부';
    case DiseaseType.endocrinology:
      return '내분비/면역';
    case DiseaseType.emergency:
      return '응급';
    default:
      return '';
  }
}

DiseaseType diseaseTypeFromString(String? diseaseTypeString) {
  switch (diseaseTypeString) {
    case 'cardiovascular':
      return DiseaseType.cardiovascular;
    case 'musculoskeletal':
      return DiseaseType.musculoskeletal;
    case 'digestive':
      return DiseaseType.digestive;
    case 'ophthalmology':
      return DiseaseType.ophthalmology;
    case 'urinary':
      return DiseaseType.urinary;
    case 'respiratory':
      return DiseaseType.respiratory;

/*    case DiseaseType.otorhinolaryngology:
      return 'otorhinolaryngology';
    case DiseaseType.infectiousDisease:
      return 'infectious_disease';
    case DiseaseType.brainNeurology:
      return 'brain_neurology';
    case DiseaseType.dentistry:
      return 'dentistry';
    case DiseaseType.oncology:
      return 'oncology';
    case DiseaseType.dermatology:
      return 'dermatology';
    case DiseaseType.endocrinology:
      return 'endocrinology';
    case DiseaseType.emergency:
      return 'emergency'; */
    case 'otorhinolaryngology':
      return DiseaseType.otorhinolaryngology;
    case 'infectious_disease':
      return DiseaseType.infectiousDisease;
    case 'brain_neurology':
      return DiseaseType.brainNeurology;
    case 'dentistry':
      return DiseaseType.dentistry;
    case 'oncology':
      return DiseaseType.oncology;
    case 'dermatology':
      return DiseaseType.dermatology;
    case 'endocrinology':
      return DiseaseType.endocrinology;

    case 'emergency':
      return DiseaseType.emergency;

    default:
      return DiseaseType.urinary;
  }
}

String openingStatusToValue(OpeningStatus? openingStatus) {
  switch (openingStatus) {
    case OpeningStatus.open:
      return 'open';
    case OpeningStatus.closed:
      return 'all';
    default:
      return '';
  }
}

OpeningStatus openingStatusFromJson(String? openingStatus) {
  switch (openingStatus) {
    case 'open':
      return OpeningStatus.open;
    case 'all':
      return OpeningStatus.closed;
    default:
      return OpeningStatus.closed;
  }
}

String reviewRateToValue(ReviewRate? reviewStatus) {
  switch (reviewStatus) {
    case ReviewRate.low:
      return 'low';
    case ReviewRate.middle:
      return 'middle';
    case ReviewRate.high:
      return 'high';
    default:
      return '';
  }
}

ReviewRate reviewRateFromString(String reviewRateString) {
  switch (reviewRateString) {
    case 'low':
      return ReviewRate.low;
    case 'middle':
      return ReviewRate.middle;
    case 'high':
      return ReviewRate.high;
    default:
      return ReviewRate.middle;
  }
}

String reviewRateToKorean(ReviewRate? reviewStatus) {
  switch (reviewStatus) {
    case ReviewRate.low:
      return '아쉬워요';
    case ReviewRate.middle:
      return '적당해요';
    case ReviewRate.high:
      return '추천해요';
    default:
      return '';
  }
}

String reviewItemsToValue(ReviewItems? reviewItem) {
  switch (reviewItem) {
    case ReviewItems.explanation:
      return 'explanation';
    case ReviewItems.kindness:
      return 'kindness';
    case ReviewItems.adequateExamination:
      return 'adequate_examination';
    case ReviewItems.effectiveness:
      return 'effectiveness';
    case ReviewItems.waitingExperience:
      return 'waiting_experience';
    case ReviewItems.price:
      return 'price';
    default:
      return '';
  }
}

ReviewItems reviewItemsFromString(String itemString) {
  switch (itemString) {
    case 'explanation':
      return ReviewItems.explanation;
    case 'kindness':
      return ReviewItems.kindness;
    case 'adequateExamination':
      return ReviewItems.adequateExamination;
    case 'effectiveness':
      return ReviewItems.effectiveness;
    case 'waitingExperience':
      return ReviewItems.waitingExperience;
    case 'price':
      return ReviewItems.price;
    default:
      return ReviewItems.explanation;

    // case ReviewItems.kindness:
    //   return 'kindness';
    // case ReviewItems.adequateExamination:
    //   return 'adequate_examination';
    // case ReviewItems.effectiveness:
    //   return 'effectiveness';
    // case ReviewItems.waitingExperience:
    //   return 'waiting_experience';
    // case ReviewItems.price:
    //   return 'price';
    // default:
    //   return '';
  }
}
