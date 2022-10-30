import 'dart:io';

import 'package:url_launcher/url_launcher.dart';
import 'package:withconi/core/values/constants/app_info.dart';

class UrlLauncher {
  // launchURL() {}
  launchCall(String phoneNumber) async {
    final Uri launchUri = Uri(
      scheme: 'tel',
      path: phoneNumber,
    );
    await launchUrl(launchUri);
  }

  launchStore() {
    if (Platform.isAndroid || Platform.isIOS) {
      final appId =
          Platform.isAndroid ? AppInfo.androidAppId : AppInfo.iosAppId;
      final url = Uri.parse(
        Platform.isAndroid
            ? "market://details?id=$appId"
            : "https://apps.apple.com/app/id$appId",
      );
      launchUrl(
        url,
        mode: LaunchMode.externalApplication,
      );
    }
  }
}
