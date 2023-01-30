import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'package:withconi/core/tools/helpers/url_launcher.dart';
import 'package:withconi/data/enums/enum.dart';
import 'package:withconi/data/model/dto/response_dto/setting_response/developer_info_response_dto.dart';
import 'package:withconi/data/repository/app_setting_repository.dart';
import 'package:withconi/import_basic.dart';
import 'package:withconi/module/setting/app_setting/controller/developer_info_controller.dart';
import 'package:withconi/module/setting/app_setting/controller/inquiry_controller.dart';
import 'package:withconi/module/theme/text_theme.dart';
import 'package:withconi/global_widgets/appbar/appbar.dart';
import 'package:withconi/global_widgets/button/wide_button.dart';
import '../../../../global_widgets/checkbox/custom_checkbox.dart';
import '../../../global_widgets/snackbar.dart';

class DeveloperInfoPage extends StatelessWidget {
  const DeveloperInfoPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final DeveloperInfoController _controller =
        Get.put(DeveloperInfoController(Get.find<AppSettingRepository>()));
    return Scaffold(
      appBar: WcAppBar(
        title: '개발자 정보  ⛅️',
        leading: SvgPicture.asset(
          'assets/icons/arrow_back.svg',
          color: WcColors.grey200,
        ),
      ),
      backgroundColor: WcColors.white,
      body: Align(
        alignment: Alignment.topCenter,
        child: SafeArea(
          bottom: false,
          child: Center(
            child: Container(
              alignment: Alignment.center,
              width: WcWidth(context),
              height: WcHeight(context),

              // margin: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(
                    height: 25,
                  ),
                  SizedBox(
                    width: WcWidth(context) - 40,
                    height: 480,
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Obx(
                          () => DeveloperInfoCard(
                            imageSrc: _controller.frontendImageSrc,
                            name: '강지혜',
                            role: ['프론트 앱 개발', '아이디어 및 기획', '디자인'],
                            developerInfo: _controller.frontend.value,
                          ),
                        ),
                        SizedBox(
                          width: 15,
                        ),
                        Obx(
                          () => DeveloperInfoCard(
                            imageSrc: _controller.backendImageSrc,
                            name: '정승덕',
                            role: ['백앤드 개발', '아이디어 및 기획', '데이터 가공'],
                            developerInfo: _controller.backend.value,
                          ),
                        )
                      ],
                    ),
                  ),
                  Text(
                    '서비스 운영을 위해 소정 기부하실 수 있습니다.',
                    style: TextStyle(
                        fontFamily: WcFontFamily.notoSans,
                        fontSize: 15,
                        fontWeight: FontWeight.w400),
                  )
                ],
              ),

              //  Column(
              //   mainAxisAlignment: MainAxisAlignment.start,
              //   crossAxisAlignment: CrossAxisAlignment.start,
              //   children: [
              //     const SizedBox(
              //       height: 10,
              //     ),
              //     Container(
              //       height: 160,
              //       decoration: BoxDecoration(
              //           borderRadius: BorderRadius.circular(15),
              //           color: WcColors.blue20),
              //       child: TextField(
              //         onChanged: _controller.onReportTextChanged,
              //         keyboardType: TextInputType.text,
              //         controller: _controller.inquiryDetailTextController,
              //         style: const TextStyle(
              //             fontFamily: WcFontFamily.notoSans,
              //             color: WcColors.black,
              //             fontSize: 16,
              //             fontWeight: FontWeight.w500,
              //             height: 1.5),
              //         maxLines: 20,
              //         minLines: 5,
              //         decoration: const InputDecoration(
              //             contentPadding: EdgeInsets.all(20),
              //             isDense: true,
              //             border: InputBorder.none,
              //             hintStyle: TextStyle(
              //                 fontFamily: WcFontFamily.notoSans,
              //                 color: WcColors.grey120,
              //                 fontSize: 15,
              //                 fontWeight: FontWeight.w400,
              //                 height: 1.5),
              //             hintText:
              //                 '건의해주시는 내용을 꼼꼼히 살펴보고 있어요! 앱 사용시 느끼셨던 불편함이나 기능에 대한 제안이 있으시면 적어주세요 :)'),
              //       ),
              //     ),
              //   ],
              // ),
            ),
          ),
        ),
      ),
    );
    ;
  }
}

class DeveloperInfoCard extends StatelessWidget {
  DeveloperInfoCard(
      {Key? key,
      required this.imageSrc,
      required this.name,
      required this.role,
      required this.developerInfo})
      : super(key: key);
  String name;
  List<String> role;
  DeveloperInfoResponseDTO developerInfo;
  String imageSrc;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CircleAvatar(
          radius: 58,
          backgroundColor: WcColors.white,
          backgroundImage: AssetImage(imageSrc),
        ),
        SizedBox(
          height: 14,
        ),
        Text(
          name,
          style: TextStyle(
              fontFamily: WcFontFamily.notoSans,
              fontSize: 18,
              fontWeight: FontWeight.w600),
        ),
        SizedBox(
          height: 15,
        ),
        Container(
          width: (WcWidth(context) - 40 - 15) / 2,
          height: 95,
          decoration: BoxDecoration(
              color: WcColors.grey20.withOpacity(0.8),
              borderRadius: BorderRadius.circular(10)),
          child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: role
                  .map((text) => Text(
                        text,
                        style: TextStyle(
                            fontFamily: WcFontFamily.notoSans,
                            fontSize: 15,
                            fontWeight: FontWeight.w400),
                      ))
                  .toList()),
        ),
        SizedBox(
          height: 17,
        ),
        Container(
          padding: const EdgeInsets.fromLTRB(16, 17, 16, 0),
          width: (WcWidth(context) - 40 - 15) / 2,
          constraints: const BoxConstraints(minHeight: 105),
          decoration: BoxDecoration(
              color: WcColors.grey20.withOpacity(0.8),
              borderRadius: BorderRadius.circular(10)),
          child: Column(mainAxisAlignment: MainAxisAlignment.start, children: [
            SizedBox(
              width: (WcWidth(context) - 40 - 15) / 2,

              // color: WcColors.black,
              child: Row(
                children: [
                  Image.asset(
                    'assets/icons/github.png',
                    height: 20,
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Expanded(
                      child: GestureDetector(
                    onTap: () {
                      UrlLauncher.launchLink(developerInfo.github);
                    },
                    child: Container(
                      color: Colors.transparent,
                      child: Text(
                        'Github',
                        maxLines: 1,
                        style: GoogleFonts.workSans(
                            fontSize: 16, fontWeight: FontWeight.w500),
                      ),
                    ),
                  )),
                ],
              ),
            ),
            SizedBox(
              height: 12,
            ),
            SizedBox(
              width: (WcWidth(context) - 40 - 15) / 2,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Icon(
                    Icons.mail_rounded,
                    size: 20,
                    color: WcColors.grey200,
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Expanded(
                      child: GestureDetector(
                    onTap: () {
                      Clipboard.setData(
                          ClipboardData(text: developerInfo.mail));
                      showCustomSnackbar(text: '이메일이 복사되었어요');
                    },
                    child: Container(
                      // color: WcColors.blue100,
                      child: Text(
                        developerInfo.mail,
                        style: GoogleFonts.workSans(
                            fontSize: 16, fontWeight: FontWeight.w400),
                        // maxLines: 1,
                      ),
                    ),
                  ))
                ],
              ),
            ),

            // SizedBox(
            //   width: (WcWidth(context) - 40 - 15) / 2,

            //   // color: WcColors.black,
            //   child: Row(
            //     children: [
            //       Expanded(
            //         child: Container(
            //           color: WcColors.blue100,
            //           child: Text(
            //             developerInfo.buymeacoffee,
            //             maxLines: 1,
            //           ),
            //         ),
            //       )
            //     ],
            //   ),
            // )
          ]),
        ),
        SizedBox(
          height: 17,
        ),
        GestureDetector(
          onTap: () {
            UrlLauncher.launchLink(developerInfo.buymeacoffee);
          },
          child: SizedBox(
              width: (WcWidth(context) - 40 - 15) / 2,
              child: Image.asset('assets/images/buy_me_a_coffee.png')),
        ),
      ],
    );
  }
}
