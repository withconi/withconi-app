import 'package:carousel_indicator/carousel_indicator.dart';
import 'package:carousel_slider/carousel_slider.dart';

import '../../../data/enums/enum.dart';
import '../../../global_widgets/badge/badge.dart';
import '../../../global_widgets/button/icon_button.dart';
import '../../../global_widgets/button/icon_text_button.dart';
import '../../../global_widgets/listtile/post_list_tile.dart';
import '../../../global_widgets/photo_gallary/photo_gallary.dart';
import '../../../import_basic.dart';
import '../../theme/text_theme.dart';
import '../../ui_model/post_ui_model.dart';
import 'more_tap_bottom_sheet.dart';

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

  void Function(PostUIModel, MoreBottomSheetOption?) onMoreTap;

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
                          backgroundColor: WcColors.grey110.withOpacity(0.6),
                          backgroundImage: post.profileImage.getImageByType),
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
                                            Color.fromARGB(30, 0, 0, 0),
                                            Color.fromARGB(15, 0, 0, 0),
                                          ],
                                          stops: [
                                            0.3,
                                            1,
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
                                top: 10,
                                right: 10,
                                child: Icon(
                                  Icons.photo_library_rounded,
                                  color: WcColors.white,
                                  shadows: [
                                    BoxShadow(
                                        offset: const Offset(0, 0),
                                        color: WcColors.black.withOpacity(0.4),
                                        blurRadius: 6,
                                        spreadRadius: -1)
                                  ],
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
                                  width: 15,
                                  height: 4,
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
                Padding(
                  padding: EdgeInsets.only(top: 5, bottom: 10),
                  child: Text(
                    post.content,
                    // readOnly: true,
                    // controller: TextEditingController(text: post.content),
                    style: TextStyle(
                        fontFamily: WcFontFamily.notoSans,
                        color: WcColors.black,
                        fontSize: 15,
                        fontWeight: FontWeight.w400,
                        height: 1.6),
                    maxLines: 100,
                    // minLines: 1,
                  ),
                ),
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
                    MoreBottomSheetOption? selectedOption =
                        await showMoreBottomSheet(
                            authorId: post.authorId,
                            authorName: post.nickname,
                            bottomSheetFor: BottomSheetFor.post);

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
