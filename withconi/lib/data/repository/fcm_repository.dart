import 'dart:convert';
import 'dart:io';
import 'package:dartz/dartz.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:withconi/core/error_handling/failures.dart';
import 'package:withconi/core/values/constants/auth_variables.dart';
import 'package:withconi/data/model/dto/request_dto/fcm_request/fcm_create_request.dart';
import 'package:withconi/data/model/dto/request_dto/fcm_request/update_fcm_db_request.dart';
import 'package:withconi/data/provider/remote_provider/user_api.dart';
import 'package:withconi/data/repository/user_repository.dart';
import 'package:withconi/import_basic.dart';
import '../../core/error_handling/exceptions.dart';
import '../../core/network_handling/network_service.dart';
import '../model/dto/api_call_dto.dart';
import '../model/dto/request_dto/user_request/update_user_info_request_dto.dart';
import 'local_notification_repository.dart';

@pragma('vm:entry-point')
Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  print("Handling a background message: ${message.messageId}");
  // if (Platform.isAndroid) {
  // await firebaseInitialization;
  var jsonMap = jsonEncode(message.data);
  LocalNotificationService.onTapForegroundNotification(
      1, 'android background에서 들어온 메세지', '메세지', jsonMap);
  // }
}

class FcmRepository extends GetxService {
  FcmRepository(this._notificationService);
  final Api _dio = Api();

  final FirebaseMessaging firebaseMessaging = FirebaseMessaging.instance;
  final LocalNotificationService _notificationService;

  Future<Either<Failure, String?>> getFcmToken() async {
    try {
      final fcmToken = await firebaseMessaging.getToken();
      await _notificationService.initLoacalNotificationPlugin();
      if (kDebugMode) {
        print('⭐️ fcm Token 발급 완료 => $fcmToken');
      }
      firebaseMessaging.onTokenRefresh.listen((fcmToken) {
        saveFcmTokenDB(fcmToken);
      }).onError((err) {});
      return Right(fcmToken);
    } catch (e) {
      return const Left(UserInfoUpdateFailure());
    }
  }

  Future<Either<Failure, bool>> saveFcmTokenDB(String? fcmToken) async {
    try {
      UpdateFcmTokenRequest requestDTO =
          UpdateFcmTokenRequest.fromData(fcmToken);
      ApiCallDTO apiCallDTO = ApiCallDTO.fromDTO(requestDTO);
      var result = await _dio.apiCall(apiCallDTO);

      return const Right(true);
    } on NoInternetConnectionException {
      return const Left(NoConnectionFailure());
    } on PlatformException {
      return const Left(NoUserDataFailure());
    } catch (e) {
      return const Left(NoUserDataFailure());
    }
  }

  Future<void> setupFirebaseMessaging() async {
    // Get any messages which caused the application to open from
    // a terminated state.

    NotificationSettings settings = await requestPermisstion();

    if (Platform.isAndroid) {
      FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
          FlutterLocalNotificationsPlugin();
      flutterLocalNotificationsPlugin
          .resolvePlatformSpecificImplementation<
              AndroidFlutterLocalNotificationsPlugin>()
          ?.requestPermission();
    }
    RemoteMessage? initialMessage = await firebaseMessaging.getInitialMessage();

    // If the message also contains a data property with a "type" of "chat",
    // navigate to a chat screen
    if (initialMessage != null) {
      _handleMessage(initialMessage);
    }

    FirebaseMessaging.onMessage.listen(_handleMessage,
        onDone: () => print('FirebaseMessaging.onMessage ==> _handleMessage'));

    FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);

    FirebaseMessaging.onMessageOpenedApp.listen((message) {
      _firebaseMessagingBackgroundHandler(message);
    });
  }

  requestPermisstion() async {
    NotificationSettings settings = await firebaseMessaging.requestPermission(
      alert: true,
      announcement: false,
      badge: true,
      carPlay: false,
      criticalAlert: false,
      provisional: false,
      sound: true,
    );
    print(settings);
    return settings;
  }

  void _handleMessage(RemoteMessage message) {
    if (Platform.isAndroid)
      LocalNotificationService.showSampleNotification(
          id: 1,
          title: message.data['title'] ?? '위드코니',
          message: message.data['message'] ?? '위드코니에서 보낸 메세지입니다.',
          payload: message.data.toString());
    else
      LocalNotificationService.showSampleNotification(
          id: 1,
          title: message.data['title'] ?? '위드코니',
          message: message.data['message'] ?? '새로운 댓글이 있습니다.',
          payload: jsonEncode(message.data));
  }
}
