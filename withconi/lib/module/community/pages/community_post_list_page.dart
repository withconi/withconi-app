import 'package:flutter_svg/svg.dart';
import 'package:lazy_load_scrollview/lazy_load_scrollview.dart';
import 'package:withconi/data/enums/enum.dart';
import 'package:withconi/import_basic.dart';
import 'package:withconi/module/common/lazy_load.dart';
import 'package:withconi/module/community/controllers/custom_state_mixin.dart';
import 'package:withconi/module/theme/text_theme.dart';
import 'package:withconi/module/ui_model/post_ui_model.dart';
import '../../../global_widgets/error_widget/error_widget.dart';
import '../../../global_widgets/loading/loading_page.dart';
import '../../page_status.dart';
import '../controllers/community_post_list_controller.dart';
import '../../../global_widgets/appbar/appbar.dart';
import '../../../global_widgets/button/text_radio_button.dart';
import '../../../global_widgets/listtile/post_list_tile.dart';

class CommunityPostListPage extends StatelessWidget {
  CommunityPostListPage({Key? key}) : super(key: key);
  final CommunityPostListController _controller = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      persistentFooterButtons: [
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          height: 50,
          color: WcColors.white,
          width: WcWidth,
          child: Row(
            children: [
              const CircleAvatar(
                radius: 21,
                backgroundColor: WcColors.grey110,
              ),
              const SizedBox(
                width: 15,
              ),
              Expanded(
                child: GestureDetector(
                  onTap: () {
                    _controller.addNewPost();
                  },
                  child: Container(
                    alignment: Alignment.centerLeft,
                    height: 50,
                    color: WcColors.white,
                    child: Text(
                      '새로운 글을 남겨보세요',
                      style: GoogleFonts.notoSans(
                          fontSize: 15, color: WcColors.grey120),
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
        onLeadingTap: () {
          Get.back();
        },
        onActionTap: _controller.onSearchTap,
      ),
      backgroundColor: WcColors.white,
      body: Obx(
        () => RefreshIndicator(
          strokeWidth: 2.5,
          backgroundColor: WcColors.white,
          color: WcColors.blue100,
          onRefresh: _controller.refreshPage,
          child: SingleChildScrollView(
            physics: const AlwaysScrollableScrollPhysics(),
            controller: _controller.infiniteScrollController,
            child: SafeArea(
              bottom: false,
              child: ConstrainedBox(
                constraints: BoxConstraints(minHeight: WcHeight),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      width: WcWidth,
                      padding: const EdgeInsets.symmetric(
                          horizontal: 20, vertical: 15),
                      child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Obx(
                              () => Text(
                                  '${_controller.boardName.value} 질환\n게시판',
                                  style: const TextStyle(
                                      color: WcColors.black,
                                      fontSize: 23,
                                      fontWeight: FontWeight.w500,
                                      height: 1.4,
                                      fontFamily: WcFontFamily.notoSans)),
                            ),
                            GestureDetector(
                              child: Container(
                                  alignment: Alignment.topLeft,
                                  // color: WcColors.blue100,
                                  height: 40,
                                  width: 40,
                                  child: Padding(
                                    padding:
                                        const EdgeInsets.only(left: 5, top: 6),
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
                          children: PostType.values
                              .map((postType) => WcTextRadioButton(
                                    height: 33,
                                    onTap: (value) {
                                      _controller
                                          .onPostTypeChanged(value as PostType);
                                    },
                                    selectedValue: _controller
                                        .postListFilter.value.postType,
                                    value: postType,
                                    text: postType.displayName,
                                  ))
                              .toList(),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    _getWidgetByState(_controller)
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _getWidgetByState(CommunityPostListController _controller) {
    return _controller.obx(
      onSuccess: MyLazyLoadScrollView(
        isLoading: (_controller.status == const PageStatus.loadingMore() ||
            _controller.status == const PageStatus.emptyLastPage()),
        onEndOfPage: _controller.loadNextPage,
        child: ListView.builder(
            cacheExtent: 1000,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: _controller.postUIList.length,
            shrinkWrap: true,
            itemBuilder: ((context, index) {
              PostUIModel thisPost = _controller.postUIList[index];
              return PostListTile(
                post: thisPost,
                onPostTap: _controller.onPostTap,
                liked: thisPost.isLikeOn,
                // onLikeChanged: _controller.onLikeChanged,
                onMoreTap: _controller.onPostMoreTap,
                postIndex: index,
                onLikeTap: (isLiked) {
                  _controller.onLikeChanged(index, isLiked);
                },
                // onCommentTap: () {},
              );
            })),
      ),
      onEmpty: WcErrorWidget(
        height: WcHeight - 400,
        image: Image.asset(
          'assets/icons/no_result.png',
          height: 80,
        ),
        title: '아직 작성된 글이 없어요.',
        message: '첫번째 글을 작성해주시겠어요?',
      ),
    );
  }
}
