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
  @JsonValue("both")
  both,
}

enum Species {
  @JsonValue("cat")
  cat,
  @JsonValue("dog")
  dog,
  @JsonValue("all")
  all,
}

enum ProviderOptions {
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

enum CacheControllerKey { ACCESS_TOKEN, REFRESH_TOKEN, PROVIDER }

enum UserState {
  SIGN_IN_EMAIL,
  SIGN_IN_CREDENTIAL,
  SIGN_IN_TOKEN,
  SIGN_UP_EMAIL,
  SIGN_UP_SNS,
  NONE
}
