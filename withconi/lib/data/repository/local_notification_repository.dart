import 'dart:convert';
import 'dart:io';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:withconi/import_basic.dart';
import 'package:withconi/module/community/controllers/community_main_controller.dart';

class LocalNotificationService extends GetxService {
  static FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
      FlutterLocalNotificationsPlugin();

  static void requestNotificationPermission() {
    flutterLocalNotificationsPlugin
        .resolvePlatformSpecificImplementation<
            IOSFlutterLocalNotificationsPlugin>()
        ?.requestPermissions(alert: true, badge: true, sound: true);

    flutterLocalNotificationsPlugin
        .resolvePlatformSpecificImplementation<
            AndroidFlutterLocalNotificationsPlugin>()
        ?.requestPermission();
  }

  static Future<void> showSampleNotification(
      {required int id,
      required String title,
      required String message,
      required String payload}) async {
    const AndroidNotificationDetails androidNotificationDetails =
        AndroidNotificationDetails('high_importance_channel', 'channelName',
            importance: Importance.high,
            priority: Priority.defaultPriority,
            showWhen: false,
            icon: 'withconi_icon',
            visibility: NotificationVisibility.public);

    const NotificationDetails notificationDetails = NotificationDetails(
        android: androidNotificationDetails,
        iOS: DarwinNotificationDetails(
            presentAlert: true, presentBadge: true, presentSound: true));

    await flutterLocalNotificationsPlugin
        .show(id, title, message, notificationDetails, payload: payload);
  }

  Future<void> initLoacalNotificationPlugin() async {
    AndroidInitializationSettings? androidSettings;
    DarwinInitializationSettings? iosSttings;

    if (Platform.isAndroid) {
      // Android용 새 Notification Channel
      const AndroidNotificationChannel androidNotificationChannel =
          AndroidNotificationChannel(
        'high_importance_channel', // 임의의 id
        'High Importance Notifications', // 설정에 보일 채널명
        description:
            'This channel is used for important notifications.', // 설정에 보일 채널 설명
        importance: Importance.max,
      );

      // Notification Channel을 디바이스에 생성
      final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
          FlutterLocalNotificationsPlugin();
      await flutterLocalNotificationsPlugin
          .resolvePlatformSpecificImplementation<
              AndroidFlutterLocalNotificationsPlugin>()
          ?.createNotificationChannel(androidNotificationChannel);

      androidSettings = const AndroidInitializationSettings('withconi_icon');
    } else if (Platform.isIOS) {
      iosSttings = const DarwinInitializationSettings(
        requestAlertPermission: false,
        requestBadgePermission: false,
        requestCriticalPermission: false,
        requestSoundPermission: false,
      );
    }

    final InitializationSettings initializationSettings =
        InitializationSettings(android: androidSettings, iOS: iosSttings);

    await flutterLocalNotificationsPlugin.initialize(
      initializationSettings,
      onDidReceiveNotificationResponse: (details) {
        String? payload = details.payload;

        if (Platform.isAndroid) {
          payload = payload!.replaceAll('{', '{"');
          payload = payload.replaceAll(': ', '": "');
          payload = payload.replaceAll(', ', '", "');
          payload = payload.replaceAll('}', '"}');
        }
        print(payload);
        LocalNotificationService.onTapForegroundNotification(
            1, 'title', 'body', payload);
      },
    );
  }

  static onTapForegroundNotification(
      int id, String? title, String? body, String? payload) async {
    print(payload);

    if (payload != null && payload.isNotEmpty) {
      Map<String, dynamic> payloadMap = await jsonDecode(payload!);

      switch (payloadMap['itemType']) {
        case 'post':
          String itemId = payloadMap['itemId'] as String;
          String boardId = itemId.split('/').first;
          String postId = itemId.split('/').last;
          Get.find<CommunityMainController>();
          Get.toNamed(Routes.COMMUNITY_POST_DETAIL, arguments: {
            'fromRootPage': false,
            'boardId': boardId,
            'postId': postId,
          });
          break;
        default:
      }
    }
  }
}
