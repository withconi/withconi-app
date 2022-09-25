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
  provide,
  emailVerified,
  emailVerifySkipped
}

enum UserState {
  signInEmail,
  signInAuthCredential,
  signInToken,
  signUpEmail,
  signUpSns,
  none
}

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

enum DiseaseType {
  cardiovascular,
  musculoskeletal,
  digestive,
  ophthalmology,
  urinary,
  respiratory,
}

enum OpeningStatus { open, all }

enum ReviewRate {
  @JsonValue("low")
  low,
  @JsonValue("middle")
  middle,
  @JsonValue("high")
  high
}

enum ReviewItems {
  explanation,
  kindness,
  price,
  adequateExamination,
  effectiveness,
  waitingExperience,
  // lackOfExplination,
  // unkindness,
  // highPrice,
  // inadequateExamination,
  // badWaitingEnvironment,
  // uneffectiveness
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
    default:
      return '';
  }
}

String diseaseTypeToKorean(DiseaseType? diseaseType) {
  switch (diseaseType) {
    case DiseaseType.cardiovascular:
      return '심혈관계 질환';
    case DiseaseType.musculoskeletal:
      return '골격근계 질환';
    case DiseaseType.digestive:
      return '소화계 질환';
    case DiseaseType.ophthalmology:
      return '안과계 질환';
    case DiseaseType.urinary:
      return '비뇨기계 질환';
    case DiseaseType.respiratory:
      return '호흡기계 질환';
    default:
      return '';
  }
}

String openingStatusToValue(OpeningStatus? openingStatus) {
  switch (openingStatus) {
    case OpeningStatus.open:
      return 'open';
    case OpeningStatus.all:
      return 'all';
    default:
      return '';
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
