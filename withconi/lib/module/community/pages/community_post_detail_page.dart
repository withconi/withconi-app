import 'package:carousel_indicator/carousel_indicator.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter_svg/svg.dart';
import 'package:withconi/import_basic.dart';
import 'package:withconi/module/theme/text_theme.dart';
import 'package:withconi/global_widgets/button/icon_button.dart';
import 'package:withconi/global_widgets/button/like_button.dart';
import 'package:withconi/global_widgets/listtile/comment_list_tile.dart';
import 'package:withconi/global_widgets/loading/loading_page.dart';
import 'package:withconi/global_widgets/photo_gallary/image_item.dart';
import 'package:withconi/module/ui_model/comment_ui_model.dart';
import 'package:withconi/module/ui_model/post_ui_model.dart';
import '../../../data/enums/enum.dart';
import '../../../core/tools/helpers/calculator.dart';
import '../../../global_widgets/listtile/post_list_tile.dart';
import '../../auth/auth_controller.dart';
import '../controllers/community_post_detail_controller.dart';
import '../widgets/more_tap_bottom_sheet.dart';

import '../../../global_widgets/appbar/appbar.dart';
import '../../../global_widgets/badge/badge.dart';
import '../../../global_widgets/button/icon_text_button.dart';
import '../../../global_widgets/photo_gallary/photo_gallary.dart';

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
                  mini: false,
                  child: const Icon(
                    Icons.comment,
                    size: 25,
                  ),
                  backgroundColor: WcColors.black.withOpacity(0.25),
                  onPressed: _controller.animateToCommentSection),
              persistentFooterButtons: [
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 10),
                  height: 50,
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
                            _controller.addComment();
                          },
                          child: Container(
                            alignment: Alignment.centerLeft,
                            height: 50,
                            color: WcColors.white,
                            child: Text(
                              '댓글을 남겨보세요',
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
                onLeadingTap: () {
                  Get.back();
                },
              ),
              backgroundColor: WcColors.white,
              body: SingleChildScrollView(
                // onEndOfPage: () {},
                // isLoading: _controller.lastPage,
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
                          margin: EdgeInsets.only(top: 25, left: 20, bottom: 5),
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
            ),
    );
  }
}

class PostDetail extends StatelessWidget {
  PostDetail({
    Key? key,
    required this.post,
    required this.currentImageIndex,
    required this.commentNum,
    required this.onPageChanged,
    required this.onLikeTap,
    required this.onMoreTap,
  }) : super(key: key);

  PostUIModel post;
  int currentImageIndex;
  void Function(int) onPageChanged;
  void Function(bool) onLikeTap;
  int commentNum;

  void Function(PostUIModel, MoreOption?) onMoreTap;

  String uploadAtStr(DateTime createdAt) =>
      TimeCalculator().calculateUploadAt(createdAt);
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      // width: WcWidth - 40,
      child: Column(
        children: [
          SizedBox(
            width: WcWidth - 40,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      margin: EdgeInsets.only(top: 2),
                      child: CircleAvatar(
                        radius: 16,
                        backgroundColor: WcColors.grey110,
                      ),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Text(
                      post.nickname,
                      style: TextStyle(
                          fontFamily: WcFontFamily.notoSans,
                          color: WcColors.grey200,
                          fontSize: 15,
                          fontWeight: FontWeight.w600,
                          height: 0.98),
                    ),
                    Text(
                      ' • ${post.uploadAtStr}',
                      style: TextStyle(
                          fontFamily: WcFontFamily.notoSans,
                          color: WcColors.grey140,
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                          height: 1.2),
                    ),
                    SizedBox(
                      width: 4,
                    ),
                    WcBadge(
                      text: '고양이',
                      textSize: 13,
                      backgroundColor: WcColors.blue40,
                      textColor: WcColors.blue100,
                      width: 60,
                      height: 26,
                    ),
                  ],
                ),
                // SizedBox(
                //   height: 10,
                // ),
                Offstage(
                  offstage: post.images.isEmpty,
                  child: Container(
                    margin: EdgeInsets.only(top: 10),
                    height: 180,
                    child: Material(
                      clipBehavior: Clip.antiAlias,
                      shape: RoundedRectangleBorder(
                          // side: BorderSide(color: Colors.blue), if you need
                          borderRadius:
                              BorderRadius.all(Radius.circular(10.0))),
                      child: Stack(
                        children: [
                          GestureDetector(
                            onTap: () {
                              PhotoView().openPhotoView(
                                  currentImageIndex, post.images);
                            },
                            child: SizedBox(
                              height: 180,
                              width: WcWidth - 40,
                              child: CarouselSlider(
                                options: CarouselOptions(
                                    enableInfiniteScroll: false,
                                    onPageChanged: (index, reason) {
                                      onPageChanged.call(index);
                                    },
                                    height: 180.0,
                                    viewportFraction: 1),
                                items: post.images.map((image) {
                                  return Container(
                                    width: WcWidth - 40,
                                    foregroundDecoration: const BoxDecoration(
                                      gradient: LinearGradient(
                                          begin: Alignment.topCenter,
                                          end: Alignment.bottomCenter,
                                          colors: [
                                            Color.fromARGB(14, 0, 0, 0),
                                            Colors.transparent,
                                            Colors.transparent,
                                            Color.fromARGB(14, 0, 0, 0),
                                          ],
                                          stops: [
                                            0.0,
                                            0.2,
                                            0.8,
                                            1
                                            // 1
                                          ]),
                                    ),
                                    decoration: BoxDecoration(
                                      image: DecorationImage(
                                          fit: BoxFit.cover,
                                          image: image.getImageByType),
                                    ),
                                  );
                                }).toList(),
                              ),
                            ),
                          ),
                          Visibility(
                            visible: post.images.length > 1,
                            child: Positioned(
                                top: 7,
                                right: 7,
                                child: Image.asset(
                                  'assets/icons/image_multiple.png',
                                  colorBlendMode: BlendMode.luminosity,
                                  width: 20,
                                )),
                          ),
                          Visibility(
                            visible: post.images.length > 1,
                            child: Positioned(
                              bottom: 15,
                              child: Container(
                                alignment: Alignment.center,
                                width: WcWidth - 40,
                                child: CarouselIndicator(
                                  animationDuration: 200,
                                  color: Color.fromARGB(119, 255, 255, 255),
                                  width: 12,
                                  height: 5,
                                  count: (post.images.isEmpty)
                                      ? 1
                                      : post.images.length,
                                  index: currentImageIndex,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 8,
                ),
                TextField(
                    readOnly: true,
                    controller: TextEditingController(text: post.content),
                    style: TextStyle(
                        fontFamily: WcFontFamily.notoSans,
                        color: WcColors.black,
                        fontSize: 15,
                        fontWeight: FontWeight.w400,
                        height: 1.6),
                    maxLines: 100,
                    minLines: 1,
                    decoration: InputDecoration(
                      border: InputBorder.none,
                    )),
              ],
            ),
          ),
          Container(
            height: 30,
            margin: EdgeInsets.only(left: 20, bottom: 15),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    WcLikeButton(
                      likeNum: post.likeNum,
                      isLikeOn: post.isLikeOn,
                      onLikeTap: (p0) => onLikeTap.call(p0),
                    ),
                    WcIconTextButton(
                      active: true,
                      activeIconColor: WcColors.grey100,
                      iconSrc: 'assets/icons/comment.svg',
                      inactiveIconColor: WcColors.grey100,
                      onTap: () {},
                      text: commentNum.toString(),
                      iconHeight: 19,
                    ),
                  ],
                ),
                WcIconButton(
                  active: true,
                  activeIconColor: WcColors.grey100,
                  iconSrc: 'assets/icons/dots.svg',
                  iconHeight: 23,
                  inactiveIconColor: WcColors.grey100,
                  onTap: () async {
                    MoreOption? selectedOption = await showMoreBottomSheet(
                      authorId: post.authorId,
                      authorName: post.nickname,
                    );

                    onMoreTap.call(post, selectedOption);
                  },
                  touchWidth: 43,
                  touchHeight: 30,
                  iconMainAxisAlignment: MainAxisAlignment.start,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
