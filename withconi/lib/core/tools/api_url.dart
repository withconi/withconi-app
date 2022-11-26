// ignore_for_file: constant_identifier_names

class HttpUrl {
  static const WITHCONI_API_BASE_URL =
      'https://asia-northeast3-withconi.cloudfunctions.net/api';
  static const VERSION_CHECK = '/comm/getVersion';
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
  static const BREED_LIST_GET = '/comm/listSpecies';
  static const COMMUNITY_GET_POST_LIST = '/board/listPost';
  static const COMMUNITY_GET_MY_POST_LIST = '/board/listPostWrittenMySelf';
  static const COMMUNITY_GET_LIKE_POST_LIST = '/board/listLikePost';
  static const COMMUNITY_GET_HOT_POST_LIST = '/board/listPopularPosts';
  static const COMMUNITY_COMMENT_LIST = '/board/listPostLineReply';
  static const COMMUNITY_UPDATE_POST_LIKE = '/board/updateLikePost';
  static const COMMENT_LIKE_UPDATE = '/board/updateLikePostLineReply';
  static const COMMENT_DELETE = '/board/deletePostLineReply';
  static const COMMENT_LIST_GET = '/board/listPostLineReply';
  static const COMMUNITY_GET_POST = '/board/getPost';
  static const COMMUNITY_DELETE_POST = '/board/deletePost';
  static const COMMUNITY_BLOCK_POST = '/board/updateBlockPost';
  static const COMMUNITY_BLOCK_COMMENT = '/board/deletePost';
  static const COMMUNITY_DELETE_COMMENT = '/board/deletePostLineReply';
  static const COMMUNITY_CREATE_REPORT = '/board/reportPost';
  static const POST_CREATE = '/board/createPost';
  static const POST_UPDATE_MY_POST = '/board/updatePost';
  static const COMMENT_CREATE = '/board/createPostLineReply';
  static const BOARD_GET = '/board/listBoard';
  static const POST_GET_LIKE_POST = '/board/listBoard';
  static const IMAGE_UPLOAD = '/comm/uploadFile';
  static const PLACE_PREVIEW_LIST = '/location/getLocationList';
  static const MAP_GET_LOCATION_DETAIL = '/location/getLocation';
  static const MAP_GET_REVIEW_HISTORY = '/location/getLocationReviewList';
  static const MAP_GET_VERIFICATION = '/location/verifyLocationThumbnail';
  static const MAP_CREATE_REVIEW = '/location/createLocationReview';
  static const MAP_GET_MY_REVIEW_LIST = '/location/getMyReviewList';
  static const MAP_GET_MY_REVIEW_DETAIL = '/location/getMyReview';
  static const MAP_UPDATE_BOOKMARK = '/location/updateLocationBookmark';
}
