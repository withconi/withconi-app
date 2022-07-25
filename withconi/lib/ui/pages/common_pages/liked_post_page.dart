import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter_svg/svg.dart';
import 'package:withconi/configs/constants/enum.dart';
import 'package:withconi/controller/common_controller/liked_post_controller.dart';
import 'package:withconi/import_basic.dart';
import 'package:withconi/ui/widgets/appbar/appbar.dart';

import '../../widgets/listtile/post_list_tile.dart';

class LikedPostPage extends StatelessWidget {
  LikedPostPage({Key? key}) : super(key: key);
  final LikedPostController _controller = Get.put(LikedPostController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: WcAppBar(title: ''),
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
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    width: WcWidth,
                    padding: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
                    child: Text(
                      '내가 좋아한 글',
                      style: GoogleFonts.notoSans(
                          color: WcColors.black,
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                          height: 1.4),
                    ),
                  ),
                  Container(
                    width: WcWidth,
                    padding: EdgeInsets.symmetric(horizontal: 22, vertical: 15),
                    child: Row(
                      children: [
                        Text(
                          '${_controller.likedPostList.length}',
                          style: GoogleFonts.montserrat(
                            color: WcColors.black,
                            fontSize: 21,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        Text(
                          '개',
                          style: GoogleFonts.montserrat(
                            color: WcColors.black,
                            fontSize: 21,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Obx(
                    () => ListView.builder(
                        cacheExtent: 1000,
                        physics: const NeverScrollableScrollPhysics(),
                        itemCount: _controller.likedPostList.length,
                        shrinkWrap: true,
                        itemBuilder: ((context, index) {
                          return WcUserPostListTile(
                            commentsNum: 23,
                            contents: _controller.likedPostList[index].content,
                            likesNum: 12,
                            postType:
                                _controller.likedPostList[index].speciesType,
                            uploadAt: _controller.uploadAtStr(index),
                            liked: _controller.likedPostList
                                .contains(_controller.likedPostList[index]),
                            authorName:
                                _controller.likedPostList[index].nickname,
                            onLikeChanged: (_) {},
                            badgeBackgroundColor:
                                _controller.badgeBackgroundColor(index),
                            badgeTextColor: _controller.badgeTextColor(index),
                            onCommentTap: () {},
                            onPostTap: () {
                              Get.toNamed(Routes.COMMUNITY_POST_DETAIL);
                            },
                            activeMore: true,
                          );
                        })),
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
