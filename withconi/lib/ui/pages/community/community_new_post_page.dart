import 'dart:convert';

import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter_svg/svg.dart';
import 'package:lottie/lottie.dart';
import 'package:withconi/controller/community/community_main_controller.dart';
import 'package:withconi/controller/community/community_new_post_controller.dart';
import 'package:withconi/controller/signup/disease_search_controller.dart';
import 'package:withconi/import_basic.dart';
import 'package:withconi/ui/pages/signup/signup_widgets/disease_selection_list_button.dart';
import 'package:withconi/ui/theme/colors.dart';
import 'package:withconi/ui/widgets/appbar/appbar.dart';
import 'package:withconi/ui/widgets/button/text_radio_button.dart';

import '../../../controller/community/community_detail_controller.dart';
import '../../widgets/button/wide_button.dart';

class CommunityNewPostPage extends StatelessWidget {
  CommunityNewPostPage({Key? key}) : super(key: key);

  CommunityNewPostController _controller =
      Get.put(CommunityNewPostController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: WcAppBar(
        title: '',
        action: Text(
          '남기기',
          style: GoogleFonts.notoSans(
              fontSize: 16,
              color: WcColors.blue100,
              fontWeight: FontWeight.bold),
        ),
        leading: SvgPicture.asset(
          'assets/icons/arrow_back.svg',
          color: WcColors.grey200,
        ),
        onActionTap: () {},
        onLeadingTap: () {
          Get.back();
        },
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 25),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: <Widget>[
            Container(
              alignment: Alignment.center,
              child: Text.rich(
                TextSpan(
                  children: [
                    TextSpan(
                      text: '0 ',
                      style: GoogleFonts.montserrat(
                          color: WcColors.blue100, fontWeight: FontWeight.w500),
                    ),
                    TextSpan(
                      text: '/ 3',
                      style: GoogleFonts.montserrat(
                          color: WcColors.grey180, fontWeight: FontWeight.w500),
                    ),
                  ],
                ),
              ),
              margin: EdgeInsets.only(right: 10),
              width: 60,
              height: 30,
              decoration: BoxDecoration(
                color: WcColors.white,
                borderRadius: BorderRadius.circular(5),
                boxShadow: [
                  BoxShadow(
                      color: Color.fromARGB(35, 0, 0, 0),
                      blurRadius: 10,
                      spreadRadius: -1),
                ],
              ),
            ),
            FloatingActionButton(
              focusElevation: 0,
              highlightElevation: 2,
              elevation: 0,
              backgroundColor: Colors.white,
              onPressed: () {},
              child: Container(
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  boxShadow: [
                    BoxShadow(
                        color: Color.fromARGB(55, 0, 0, 0),
                        blurRadius: 10,
                        spreadRadius: -1),
                  ],
                ),
                child: SvgPicture.asset(
                  'assets/icons/picture.svg',
                  width: 60,
                ),
              ),
            )
          ],
        ),
      ),
      backgroundColor: WcColors.white,
      body: SingleChildScrollView(
        child: SafeArea(
          bottom: false,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                margin: EdgeInsets.only(left: 20, top: 20, bottom: 14),
                child: Text(
                  '어떤 코니멀과 관련된 글인가요?',
                  style: GoogleFonts.notoSans(
                      color: WcColors.black,
                      fontSize: 17,
                      fontWeight: FontWeight.w500),
                ),
              ),
              Container(
                margin: EdgeInsets.only(left: 20, bottom: 10),
                child: Row(
                  children: _controller.postType
                      .map((type) => WcTextRadioButton(
                            height: 35,
                            onTap: () {
                              _controller.onPostTypeChanged(type);
                            },
                            selectedValue: _controller.selectedPostType.value,
                            value: type,
                          ))
                      .toList(),
                ),
              ),
              (true)
                  ? Container(
                      height: 135,
                      margin: EdgeInsets.only(left: 20),
                      child: Row(
                        children: _controller.pictureFileList
                            .map(
                              (picture) => Container(
                                margin: EdgeInsets.only(right: 10),
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(10),
                                  child: Stack(children: [
                                    Image.network(
                                      'https://www.dailygaewon.com/news/photo/202107/11483_12056_1547.jpg',
                                      fit: BoxFit.cover,
                                      width: 100,
                                      height: 100,
                                    ),
                                    Container(
                                      width: 100,
                                      height: 100,
                                      decoration: BoxDecoration(
                                          gradient: LinearGradient(
                                              begin: Alignment.topCenter,
                                              end: Alignment.bottomCenter,
                                              colors: [
                                            Color.fromARGB(43, 0, 0, 0),
                                            Color.fromARGB(22, 0, 0, 0),
                                            Colors.transparent,
                                            Color.fromARGB(11, 0, 0, 0),
                                            Color.fromARGB(23, 0, 0, 0),
                                          ],
                                              stops: [
                                            0.0,
                                            0.3,
                                            0.7,
                                            0.8,
                                            1
                                          ])),
                                    ),
                                    Positioned(
                                        right: -6,
                                        top: -6,
                                        child: GestureDetector(
                                          onTap: () {
                                            print('delete');
                                          },
                                          child: Container(
                                            color: Colors.transparent,
                                            width: 50,
                                            height: 50,
                                            padding: EdgeInsets.all(16),
                                            child: SvgPicture.asset(
                                              "assets/icons/delete_circle.svg",
                                              color: WcColors.grey60,
                                              fit: BoxFit.none,
                                            ),
                                          ),
                                        )),
                                  ]),
                                ),
                              ),
                            )
                            .toList(),
                      ),
                    )
                  : SizedBox.shrink(),
              Container(
                width: WcWidth - 40,
                margin: EdgeInsets.symmetric(horizontal: 20, vertical: 4),
                child: TextField(
                  style: GoogleFonts.notoSans(
                      color: WcColors.black,
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                      height: 1.5),
                  maxLines: 20,
                  minLines: 8,
                  decoration: InputDecoration(
                      border: InputBorder.none,
                      hintStyle: GoogleFonts.notoSans(
                          color: WcColors.grey120,
                          fontSize: 15,
                          fontWeight: FontWeight.w500,
                          height: 1.5),
                      hintText:
                          '욕설, 비방 등 상대방을 불쾌하게 하는 의견은 남기지 말아주세요. 신고를 당하면 커뮤니티 이용이 제한될 수 있습니다.'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
