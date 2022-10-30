import 'package:flutter_svg/svg.dart';
import 'package:withconi/controller/community/community_main_controller.dart';
import 'package:withconi/import_basic.dart';
import 'package:withconi/module/pages/community/community_setting_page.dart';
import 'package:withconi/module/pages/home/home_page.dart';
import 'package:withconi/module/theme/text_theme.dart';
import 'package:withconi/module/widgets/searchbar/search_bar.dart';
import '../../../data/enums/enum.dart';
import '../../../data/model/post.dart';
import '../../widgets/button/icon_button.dart';
import '../home/widgets/hot_post_listtile.dart';

class CommunityMainPage extends StatelessWidget {
  const CommunityMainPage({Key? key}) : super(key: key);

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
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const SizedBox(
                      height: 20,
                    ),
                    SizedBox(
                      width: WcWidth - 40,
                      height: 50,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text('커뮤니티',
                              style: TextStyle(
                                  fontFamily: WcFontFamily.notoSans,
                                  fontWeight: FontWeight.w600,
                                  fontSize: 25)),
                          WcIconButton(
                              iconHeight: 23,
                              active: true,
                              onTap: _controller.toSettingPage,
                              iconSrc: 'assets/icons/settings.svg',
                              activeIconColor: WcColors.grey160,
                              inactiveIconColor: WcColors.grey160)
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    SearchBarWidget(
                      hintText: '게시판을 검색해보세요',
                      textController: null,
                    ),
                    const SizedBox(
                      height: 40,
                    ),
                    SizedBox(
                      width: WcWidth - 40,
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text('이번주 인기글',
                              style: TextStyle(
                                  fontFamily: WcFontFamily.notoSans,
                                  fontWeight: FontWeight.w500,
                                  height: 1,
                                  fontSize: 18)),
                          const SizedBox(
                            width: 8,
                          ),
                          SvgPicture.asset(
                            'assets/icons/hot.svg',
                            height: 22,
                          )
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Column(
                      children: _controller.hotPostList
                          .map((post) => HotPostListTile(
                                width: WcWidth - 40,
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 10),
                                post: post,
                              ))
                          .toList(),
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    SizedBox(
                      width: WcWidth - 40,
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text('전체 게시판',
                              style: TextStyle(
                                  fontFamily: WcFontFamily.notoSans,
                                  fontWeight: FontWeight.w500,
                                  height: 1,
                                  fontSize: 18)),
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
                                    _controller.toBoardDetailPage(
                                        boardId: board.boardId.toString());
                                  },
                                  child: Container(
                                    alignment: Alignment.centerLeft,
                                    height: 45,
                                    width: WcWidth,
                                    padding:
                                        EdgeInsets.symmetric(horizontal: 30),
                                    child: Text(board.title,
                                        style: TextStyle(
                                            fontFamily: WcFontFamily.notoSans,
                                            fontWeight: FontWeight.w400,
                                            fontSize: 16)),
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
