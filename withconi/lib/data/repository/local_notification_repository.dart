import 'dart:convert' as convert;
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
  }

  static Future<void> showSampleNotification(
      {required int id,
      required String title,
      required String message,
      required String payload}) async {
    const AndroidNotificationDetails androidNotificationDetails =
        AndroidNotificationDetails(
      'channel id',
      'channelName',
      importance: Importance(1),
      priority: Priority(1),
      showWhen: false,
    );

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
      androidSettings =
          const AndroidInitializationSettings('mipmap/launcher_icon');
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
        onTapForegroundNotification(1, 'title', 'body', details.payload);
      },
    );
  }

  static onTapForegroundNotification(
      int id, String? title, String? body, String? payload) async {
    Map<String, dynamic> payloadMap = await convert.jsonDecode(payload!);
    Get.find<CommunityMainController>();
    Get.toNamed(Routes.COMMUNITY_POST_DETAIL, arguments: payloadMap);
  }
}
