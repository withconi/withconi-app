import 'package:withconi/module/community/controllers/community_liked_post_controller.dart';
import 'package:withconi/import_basic.dart';
import 'package:withconi/global_widgets/appbar/appbar.dart';
import 'package:withconi/module/ui_model/post_ui_model.dart';

import '../../../global_widgets/listtile/post_list_tile.dart';

class CommunityLikePostPage extends StatelessWidget {
  CommunityLikePostPage({Key? key}) : super(key: key);
  final LikedPostController _controller = Get.find();

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
                      padding: const EdgeInsets.symmetric(
                          horizontal: 22, vertical: 15),
                      child: Row(
                        children: [
                          Text(
                            '${_controller.likedPostList.length}',
                            style: GoogleFonts.workSans(
                              color: WcColors.black,
                              fontSize: 22,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          Text(
                            '개',
                            style: GoogleFonts.workSans(
                              color: WcColors.black,
                              fontSize: 22,
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
                            return PostListTile(
                              liked: _controller.likedPostList[index].isLikeOn,
                              onLikeTap: (p0) {
                                _controller.onLikeChanged(index, p0);
                              },
                              onPostTap: _controller.onPostTap,
                              post: _controller.likedPostList[index],
                              onMoreTap: _controller.onPostMoreTap,
                              postIndex: index,
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
