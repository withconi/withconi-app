// import 'package:dartz/dartz.dart';
// import 'package:withconi/data/provider/platform_provider/kakao_api.dart';
// import 'package:withconi/data/provider/platform_provider/naver_api.dart';

// import '../../../core/error_handling/exceptions.dart';
// import '../../../core/error_handling/failures.dart';

// class NaverRepository {
//   final NaverAPI _api = NaverAPI();

//   Future<Either<Failure, String>> getNaverToken() async {
//     try {
//       String naverAccessToken = await _api.getNaverToken();
//       return Right(naverAccessToken);
//     } on NoInternetConnectionException {
//       return Left(NoConnectionFailure());
//     } on PlatformException {
//       return Left(NoUserDataFailure());
//     } catch (e) {
//       return Left(NoUserDataFailure());
//     }
//   }
// }
