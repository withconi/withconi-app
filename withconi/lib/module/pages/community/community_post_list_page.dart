import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter_svg/svg.dart';
import 'package:withconi/data/enums/enum.dart';
import 'package:withconi/import_basic.dart';
import 'package:withconi/module/theme/text_theme.dart';
import '../../../data/enums/enum_color.dart';
import '../../../core/tools/helpers/calculator.dart';
import '../../../controller/community/community_post_list_controller.dart';
import '../../../controller/ui_helper/infinite_scroll.dart';
import '../../../data/model/post.dart';
import '../../widgets/appbar/appbar.dart';
import '../../widgets/button/text_radio_button.dart';
import '../../widgets/listtile/post_list_tile.dart';

class CommunityPostListPage extends StatelessWidget {
  CommunityPostListPage({Key? key}) : super(key: key);
  final CommunityPostListController _controller =
      Get.put(CommunityPostListController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      persistentFooterButtons: [
        Container(
          padding: EdgeInsets.symmetric(horizontal: 10),
          height: 50,
          color: WcColors.white,
          width: WcWidth,
          child: Row(
            children: [
              CircleAvatar(
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
          onRefresh: _controller.resetPage,
          child: SingleChildScrollView(
            physics: const AlwaysScrollableScrollPhysics(),
            controller: _controller.scrollController.value,
            child: SafeArea(
              bottom: false,
              child: ConstrainedBox(
                constraints: BoxConstraints(minHeight: WcHeight),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      width: WcWidth,
                      padding:
                          EdgeInsets.symmetric(horizontal: 20, vertical: 15),
                      child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text('갑상선 기능 항진증\n게시판',
                                style: TextStyle(
                                    color: WcColors.black,
                                    fontSize: 23,
                                    fontWeight: FontWeight.w500,
                                    height: 1.4,
                                    fontFamily: WcFontFamily.notoSans)),
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
                              .map((postType) => WcTextRadioButton(
                                    height: 33,
                                    onTap: () {
                                      _controller.onPostTypeChanged(postType);
                                    },
                                    selectedValue: _controller
                                        .selectedPostType.value.displayName,
                                    value: postType.displayName,
                                  ))
                              .toList(),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    // Obx(
                    //   () => Container(
                    //     padding: const EdgeInsets.symmetric(horizontal: 10),
                    //     child: DropdownButtonHideUnderline(
                    //       child: DropdownButton2(
                    //         // dropdownElevation: 2,
                    //         buttonPadding:
                    //             const EdgeInsets.only(left: 10, right: 10),
                    //         itemPadding:
                    //             const EdgeInsets.only(left: 10, right: 10),
                    //         dropdownDecoration: const BoxDecoration(
                    //             color: WcColors.white,
                    //             boxShadow: [
                    //               BoxShadow(
                    //                   color: Color.fromARGB(69, 124, 124, 124),
                    //                   blurRadius: 8,
                    //                   offset: Offset(
                    //                     0.0, // Move to right 10  horizontally
                    //                     8.0,
                    //                   )),
                    //             ]),
                    //         icon: SvgPicture.asset('assets/icons/arrow_down.svg'),
                    //         isExpanded: true,

                    //         items: _controller.postSort
                    //             .map((sortType) => DropdownMenuItem<String>(
                    //                   value: sortTypeToKorean(sortType),
                    //                   child: Text(
                    //                     sortTypeToKorean(sortType),
                    //                     style: GoogleFonts.notoSans(
                    //                         color: WcColors.black,
                    //                         fontSize: 14,
                    //                         fontWeight: FontWeight.w100,
                    //                         height: 1.3),
                    //                   ),
                    //                 ))
                    //             .toList(),
                    //         value: sortTypeToKorean(
                    //             _controller.selectedSortType.value),
                    //         onChanged: _controller.onSortTypeChanged,
                    //         buttonHeight: 45,
                    //         buttonWidth: 90,
                    //         itemHeight: 45,
                    //       ),
                    //     ),
                    //   ),
                    // ),
                    // const SizedBox(
                    //   height: 8,
                    // ),
                    Obx(
                      () => ListView.builder(
                          cacheExtent: 1000,
                          physics: const NeverScrollableScrollPhysics(),
                          itemCount: _controller.postList.length,
                          shrinkWrap: true,
                          itemBuilder: ((context, index) {
                            Post thisPost = _controller.postList[index];
                            return PostListTile(
                              post: thisPost,
                              onPostTap: _controller.onPostTap,
                              liked: _controller.likePostIdList
                                  .contains(thisPost.postId),
                              onLikeChanged: _controller.onLikeChanged,
                              onMoreTap: _controller.onPostMoreTap,
                              // onCommentTap: () {},
                            );
                          })),
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