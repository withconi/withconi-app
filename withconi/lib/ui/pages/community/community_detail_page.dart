import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter_svg/svg.dart';
import 'package:withconi/import_basic.dart';
import '../../../controller/community/community_detail_controller.dart';
import '../../widgets/appbar/appbar.dart';
import '../../widgets/button/text_radio_button.dart';
import '../../widgets/post/user_postbox.dart';

class CommunityDetailPage extends StatelessWidget {
  CommunityDetailPage({Key? key}) : super(key: key);
  final CommunityDetailController _controller =
      Get.put(CommunityDetailController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      persistentFooterButtons: [
        Container(
          padding: EdgeInsets.symmetric(horizontal: 10),
          height: 50,
          width: WcWidth,
          child: Row(
            children: [
              CircleAvatar(
                radius: 21,
              ),
              const SizedBox(
                width: 15,
              ),
              Expanded(
                child: GestureDetector(
                  onTap: () {
                    Get.toNamed(Routes.COMMUNITY_NEW_POST);
                  },
                  child: Container(
                    alignment: Alignment.centerLeft,
                    height: 50,
                    color: WcColors.white,
                    child: Text(
                      '새로운 글을 남겨보세요',
                      style: GoogleFonts.notoSans(
                          fontSize: 16, color: WcColors.grey120),
                    ),
                  ),
                ),
              )
            ],
          ),
        )
      ],
      appBar: WcAppBar(
        title: '커뮤니티',
        leading: SvgPicture.asset(
          'assets/icons/arrow_back.svg',
          color: WcColors.grey200,
        ),
        action: SvgPicture.asset(
          'assets/icons/search.svg',
          color: WcColors.grey200,
        ),
        onActionTap: () {
          print('action');
        },
        onLeadingTap: () {
          print('leading');
        },
      ),
      backgroundColor: WcColors.white,
      body: SingleChildScrollView(
        child: SafeArea(
          bottom: false,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: WcWidth,
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
                child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        '갑상선 기능 항진증\n게시판',
                        style: GoogleFonts.notoSans(
                            color: WcColors.black,
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                            height: 1.4),
                      ),
                      GestureDetector(
                        child: Container(
                            alignment: Alignment.topLeft,
                            // color: WcColors.blue100,
                            height: 40,
                            width: 40,
                            child: Padding(
                              padding: EdgeInsets.only(left: 5, top: 6),
                              child: SvgPicture.asset(
                                'assets/icons/info.svg',
                                color: WcColors.grey100,
                              ),
                            )),
                      )
                    ]),
              ),
              Obx(
                () => Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Row(
                    children: _controller.postType
                        .map((type) => WcTextRadioButton(
                              onTap: () {
                                _controller.onPostTypeChanged(type);
                              },
                              selectedValue: _controller.selectedPostType.value,
                              value: type,
                            ))
                        .toList(),
                  ),
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              Obx(
                () => Container(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: DropdownButtonHideUnderline(
                    child: DropdownButton2(
                      // dropdownElevation: 2,
                      buttonPadding: const EdgeInsets.only(left: 10, right: 10),
                      itemPadding: const EdgeInsets.only(left: 10, right: 10),
                      dropdownDecoration: const BoxDecoration(
                          color: WcColors.white,
                          boxShadow: [
                            BoxShadow(
                                color: Color.fromARGB(69, 124, 124, 124),
                                blurRadius: 8,
                                offset: Offset(
                                  0.0, // Move to right 10  horizontally
                                  8.0,
                                )),
                          ]),
                      icon: SvgPicture.asset('assets/icons/arrow_down.svg'),
                      isExpanded: true,
                      hint: Text(
                        'Select Item',
                        style: TextStyle(
                          fontSize: 15,
                          color: Theme.of(context).hintColor,
                        ),
                      ),
                      items: _controller.postSort
                          .map((item) => DropdownMenuItem<String>(
                                value: item,
                                child: Text(
                                  item,
                                  style: GoogleFonts.notoSans(
                                      color: WcColors.black,
                                      fontSize: 15,
                                      fontWeight: FontWeight.w100,
                                      height: 1.5),
                                ),
                              ))
                          .toList(),
                      value: _controller.selectedPostSort.value,
                      onChanged: _controller.onPostSortingChanged,
                      buttonHeight: 45,
                      buttonWidth: 90,
                      itemHeight: 45,
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 8,
              ),
              Column(
                children: _controller.postUser
                    .map((userName) => WcUserPostBox(
                          commentsNum: 23,
                          contents:
                              '고양이가 잘먹는 사요ㅓㅓ먄어래냐ㅓㅐㅓㅑㅐㅓㅑㅓㅑㅐㅓㅑㅓㅑㅐㅓㅓㅑㅐ머 입니다 머머먹이먹미거먇뱓거ㅐㅁ러미ㅓㄱ뱌거갸ㅓ먀ㅏㅍ퍟ㅁ ㅓㅁㄱ임 ㅓㅇㄹㄹ머ㅑㅇㄴ러랴랼냐',
                          likesNum: 12,
                          badgeText: '고양이',
                          uploadAt: '1',
                          userLiked: true,
                          userName: userName,
                          onLikeTap: () {},
                          badgeBackgroundColor: WcColors.blue40,
                          badgeTextColor: WcColors.blue100,
                          onCommentTap: () {},
                          onPostTap: () {},
                        ))
                    .toList(),
              )
            ],
          ),
        ),
      ),
    );
  }
}
