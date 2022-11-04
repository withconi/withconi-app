import 'dart:html';

import '../../../../../core/network_handling/network_service.dart';

abstract class RequestInfo {
  bool requiresToken = true;
  RequestType requestType = RequestType.GET;
  String url = '';
  FormData? formData;
  Map<String, dynamic> get dataMap;
}
