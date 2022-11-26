import 'package:dio/dio.dart' as dio;

import '../../../../../core/network_handling/network_service.dart';

abstract class RequestDTO {
  Map<String, dynamic> get dataMap;
  bool get requiresToken;
  RequestType get requestType;
  String get url;
}
