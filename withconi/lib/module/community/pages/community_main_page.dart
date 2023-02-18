import 'package:skeletons/skeletons.dart';
import 'package:withconi/module/community/controllers/community_main_controller.dart';
import 'package:withconi/import_basic.dart';
import 'package:withconi/module/community/controllers/custom_state_mixin.dart';
import 'package:withconi/module/theme/text_theme.dart';
import 'package:withconi/global_widgets/searchbar/search_bar.dart';
import '../../../global_widgets/button/icon_button.dart';
import '../../../global_widgets/button/icon_text_button.dart';
import '../../../global_widgets/listtile/post_list_tile.dart';
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
              width: WcWidth(context),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const SizedBox(
                    height: 20,
                  ),
                  SizedBox(
                    width: WcWidth(context) - 40,
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
                  width: WcWidth(Get.context!) - 40,
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
                Obx(() => (_controller.hotPostList.isEmpty)
                    ? ListView.builder(
                        shrinkWrap: true,
                        itemCount: 5,
                        itemBuilder: (context, index) => Padding(
                          padding:
                              EdgeInsets.symmetric(horizontal: 30, vertical: 9),
                          child: SkeletonItem(
                              child: Row(
                            children: [
                              SkeletonLine(
                                style: SkeletonLineStyle(
                                    height: 14,
                                    width: 55,
                                    borderRadius: BorderRadius.circular(6)),
                              ),
                              SizedBox(
                                width: 8,
                              ),
                              SkeletonLine(
                                style: SkeletonLineStyle(
                                    randomLength: true,
                                    height: 14,
                                    maxLength: WcWidth(context) - 130,
                                    minLength: WcWidth(context) / 2,
                                    borderRadius: BorderRadius.circular(8)),
                              ),
                            ],
                          )),
                        ),
                      )
                    : SizedBox(
                        height: 130,
                        child: ListView.separated(
                            separatorBuilder: (context, index) => SizedBox(
                                  width: 10,
                                ),
                            shrinkWrap: true,
                            scrollDirection: Axis.horizontal,
                            itemCount: _controller.hotPostList.length,
                            itemBuilder: (context, index) {
                              var hotPost = _controller.hotPostList[index];
                              return Container(
                                margin: EdgeInsets.only(
                                    right: (index ==
                                            _controller.hotPostList.length - 1)
                                        ? 17
                                        : 0,
                                    left: (index == 0) ? 17 : 0),
                                child: HotPostListTile(
                                    hotPost: hotPost,
                                    onPostTap: _controller.goToPostDetailPage),
                              );
                            }),
                      )),
                const SizedBox(
                  height: 30,
                ),
                SizedBox(
                  width: WcWidth(Get.context!) - 40,
                  child: const Text('즐겨찾는 게시판',
                      style: TextStyle(
                          fontFamily: WcFontFamily.notoSans,
                          fontWeight: FontWeight.w500,
                          height: 1,
                          fontSize: 19)),
                ),
                const SizedBox(
                  height: 30,
                ),
                SizedBox(
                  width: WcWidth(Get.context!) - 40,
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
                Obx(() => (_controller.boardList.isEmpty)
                    ? ListView.builder(
                        shrinkWrap: true,
                        itemCount: 10,
                        itemBuilder: (context, index) => Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal: 30, vertical: 13),
                          child: SkeletonItem(
                              child: Row(
                            children: [
                              SkeletonLine(
                                style: SkeletonLineStyle(
                                    height: 18,
                                    width: 55,
                                    borderRadius: BorderRadius.circular(5)),
                              ),
                              SizedBox(
                                width: 8,
                              ),
                              SkeletonLine(
                                style: SkeletonLineStyle(
                                    randomLength: true,
                                    height: 18,
                                    maxLength: WcWidth(context) - 130,
                                    minLength: WcWidth(context) / 2,
                                    borderRadius: BorderRadius.circular(8)),
                              ),
                            ],
                          )),
                        ),
                      )
                    : Container(
                        margin: EdgeInsets.symmetric(horizontal: 17),
                        child: GridView.builder(
                            shrinkWrap: true,
                            itemCount: _controller.searchedBoardList.length,
                            physics: NeverScrollableScrollPhysics(),
                            gridDelegate:
                                const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 3, //1 개의 행에 보여줄 item 개수
                              childAspectRatio:
                                  1.4 / 1.3, //item 의 가로 1, 세로 2 의 비율
                              mainAxisSpacing: 10, //수평 Padding
                              crossAxisSpacing: 10, //수직 Padding
                            ),
                            itemBuilder: (context, index) {
                              var board = _controller.searchedBoardList[index];
                              return GestureDetector(
                                onTap: () => _controller.goToBoardDetailPage(
                                    boardIndex: index),
                                child: Container(
                                  decoration: BoxDecoration(
                                      color: WcColors.grey20,
                                      borderRadius: BorderRadius.circular(10)),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      Image.asset(
                                        board.diseaseType.iconUrl,
                                        height: 38,
                                      ),
                                      SizedBox(
                                        height: 12,
                                      ),
                                      Text(board.diseaseType.displayName,
                                          style: TextStyle(
                                              fontFamily: WcFontFamily.notoSans,
                                              fontWeight: FontWeight.w500,
                                              height: 1,
                                              fontSize: 15)),
                                    ],
                                  ),
                                ),
                              );
                            }),
                      )),
                const SizedBox(
                  height: 30,
                )
              ],
            ));
  }
}
