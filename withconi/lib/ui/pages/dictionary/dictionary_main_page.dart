import 'dart:ui';

import 'package:flutter_svg/svg.dart';
import 'package:withconi/controller/auth_controller.dart';
import 'package:withconi/controller/community/community_main_controller.dart';
import 'package:withconi/data/model/disease.dart';
import 'package:withconi/import_basic.dart';
import 'package:withconi/ui/pages/community/community_setting_page.dart';
import 'package:withconi/ui/pages/dictionary/dictionary_detail_page.dart';
import 'package:withconi/ui/theme/text_theme.dart';
import 'package:withconi/ui/widgets/searchbar/search_bar.dart';
import '../../widgets/button/icon_button.dart';

class DictionaryMainPage extends StatelessWidget {
  const DictionaryMainPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    CommunityMainController _controller = Get.find(tag: 'Initial');
    // CommunityMainController _controller = Get.put(CommunityMainController());

    return WillPopScope(
      onWillPop: () async => false,
      child: Scaffold(
        backgroundColor: WcColors.white,
        body: SingleChildScrollView(
          child: SafeArea(
            bottom: false,
            child: Center(
              child: SizedBox(
                width: WcWidth,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const SizedBox(
                            height: 20,
                          ),
                          Text('질병백과',
                              style: TextStyle(
                                  fontFamily: WcFontFamily.notoSans,
                                  fontWeight: FontWeight.w600,
                                  fontSize: 25)),
                          const SizedBox(
                            height: 20,
                          ),
                          SearchBarWidget(
                            isEditable: false,
                            hintText: '질병을 검색해보세요',
                            textController: null,
                            onTextFieldTapped: () {
                              Get.toNamed(Routes.DICTIONARY_SEARCH);
                            },
                          ),
                          const SizedBox(
                            height: 40,
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 20),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('고양이',
                              style: TextStyle(
                                  fontFamily: WcFontFamily.notoSans,
                                  fontWeight: FontWeight.w700,
                                  fontSize: 18,
                                  color: WcColors.black,
                                  height: 1)),
                          Text('에게 자주 발생하는 질병',
                              style: TextStyle(
                                  fontFamily: WcFontFamily.notoSans,
                                  fontWeight: FontWeight.w500,
                                  fontSize: 18,
                                  color: WcColors.grey200,
                                  height: 1)),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Obx(
                      () => Column(
                        children: _controller.boardList
                            .map((board) => InkWell(
                                  onTap: () {
                                    Get.toNamed(Routes.DICTIONARY_DETAIL,
                                        arguments: AuthController.to.wcUser
                                            .value!.conimals[0].diseases[0]);
                                  },
                                  child: Container(
                                      alignment: Alignment.centerLeft,
                                      height: 40,
                                      width: WcWidth,
                                      padding:
                                          EdgeInsets.symmetric(horizontal: 30),
                                      child: Row(
                                        children: [
                                          Text(
                                            (_controller.boardList
                                                        .indexOf(board) +
                                                    1)
                                                .toString(),
                                            style: GoogleFonts.openSans(
                                                fontWeight: FontWeight.w600,
                                                color: WcColors.blue100,
                                                fontSize: 16),
                                          ),
                                          SizedBox(
                                            width: 10,
                                          ),
                                          Text(
                                            board.title,
                                            style: GoogleFonts.notoSans(
                                                fontSize: 16),
                                          ),
                                        ],
                                      )),
                                ))
                            .toList(),
                      ),
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 20),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('강아지',
                              style: TextStyle(
                                  fontFamily: WcFontFamily.notoSans,
                                  fontWeight: FontWeight.w700,
                                  fontSize: 18,
                                  color: WcColors.black,
                                  height: 1)),
                          Text('에게 자주 발생하는 질병',
                              style: TextStyle(
                                  fontFamily: WcFontFamily.notoSans,
                                  fontWeight: FontWeight.w500,
                                  fontSize: 18,
                                  color: WcColors.grey200,
                                  height: 1)),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Obx(
                      () => Column(
                        children: _controller.boardList
                            .map((board) => InkWell(
                                  onTap: () {},
                                  child: Container(
                                    alignment: Alignment.centerLeft,
                                    height: 40,
                                    width: WcWidth,
                                    padding:
                                        EdgeInsets.symmetric(horizontal: 30),
                                    child: Row(
                                      children: [
                                        Text(
                                          (_controller.boardList
                                                      .indexOf(board) +
                                                  1)
                                              .toString(),
                                          style: GoogleFonts.openSans(
                                              fontWeight: FontWeight.w600,
                                              color: WcColors.orange100,
                                              fontSize: 16),
                                        ),
                                        SizedBox(
                                          width: 10,
                                        ),
                                        Text(
                                          board.title,
                                          style: GoogleFonts.notoSans(
                                              fontSize: 16),
                                        ),
                                      ],
                                    ),
                                  ),
                                ))
                            .toList(),
                      ),
                    ),
                    const SizedBox(
                      height: 30,
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
