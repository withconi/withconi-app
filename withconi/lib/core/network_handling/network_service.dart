import 'dart:convert';
import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:withconi/configs/constants/api_url.dart';
import 'package:withconi/configs/constants/enum.dart';
import '../../configs/helpers/token_manager.dart';
import '../error_handling/exceptions.dart';

enum RequestType { GET, POST, POST_FORM_DATA, PUT, PATCH, DELETE }

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

    dio.interceptors.addAll({
      Logging(dio),
    });

    dio.interceptors.addAll({
      ErrorInterceptors(dio),
    });
    return dio;
  }

  Future<Map<String, dynamic>> apiCall(
      {required String url,
      Map<String, dynamic>? header,
      Map<String, dynamic>? queryParameters,
      Map<String, dynamic>? body,
      FormData? formData,
      required RequestType requestType}) async {
    Response? result;
    try {
      switch (requestType) {
        case RequestType.GET:
          {
            Options options = Options(headers: header ?? default_header);
            result = await dio.get(url,
                queryParameters: queryParameters, options: options);
            break;
          }
        case RequestType.POST:
          {
            Options options = Options(headers: header ?? default_header);
            result = await dio.post(url, data: body, options: options);

            break;
          }
        case RequestType.POST_FORM_DATA:
          {
            Options options = Options(headers: header ?? default_header);
            result = await dio.post(url, data: formData, options: options);

            break;
          }
        case RequestType.DELETE:
          {
            Options options = Options(headers: header ?? default_header);
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
      print(exception);
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
        WcCacheManager().getToken(CacheControllerKey.ACCESS_TOKEN);

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
        if (kDebugMode) {
          print(err);
        }
        throw NoInternetConnectionException(err.requestOptions);
    }

    return handler.next(err);
  }
}

class Logging extends Interceptor {
  final Dio dio;
  Logging(this.dio);
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    if (kDebugMode) {
      if (options.contentType != "multipart/form-data") {
        var prettyQuery =
            const JsonEncoder.withIndent('  ').convert(options.queryParameters);
        var prettyBody =
            const JsonEncoder.withIndent('  ').convert(options.data);
        log('\n🧡 REQUEST[${options.method}] => PATH: ${options.path}\n🔸 QUERY: $prettyQuery\n🔸 BODY: $prettyBody');
      } else {
        log('\n🧡 REQUEST[${options.method}] => PATH: ${options.path}\n🔸 BODY: ${options.data}');
      }
    }
    return super.onRequest(options, handler);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    if (kDebugMode) {
      var prettyData = JsonEncoder.withIndent('  ').convert(response.data);

      log(
        '\n💙 RESPONSE[${response.statusCode}] => PATH: ${response.requestOptions.path}\n🔹 DATA: $prettyData',
      );
    }
    return super.onResponse(response, handler);
  }

  @override
  void onError(DioError err, ErrorInterceptorHandler handler) {
    if (kDebugMode) {
      log(
        '\n💔 ERROR[${err.response?.statusCode}] => PATH: ${err.requestOptions.path}\n🔻 ERROR_INFO: ${err.response?.data['error']}',
      );
    }

    return super.onError(err, handler);
  }
}

final Map<String, String> default_header = {
  'Content-type': 'application/json',
  'Accept': 'application/json',
  'client-secret': 'xyz',
  'client-id': 'abc',
  'package-name': 'com.sasa.abc',
  'platform': 'android',
  'accessToken': "access_token"
};
