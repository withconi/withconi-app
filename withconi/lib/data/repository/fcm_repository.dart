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
import 'local_notification_repository.dart';

@pragma('vm:entry-point')
Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  print("Handling a background message: ${message.messageId}");
  var jsonMap = jsonEncode(message.data);
  LocalNotificationService.onTapForegroundNotification(
      1, 'background에서 들어온 메세지', '메세지', jsonMap);
}

class FcmRepository extends GetxService {
  FcmRepository(this._notificationService);
  final Api _dio = Api();

  final FirebaseMessaging firebaseMessaging = FirebaseMessaging.instance;
  final LocalNotificationService _notificationService;

  static const AndroidNotificationChannel channel = AndroidNotificationChannel(
    'high_importance_channel', // id
    'High Importance Notifications', // title
    description:
        'This channel is used for important notifications.', // description
    importance: Importance.high,
  );

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

    firebaseMessaging.setForegroundNotificationPresentationOptions(
        alert: true, badge: true, sound: true);

    // if (Platform.isAndroid) {
    //   FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
    //       FlutterLocalNotificationsPlugin();
    //   flutterLocalNotificationsPlugin
    //       .resolvePlatformSpecificImplementation<
    //           AndroidFlutterLocalNotificationsPlugin>()
    //       ?.requestPermission();

    //   await flutterLocalNotificationsPlugin
    //       .resolvePlatformSpecificImplementation<
    //           AndroidFlutterLocalNotificationsPlugin>()
    //       ?.createNotificationChannel(channel);
    // }
    RemoteMessage? initialMessage = await firebaseMessaging.getInitialMessage();

    // If the message also contains a data property with a "type" of "chat",
    // navigate to a chat screen
    if (initialMessage != null) {
      _handleMessage(initialMessage);
    }

    FirebaseMessaging.onMessage.listen(
      (RemoteMessage message) {
        _handleMessage(message);
      },
    );

    FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);

    FirebaseMessaging.onMessageOpenedApp.listen((message) {
      _firebaseMessagingBackgroundHandler(message);
    });
  }

  Future<bool> deleteToken() async {
    try {
      await firebaseMessaging.deleteToken();
      return true;
    } catch (e) {
      return false;
    }
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

  static _handleMessage(RemoteMessage message) {
    if (Platform.isAndroid) {
      //foreground 메세지 안떠서 주석 취소함
      //g8에서는 잘 뜸 ;;
      // LocalNotificationService.showSampleNotification(
      //     id: 1,
      //     title: message.data['title'] ?? '위드코니',
      //     message: message.data['message'] ?? '위드코니에서 보낸 메세지입니다.',
      //     payload: message.data.toString());

      LocalNotificationService.showSampleNotification(
          id: 1,
          title: message.notification?.title ?? '위드코니',
          message: message.notification?.body ?? '위드코니에서 보낸 메세지입니다.',
          payload: message.data.toString());
    } else {
      // LocalNotificationService.showSampleNotification(
      //     id: 1,
      //     title: message.data['title'] ?? '위드코니',
      //     message: message.data['message'] ?? '위드코니에서 보낸 메세지입니다.',
      //     payload: jsonEncode(message.data));
      // String jsonMap = jsonEncode(message.data);
      // LocalNotificationService.onTapForegroundNotification(
      //     1, 'title', 'body', jsonMap);
    }
  }
}
