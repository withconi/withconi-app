import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:withconi/core/error_handling/failures.dart';
import 'package:withconi/data/model/dto/request_dto/fcm_request/fcm_create_request.dart';
import 'package:withconi/data/provider/remote_provider/app_config_api.dart';
import 'package:withconi/data/repository/local_notification_repository.dart';
import 'package:withconi/import_basic.dart';
import 'package:withconi/module/community/controllers/community_main_controller.dart';

import '../../core/error_handling/exceptions.dart';
import '../../core/network_handling/network_service.dart';
import '../model/dto/api_call_dto.dart';

class FcmRepository extends GetxService {
  final Api _dio = Api();

  final FirebaseMessaging firebaseMessaging = FirebaseMessaging.instance;

  Future<Either<Failure, String?>> getFcmToken() async {
    try {
      final fcmToken = await firebaseMessaging.getToken();
      print('⭐️ fcm Token 발급 완료 => ${fcmToken}');
      firebaseMessaging.onTokenRefresh.listen((fcmToken) {
        // TODO: If necessary send token to application server.

        // Note: This callback is fired at each app startup and whenever a new
        // token is generated.
      }).onError((err) {
        // Error getting token.
      });
      return Right(fcmToken);
    } catch (e) {
      return Left(UserInfoUpdateFailure());
    }
  }

  Future<Either<Failure, bool>> saveFcmTokenDB(String fcmToken) async {
    try {
      CreateFcmTokenRequest requestDTO =
          CreateFcmTokenRequest.fromData(fcmToken);
      ApiCallDTO apiCallDTO = ApiCallDTO.fromDTO(requestDTO);
      var result = await _dio.apiCall(apiCallDTO);

      return Right(true);
    } on NoInternetConnectionException {
      return Left(NoConnectionFailure());
    } on PlatformException {
      return Left(NoUserDataFailure());
    } catch (e) {
      return Left(NoUserDataFailure());
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

    // Also handle any interaction when the app is in the background via a
    // Stream listener
    FirebaseMessaging.onMessageOpenedApp
        .listen(_handleMessage, onDone: () => print('onMessageOpenedApp'));

    // FirebaseMessaging.onMessage.listen((RemoteMessage message) {
    //   _handleMessage(message);
    // });

    FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);
  }

  @pragma('vm:entry-point')
  static Future<void> _firebaseMessagingBackgroundHandler(
      RemoteMessage message) async {
    print("Handling a background message: ${message.messageId}");
    if (message.data['type'] == 'post') {
      Get.toNamed(message.data['route'], arguments: {
        'postId': message.data['postId'],
        'boardId': message.data['boardId'],
      });
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

  void _handleMessage(RemoteMessage message) {
    // LocalNotificationService.showSampleNotification();
    // print('Got a message whilst in the foreground!');
    // print('Message data: ${message.data}');

    // if (message.notification != null) {
    //   print('Message also contained a notification: ${message.notification}');
    // }
    // if (message.data['type'] == 'post') {
    //   Get.find<CommunityMainController>();
    //   Get.toNamed(message.data['route'], arguments: {
    //     'postId': message.data['postId'],
    //     'boardId': message.data['boardId'],
    //   });
    // }
  }
}
