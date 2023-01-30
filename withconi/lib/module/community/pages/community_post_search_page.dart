import 'package:lazy_load_scrollview/lazy_load_scrollview.dart';
import 'package:withconi/module/common/my_lazy_load_scroll_view.dart';
import 'package:withconi/module/community/controllers/community_post_search_controller.dart';
import 'package:withconi/import_basic.dart';
import 'package:withconi/module/community/controllers/custom_state_mixin.dart';
import '../../../data/enums/enum.dart';
import '../../../global_widgets/appbar/search_appbar.dart';
import '../../../global_widgets/button/text_radio_button.dart';
import '../../../global_widgets/error_widget/error_widget.dart';
import '../../../global_widgets/listtile/post_list_tile.dart';
import '../../../global_widgets/loading/loading_page.dart';
import '../../page_status.dart';

class CommunityPostSearchPage extends StatelessWidget {
  CommunityPostSearchPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final CommunityPostSearchController _controller = Get.find();
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
            width: WcWidth(context),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
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
                                selectedValue:
                                    _controller.postSearchFilter.value.postType,
                                value: postType,
                                text: postType.displayName,
                              ))
                          .toList(),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                _getWidgetByState(_controller),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _getWidgetByState(CommunityPostSearchController _controller) {
    return _controller.obx(
        onSuccess: (postListSearched) => Expanded(
              child: MyLazyLoadScrollView(
                isLoading:
                    (_controller.status == const PageStatus.loadingMore() ||
                        _controller.status == const PageStatus.emptyLastPage()),
                onEndOfPage: _controller.loadNextPage,
                child: ListView.builder(
                    // physics: const NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: postListSearched.length,
                    itemBuilder: (context, index) {
                      return PostListTile(
                        post: postListSearched[index],
                        onPostTap: _controller.onPostTap,
                        simple: true,
                        postIndex: index,
                        onLikeTap: (bool) {},
                      );
                    }),
              ),
            ));
  }
}
