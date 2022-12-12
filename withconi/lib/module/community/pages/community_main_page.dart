import 'package:withconi/module/community/controllers/community_main_controller.dart';
import 'package:withconi/import_basic.dart';
import 'package:withconi/module/community/controllers/custom_state_mixin.dart';
import 'package:withconi/module/theme/text_theme.dart';
import 'package:withconi/global_widgets/searchbar/search_bar.dart';
import '../../../global_widgets/button/icon_button.dart';
import '../../home/widgets/hot_post_listtile.dart';

class CommunityMainPage extends StatelessWidget {
  const CommunityMainPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final CommunityMainController _controller = Get.find();

    return Scaffold(
      backgroundColor: WcColors.white,
      body: SafeArea(
        bottom: false,
        child: SingleChildScrollView(
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
                        const Text('커뮤니티',
                            style: TextStyle(
                                fontFamily: WcFontFamily.notoSans,
                                fontWeight: FontWeight.w600,
                                fontSize: 25)),
                        WcIconButton(
                            iconHeight: 23,
                            active: true,
                            onTap: _controller.goToSettingPage,
                            iconSrc: 'assets/icons/settings.svg',
                            activeIconColor: WcColors.grey160,
                            inactiveIconColor: WcColors.grey160)
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  _getPageByPageStatus(_controller),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _getPageByPageStatus(CommunityMainController _controller) {
    return _controller.obx(
        onSuccess: (value) => Column(
              children: [
                SearchBarWidget(
                  hintText: '게시판을 검색해보세요',
                  textController: _controller.boardKeywordTextController,
                  onTapClear: _controller.clearResult,
                  onTextChanged: _controller.onBoardKeywordChanged,
                ),
                const SizedBox(
                  height: 40,
                ),
                SizedBox(
                  width: WcWidth - 40,
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const Text('이번주 인기글',
                          style: TextStyle(
                              fontFamily: WcFontFamily.notoSans,
                              fontWeight: FontWeight.w500,
                              height: 1.1,
                              fontSize: 19)),
                      const SizedBox(
                        width: 8,
                      ),
                      Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 9, vertical: 4),
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                            color: WcColors.red20,
                            borderRadius: BorderRadius.circular(20)),
                        child: Text(
                          'HOT',
                          style: GoogleFonts.openSans(
                              height: 1.2,
                              fontSize: 12,
                              letterSpacing: 0.1,
                              color: const Color.fromARGB(255, 213, 25, 0),
                              fontWeight: FontWeight.w700),
                        ),
                      )
                    ],
                  ),
                ),
                const SizedBox(
                  height: 12,
                ),
                Obx(
                  () => ListView.builder(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: _controller.hotPostList.length,
                      itemBuilder: (context, index) => HotPostListTile(
                            width: WcWidth - 40,
                            padding: const EdgeInsets.only(left: 30, right: 10),
                            hotPost: _controller.hotPostList[index],
                            onPostTap: _controller.goToPostDetailPage,
                          )),
                ),
                const SizedBox(
                  height: 30,
                ),
                SizedBox(
                  width: WcWidth - 40,
                  child: const Text('전체 게시판',
                      style: TextStyle(
                          fontFamily: WcFontFamily.notoSans,
                          fontWeight: FontWeight.w500,
                          height: 1,
                          fontSize: 19)),
                ),
                const SizedBox(
                  height: 10,
                ),
                Obx(
                  () => ListView.builder(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: _controller.searchedBoardList.length,
                      itemBuilder: (context, index) => InkWell(
                            onTap: () {
                              _controller.goToBoardDetailPage(
                                  boardIndex: index);
                            },
                            child: Container(
                              alignment: Alignment.centerLeft,
                              height: 45,
                              width: WcWidth,
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 30),
                              child: Row(
                                children: [
                                  Container(
                                    height: 10,
                                    width: 10,
                                    decoration: BoxDecoration(
                                        color: _controller
                                            .searchedBoardList[index]
                                            .diseaseType
                                            .color,
                                        borderRadius: BorderRadius.circular(2)),
                                  ),
                                  const SizedBox(
                                    width: 10,
                                  ),
                                  Text(
                                      _controller
                                          .searchedBoardList[index].title,
                                      style: const TextStyle(
                                          fontFamily: WcFontFamily.notoSans,
                                          height: 1,
                                          fontWeight: FontWeight.w500,
                                          fontSize: 16)),
                                  const Text('질환 게시판',
                                      style: TextStyle(
                                          height: 1,
                                          fontFamily: WcFontFamily.notoSans,
                                          fontWeight: FontWeight.w400,
                                          fontSize: 16)),
                                ],
                              ),
                            ),
                          )),
                ),
                const SizedBox(
                  height: 30,
                )
              ],
            ));
  }
}
