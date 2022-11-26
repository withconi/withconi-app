// import 'package:dartz/dartz.dart';
// import 'package:withconi/data/provider/platform_provider/kakao_api.dart';

// import '../../../core/error_handling/exceptions.dart';
// import '../../../core/error_handling/failures.dart';

// class KakaoRepository {
//   final KakaoAPI _api = KakaoAPI();

//   Future<Either<Failure, String>> getKakaoToken() async {
//     try {
//       String kakaoAccessToken = await _api.getKakaoToken();
//       return Right(kakaoAccessToken);
//     } on NoInternetConnectionException {
//       return Left(NoConnectionFailure());
//     } on PlatformException {
//       return Left(NoUserDataFailure());
//     } catch (e) {
//       return Left(NoUserDataFailure());
//     }
//   }
// }
