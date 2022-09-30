import 'package:url_launcher/url_launcher.dart';

class UrlLauncher {
  // launchURL() {}
  launchCall(String phoneNumber) async {
    final Uri launchUri = Uri(
      scheme: 'tel',
      path: phoneNumber,
    );
    await launchUrl(launchUri);
  }
}
