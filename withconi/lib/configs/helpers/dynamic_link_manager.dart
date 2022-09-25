import 'dart:developer';
import 'package:firebase_dynamic_links/firebase_dynamic_links.dart';
import 'package:withconi/configs/constants/auth_variables.dart';
import 'package:withconi/controller/common_controller/email_verification_controller.dart';
import 'package:withconi/ui/widgets/dialog/duration_dialog.dart';
import 'package:withconi/ui/widgets/snackbar.dart';

import '../../import_basic.dart';

class DynamicLinkManager {
  final String dynamicLinkPrefix = 'https://withconi.page.link';
  Future<bool> setup() async {
    bool isExistDynamicLink = await _getInitialDynamicLink();
    _addListener();

    return isExistDynamicLink;
  }

  Future<bool> _getInitialDynamicLink() async {
    final PendingDynamicLinkData? dynamicLinkData =
        await firebaseDynamicLinks.getInitialLink();

    if (dynamicLinkData != null) {
      await _redirectScreen(dynamicLinkData);
      return true;
    }

    return false;
  }

  void _addListener() {
    FirebaseDynamicLinks.instance.onLink.listen((
      PendingDynamicLinkData dynamicLinkData,
    ) async {
      await _redirectScreen(dynamicLinkData);
    }).onError((error) {
      log(error);
    });
  }

  Future<void> _redirectScreen(PendingDynamicLinkData dynamicLinkData) async {
    // dynamicLinkData.link.queryParameters.containsKey('redirectPage')
    if (true) {
      print(dynamicLinkData.link);
      print(dynamicLinkData.link.queryParameters);
      Uri url = Uri.parse(
          dynamicLinkData.link.queryParameters['continueUrl'].toString());
      String redirectPage = url.path;
      String nextRoute = url.queryParameters['nextRoute'] ?? '';

      // Get.toNamed(pageLink, arguments: {"previousRoute": previousRoute});

      print(dynamicLinkData.link);
      print(redirectPage);
      print(nextRoute);

      switch (redirectPage) {
        case Routes.EMAIL_VERIFICATION:
          EmailVerificationController _controller =
              Get.find<EmailVerificationController>();
          bool emailVerified = await _controller.checkEmailVerification(
              verificationLink: dynamicLinkData);
          if (emailVerified) {
            await showDurationDialog(
                () => Future.delayed(Duration(milliseconds: 2400)));
            if (nextRoute.isNotEmpty) {
              Get.offNamed(nextRoute);
            } else {
              Get.back(result: true);
            }
          } else {
            await showCustomSnackbar(text: '인증 메일이 만료되었어요. 재전송해주세요 :)');
          }
          break;
      }
    }
  }

  Future<String> getShortLink(String redirectPage, String nextRoute) async {
    final dynamicLinkParams = DynamicLinkParameters(
      uriPrefix: dynamicLinkPrefix,
      link: Uri.parse('$dynamicLinkPrefix/$redirectPage?nextRoute=$nextRoute'),
      androidParameters: const AndroidParameters(
        packageName: 'co.yellowtoast.withconi',
        minimumVersion: 0,
      ),
      iosParameters: const IOSParameters(
        bundleId: 'co.yellowtoast.withconi',
        minimumVersion: '0',
      ),
    );
    final dynamicLink =
        await firebaseDynamicLinks.buildShortLink(dynamicLinkParams);

    return dynamicLink.shortUrl.toString();
  }

  Future<String> getUrl(
      {required String redirectRoute, required String nextRoute}) async {
    String dynamicLinkUrl =
        '$dynamicLinkPrefix$redirectRoute?nextRoute=$nextRoute';
    print(dynamicLinkUrl);
    return dynamicLinkUrl;
  }
}
