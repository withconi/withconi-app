// ignore_for_file: constant_identifier_names

class HttpUrl {
  static const WITHCONI_API_BASE_URL =
      'https://asia-northeast3-withconi.cloudfunctions.net/api';
  static const VERIFY_EMAIL = WITHCONI_API_BASE_URL + '/auth/verifyEmail';
  static const SIGN_IN = WITHCONI_API_BASE_URL + '/auth/signIn';
  static const SIGN_UP = WITHCONI_API_BASE_URL + '/auth/signUp';
}
