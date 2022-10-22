import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:app_settings/app_settings.dart';
import 'package:withconi/controller/map/map_location_permission_controller.dart';
import 'package:withconi/ui/theme/colors.dart';
import 'package:withconi/ui/theme/sizes.dart';
import 'package:withconi/ui/theme/text_theme.dart';
import 'package:withconi/ui/widgets/button/wide_button.dart';
import '../../../controller/common_controller/email_verification_controller.dart';

class MapLocationPermissionPage extends StatelessWidget {
  MapLocationPermissionPage({Key? key}) : super(key: key);
  MapPermissionController _controller = Get.put(MapPermissionController());

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => false,
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        body: SafeArea(
          child: SizedBox(
            height: WcHeight,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  const SizedBox(
                    height: 75,
                  ),
                  SizedBox(
                    width: 60,
                    child: Image.asset(
                      'assets/icons/hospital_clicked.png',
                    ),
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  Text('위치정보 권한이\n필요해요',
                      style: TextStyle(
                          fontFamily: WcFontFamily.notoSans,
                          fontSize: 25,
                          fontWeight: FontWeight.w600)),
                  const SizedBox(
                    height: 45,
                  ),
                  const Text(
                      '정확한 정보를 위해\n위치정보가 반드시 필요해요.\n설정에서 위치정보 권한을 허용해주세요 :)',
                      style: TextStyle(
                          fontFamily: WcFontFamily.notoSans,
                          fontSize: 15,
                          color: WcColors.grey140,
                          fontWeight: FontWeight.w400)),
                  SizedBox(
                    height: 10,
                  ),
                  const Text('설정 > 위치 > 앱을 사용하는 동안',
                      style: TextStyle(
                          fontFamily: WcFontFamily.notoSans,
                          fontSize: 15,
                          color: WcColors.grey200,
                          fontWeight: FontWeight.w600)),
                  const SizedBox(
                    height: 50,
                  ),
                  WcWideButtonWidget(
                    active: true,
                    activeButtonColor: WcColors.blue100,
                    activeTextColor: WcColors.white,
                    buttonText: '위치정보 권한 설정하기',
                    buttonWidth: WcWidth - 40,
                    onTap: _controller.openAppLocationSetting,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
