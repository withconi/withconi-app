import 'package:flutter_svg/svg.dart';
import 'package:withconi/import_basic.dart';
import 'package:withconi/module/theme/text_theme.dart';

import 'package:withconi/global_widgets/listtile/comment_list_tile.dart';
import 'package:withconi/global_widgets/loading/loading_page.dart';

import 'package:withconi/module/ui_model/comment_ui_model.dart';

import '../controllers/community_post_detail_controller.dart';
import '../widgets/community_post_detail_widget.dart';

import '../../../global_widgets/appbar/appbar.dart';

class CommunityPostDetailPage extends StatelessWidget {
  CommunityPostDetailPage({Key? key}) : super(key: key);
  final CommunityPostDetailController _controller = Get.find();

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => (_controller.postLoading.value)
          ? LoadingPage()
          : Scaffold(
              resizeToAvoidBottomInset: false,
              floatingActionButton: FloatingActionButton(
                  focusElevation: 0,
                  disabledElevation: 0,
                  highlightElevation: 0,
                  hoverElevation: 0,
                  elevation: 0,
                  mini: false,
                  child: const Icon(
                    Icons.comment,
                    size: 25,
                  ),
                  backgroundColor: WcColors.black.withOpacity(0.35),
                  onPressed: _controller.animateToCommentSection),
              persistentFooterButtons: [
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 8),
                  height: 50,
                  width: WcWidth,
                  child: Row(
                    children: [
                      CircleAvatar(
                        radius: 21,
                        backgroundColor: WcColors.grey110.withOpacity(0.6),
                        backgroundImage:
                            _controller.userProfileImage.getImageByType,
                      ),
                      const SizedBox(
                        width: 15,
                      ),
                      Expanded(
                        child: GestureDetector(
                          onTap: () {
                            _controller.addComment();
                          },
                          child: Container(
                            alignment: Alignment.centerLeft,
                            height: 50,
                            color: WcColors.white,
                            child: Text(
                              '댓글을 남겨보세요',
                              style: TextStyle(
                                  fontFamily: WcFontFamily.notoSans,
                                  fontSize: 15,
                                  color: WcColors.grey120),
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                )
              ],
              appBar: WcAppBar(
                title:
                    _controller.thisPost.value.diseaseType.displayName + ' 게시판',
                // '커뮤니티',
                leading: SvgPicture.asset(
                  'assets/icons/arrow_back.svg',
                  color: WcColors.grey200,
                ),
                onActionTap: (_controller.fromRootPage)
                    ? _controller.goToPostListPage
                    : null,
                action: (_controller.fromRootPage)
                    ? Icon(
                        Icons.list,
                        size: 27,
                      )
                    : null,
              ),
              backgroundColor: WcColors.white,
              body: RefreshIndicator(
                strokeWidth: 2.5,
                backgroundColor: WcColors.white,
                color: WcColors.blue100,
                onRefresh: _controller.refreshPage,
                child: SingleChildScrollView(
                  controller: _controller.scrollController,
                  child: SafeArea(
                    bottom: false,
                    child: ConstrainedBox(
                      constraints: BoxConstraints(minHeight: WcHeight),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            decoration: BoxDecoration(
                                border: Border(
                                    bottom: BorderSide(
                                        width: 1, color: WcColors.grey80))),
                            width: WcWidth,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                SizedBox(
                                  height: 25,
                                ),
                                Obx(
                                  () => PostDetail(
                                    commentNum: _controller.commentList.length,
                                    currentImageIndex:
                                        _controller.currentImageIndex.value,
                                    onLikeTap: _controller.onLikeChanged,
                                    onPageChanged: _controller.onPageChanged,
                                    post: _controller.thisPost.value,
                                    onMoreTap: _controller.onPostMoreTap,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Container(
                            key: _controller.commentWidgetKey,
                            alignment: Alignment.bottomLeft,
                            margin:
                                EdgeInsets.only(top: 25, left: 20, bottom: 5),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                Text('댓글',
                                    style: TextStyle(
                                        fontFamily: WcFontFamily.notoSans,
                                        fontWeight: FontWeight.w600,
                                        height: 1,
                                        fontSize: 19)),
                                SizedBox(
                                  width: 5,
                                ),
                                Text('${_controller.commentList.length}',
                                    style: GoogleFonts.workSans(
                                        fontWeight: FontWeight.w400,
                                        color: WcColors.black,
                                        height: 1,
                                        fontSize: 20)),
                              ],
                            ),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          Obx(() {
                            return ListView.builder(
                                shrinkWrap: true,
                                physics: const NeverScrollableScrollPhysics(),
                                itemCount: _controller.commentList.length,
                                itemBuilder: ((context, index) {
                                  CommentUIModel thisComment =
                                      _controller.commentList[index];
                                  return WcCommentListTile(
                                    liked: thisComment.isLikeOn,
                                    onLikeTap: (like) {
                                      _controller.updateCommentLike(
                                          commentIndex: index, isLiked: like);
                                    },
                                    onMoreTap: _controller.onCommentMoreTap,
                                    comment: thisComment,
                                  );
                                }));
                          }),
                          SizedBox(
                            height: 60,
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              )),
    );
  }
}
