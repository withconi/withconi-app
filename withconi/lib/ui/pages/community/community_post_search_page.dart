import 'package:lottie/lottie.dart';
import 'package:withconi/controller/community/community_post_search_controller.dart';
import 'package:withconi/controller/map/map_search_controller.dart';
import 'package:withconi/import_basic.dart';
import 'package:withconi/ui/widgets/appbar/appbar.dart';
import 'package:withconi/ui/widgets/searchbar/search_bar.dart';
import '../../../configs/constants/enum.dart';
import '../../../data/model/post.dart';
import '../../theme/text_theme.dart';
import '../../widgets/appbar/search_appbar.dart';
import '../../widgets/button/text_radio_button.dart';
import '../../widgets/error_widget/error_widget.dart';
import '../../widgets/listtile/post_list_tile.dart';

class CommunityPostSearchPage extends StatelessWidget {
  const CommunityPostSearchPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    CommunityPostSearchController _controller =
        Get.put(CommunityPostSearchController());
    return Scaffold(
      appBar: WcSearchAppBar(
        hintText: '게시글 검색',
        textEditingController: _controller.searchKeywordTextController,
        onClearTap: _controller.clearResult,
        onTextChanged: _controller.onKeywordChanged,
      ),
      resizeToAvoidBottomInset: false,
      backgroundColor: WcColors.white,
      body: SafeArea(
        bottom: false,
        child: Center(
          child: SizedBox(
            width: WcWidth,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
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
                                selectedValue: postType.displayName,
                                value: postType.displayName,
                              ))
                          .toList(),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                _controller.obx(
                    (onSuccessResult) => (onSuccessResult!.isNotEmpty)
                        ? Obx(
                            () => ListView.builder(
                                cacheExtent: 1000,
                                physics: const NeverScrollableScrollPhysics(),
                                itemCount: onSuccessResult.length,
                                shrinkWrap: true,
                                itemBuilder: ((context, index) {
                                  Post thisPost = onSuccessResult[index];
                                  return PostListTile(
                                    post: thisPost,
                                    onPostTap: (post) {},
                                    simple: true,
                                    // onCommentTap: () {},
                                  );
                                })),
                          )
                        : WcErrorWidget(
                            image: Image.asset(
                              'assets/icons/no_result.png',
                              height: 90,
                            ),
                            title: '검색 결과가 없어요',
                            message: '다른 검색어로 다시 시도해 보세요 :)',
                          ),
                    onEmpty: const SizedBox.shrink(),
                    onLoading: SizedBox(
                      height: WcHeight - 240,
                      child: OverflowBox(
                        minHeight: 140,
                        maxHeight: 140,
                        child: Lottie.asset('assets/json/loading.json'),
                      ),
                    ),
                    onError: (error) => WcErrorWidget(
                          image: Image.asset(
                            'assets/icons/no_result.png',
                            height: 90,
                          ),
                          title: error!,
                          message: '',
                        )),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
