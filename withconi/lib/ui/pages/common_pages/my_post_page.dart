import 'package:withconi/controller/common_controller/my_post_controller.dart';
import 'package:withconi/import_basic.dart';
import '../../widgets/appbar/appbar.dart';
import '../../widgets/listtile/post_list_tile.dart';

class MyPostPage extends StatelessWidget {
  MyPostPage({Key? key}) : super(key: key);
  final MyPostPageController _controller = Get.put(MyPostPageController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: WcAppBar(
        title: '',
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
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    width: WcWidth,
                    padding: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
                    child: Text(
                      '내가 쓴 글',
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
                          '${_controller.userPostList.length}',
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
                        itemCount: _controller.userPostList.length,
                        shrinkWrap: true,
                        itemBuilder: ((context, index) {
                          return WcUserPostListTile(
                            commentsNum: 23,
                            contents: _controller.userPostList[index].content,
                            likesNum: 12,
                            postType: _controller.userPostList[index].postType,
                            uploadAt: _controller.uploadAtStr(index),
                            liked: _controller.isLiked.value,
                            authorName:
                                _controller.userPostList[index].nickname,
                            onLikeChanged: (_) {},
                            blockLikeButton: true,
                            onLikeTap: _controller.onLikeTap,
                            badgeBackgroundColor:
                                _controller.badgeBackgroundColor(index),
                            badgeTextColor: _controller.badgeTextColor(index),
                            onCommentTap: () {
                              _controller.onLikeTap();
                            },
                            onPostTap: () {
                              Get.toNamed(Routes.COMMUNITY_POST_DETAIL);
                            },
                            activeMore: true,
                            images: _controller.images,
                            onMoreTap: () {
                              Get.toNamed(Routes.COMMUNITY_POST_EDIT,
                                  arguments: _controller.userPostList[index]);
                            },
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
