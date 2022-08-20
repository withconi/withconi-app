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

String sortTypeToKorean(SortType? sortType) {
  switch (sortType) {
    case SortType.recent:
      return "최신순";
    case SortType.popular:
      return "인기순";
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

enum Species {
  @JsonValue("cat")
  cat,
  @JsonValue("dog")
  dog,
  @JsonValue("all")
  all,
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

enum CacheControllerKey {
  ACCESS_TOKEN,
  REFRESH_TOKEN,
  PROVIDER,
  EMAIL_VERIFIED,
  EMAIL_VERIFY_SKIPPED
}

enum UserState {
  SIGN_IN_EMAIL,
  SIGN_IN_AUTH_CREDENTIAL,
  SIGN_IN_TOKEN,
  SIGN_UP_EMAIL,
  SIGN_UP_SNS,
  NONE
}
