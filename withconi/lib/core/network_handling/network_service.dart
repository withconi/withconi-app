import 'package:dio/dio.dart';
import 'package:withconi/configs/constants/api_url.dart';
import 'package:withconi/configs/constants/enum.dart';
import '../../configs/helpers/token_manager.dart';
import '../error_handling/exceptions.dart';
import 'network_response.dart';

enum RequestType { GET, POST, PUT, PATCH, DELETE }

class Api {
  final dio = createDio();

  Api._internal();

  static final _singleton = Api._internal();

  factory Api() => _singleton;

  static Dio createDio() {
    var dio = Dio(BaseOptions(
      baseUrl: HttpUrl.WITHCONI_API_BASE_URL,
      receiveTimeout: 20000, // 20 seconds
      connectTimeout: 20000,
      sendTimeout: 20000,
    ));

    dio.interceptors.addAll({
      AuthInterceptor(dio),
    });

    // dio.interceptors.addAll({
    //   Logging(dio),
    // });

    dio.interceptors.addAll({
      ErrorInterceptors(dio),
    });
    return dio;
  }

  Future<Map<String, dynamic>> apiCall(
      {required String url,
      Map<String, dynamic>? queryParameters,
      Map<String, dynamic>? body,
      required RequestType requestType}) async {
    Response? result;
    try {
      switch (requestType) {
        case RequestType.GET:
          {
            Options options = Options(headers: header);
            result = await dio.get(url,
                queryParameters: queryParameters, options: options);
            break;
          }
        case RequestType.POST:
          {
            Options options = Options(headers: header);
            result = await dio.post(url, data: body, options: options);
            break;
          }
        case RequestType.DELETE:
          {
            Options options = Options(headers: header);
            result =
                await dio.delete(url, data: queryParameters, options: options);
            break;
          }
      }
      if (result != null && result.data['success'] == true) {
        return result.data['data'] as Map<String, dynamic>;
      } else {
        throw NoDataException();
      }
    } catch (exception) {
      rethrow;
    }
  }
}

class AuthInterceptor extends Interceptor {
  final Dio dio;

  AuthInterceptor(this.dio);

  @override
  void onRequest(
      RequestOptions options, RequestInterceptorHandler handler) async {
    String accessToken =
        WcTokenManager().getToken(CacheControllerKey.ACCESS_TOKEN);

    if (accessToken.isEmpty) {
      // var expiration = await TokenRepository().getAccessTokenRemainingTime();

      // if (expiration.inSeconds < 60) {
      //   dio.interceptors.requestLock.lock();

      //   // Call the refresh endpoint to get a new token
      //   await UserService().refresh().then((response) async {
      //     await TokenRepository().persistAccessToken(response.accessToken);
      //     accessToken = response.accessToken;
      //   }).catchError((error, stackTrace) {
      //     handler.reject(error, true);
      //   }).whenComplete(() => dio.interceptors.requestLock.unlock());
      // }

      options.headers['Authorization'] = 'Bearer $accessToken';
    }
    return handler.next(options);
  }
}

class ErrorInterceptors extends Interceptor {
  final Dio dio;

  ErrorInterceptors(this.dio);

  @override
  void onError(DioError err, ErrorInterceptorHandler handler) {
    switch (err.type) {
      case DioErrorType.connectTimeout:
      case DioErrorType.sendTimeout:
      case DioErrorType.receiveTimeout:
        throw TimeOutException(err.requestOptions);
      case DioErrorType.response:
        switch (err.response?.statusCode) {
          case 400:
            throw BadRequestException(err.requestOptions);
          case 403:
            throw UnauthorizedException(err.requestOptions);
          case 404:
            throw NotFoundException(err.requestOptions);
          case 500:
            throw InternalServerErrorException(err.requestOptions);
        }
        break;
      case DioErrorType.cancel:
        break;
      case DioErrorType.other:
        throw NoInternetConnectionException(err.requestOptions);
    }

    return handler.next(err);
  }
}

// class BadRequestException extends DioError {
//   BadRequestException(RequestOptions r) : super(requestOptions: r);

//   @override
//   String toString() {
//     return 'Invalid request';
//   }
// }

// class InternalServerErrorException extends DioError {
//   InternalServerErrorException(RequestOptions r) : super(requestOptions: r);

//   @override
//   String toString() {
//     return 'Unknown error occurred, please try again later.';
//   }
// }

// class ConflictException extends DioError {
//   ConflictException(RequestOptions r) : super(requestOptions: r);

//   @override
//   String toString() {
//     return 'Conflict occurred';
//   }
// }

// class UnauthorizedException extends DioError {
//   UnauthorizedException(RequestOptions r) : super(requestOptions: r);

//   @override
//   String toString() {
//     return 'Access denied, wrong token';
//   }
// }

// class NotFoundException extends DioError {
//   NotFoundException(RequestOptions r) : super(requestOptions: r);

//   @override
//   String toString() {
//     return 'The requested information could not be found';
//   }
// }

// class NoInternetConnectionException extends DioError {
//   NoInternetConnectionException(RequestOptions r) : super(requestOptions: r);

//   @override
//   String toString() {
//     return 'No internet connection detected, please try again.';
//   }
// }

// class TimeOutException extends DioError {
//   TimeOutException(RequestOptions r) : super(requestOptions: r);

//   @override
//   String toString() {
//     return 'The connection has timed out, please try again.';
//   }
// }

class Logging extends Interceptor {
  final Dio dio;
  Logging(this.dio);
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    print('REQUEST[${options.method}] => PATH: ${options.path}');
    return super.onRequest(options, handler);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    print(
      'RESPONSE[${response.statusCode}] => PATH: ${response.requestOptions.path}',
    );
    return super.onResponse(response, handler);
  }

  @override
  void onError(DioError err, ErrorInterceptorHandler handler) {
    print(
      'ERROR[${err.response?.statusCode}] => PATH: ${err.requestOptions.path}',
    );
    print(err);
    return super.onError(err, handler);
  }
}

final Map<String, String> header = {
  'Content-type': 'application/json',
  'Accept': 'application/json',
  'client-secret': 'xyz',
  'client-id': 'abc',
  'package-name': 'com.sasa.abc',
  'platform': 'android',
  'Authorization': "access_token"
};
