import 'dart:io';

import 'package:url_launcher/url_launcher.dart';
import 'package:withconi/core/values/constants/app_info.dart';

class UrlLauncher {
  // launchURL() {}
  static launchCall(String phoneNumber) async {
    final Uri launchUri = Uri(
      scheme: 'tel',
      path: phoneNumber,
    );
    await launchUrl(launchUri);
  }

  static launchStore() {
    if (Platform.isAndroid || Platform.isIOS) {
      final appId =
          Platform.isAndroid ? AppInfo.androidAppId : AppInfo.iosAppId;
      final url = Uri.parse(
        Platform.isAndroid
            ? "https://play.google.com/store/apps/details?id=$appId"
            : "https://apps.apple.com/app/id$appId",
      );
      launchUrl(
        url,
        mode: LaunchMode.externalApplication,
      );
    }
  }

  static launchLink(String link) {
    final url = Uri.parse(link);
    launchUrl(
      url,
      mode: LaunchMode.externalApplication,
    );
  }
}
