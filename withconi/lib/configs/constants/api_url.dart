// ignore_for_file: constant_identifier_names

class HttpUrl {
  static const WITHCONI_API_BASE_URL =
      'https://asia-northeast3-withconi.cloudfunctions.net/api';
  static const VERIFY_EMAIL = '/auth/verifyEmail';
  static const SIGN_IN = '/auth/signIn';
  static const SIGN_UP = '/auth/signUp';
  static const USER_GET = '/auth/getUser';
  static const USER_UPDATE = '/auth/updateUser';
  static const CUSTOM_TOKEN_GET = '/auth/getCustomToken';
  static const DISEASE_GET = '/disease/listDiseases';
  static const CONIMAL_CREATE = '/auth/createConimal';
  static const CONIMAL_UPDATE = '/auth/updateConimal';
  static const CONIMAL_DELETE = '/auth/deleteConimal';
  static const POST_GET = '/board/listPost';
  static const POST_MY_GET = '/board/listPostWrittenMySelf';
  static const POST_LIKED_GET = '/board/listLikePost';
  static const POST_LIKED_UPDATE = '/board/updateLikePost';
  static const POST_CREATE = '/board/createPost';
  static const BOARD_GET = '/board/listBoard';
  static const POST_GET_LIKE_POST = '/board/listBoard';
  static const IMAGE_UPLOAD = '/comm/uploadFile';
  static const MAP_GET_LIST = '/location/getLocationList';
  static const MAP_GET_LOCATION_DETAIL = '/location/getLocation';
  static const MAP_GET_PLACE_REVIEW_LIST = '/location/getLocationReviewList';
  static const MAP_VERIFY_THUMBNAIL = '/location/verifyLocationThumbnail';
  static const MAP_PLACE_REVIEW_CREATE = '/location/createLocationReview';
}
