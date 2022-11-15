import 'package:lazy_load_scrollview/lazy_load_scrollview.dart';
import 'package:withconi/module/community/controllers/community_post_search_controller.dart';
import 'package:withconi/import_basic.dart';
import '../../../data/enums/enum.dart';
import '../../../global_widgets/appbar/search_appbar.dart';
import '../../../global_widgets/button/text_radio_button.dart';
import '../../../global_widgets/error_widget/error_widget.dart';
import '../../../global_widgets/listtile/post_list_tile.dart';
import '../../../global_widgets/loading/loading_page.dart';
import '../../page_status.dart';

class CommunityPostSearchPage extends StatelessWidget {
  CommunityPostSearchPage({Key? key}) : super(key: key);
  CommunityPostSearchController _controller = Get.find();
  @override
  Widget build(BuildContext context) {
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
                Obx(() => _getWidgetByState(
                    _controller.pageStatus.value, _controller)),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _getWidgetByState(InfiniteScrollPageStatus status,
      CommunityPostSearchController _controller) {
    return status.maybeWhen(
      init: () => SizedBox.shrink(),
      loading: () => LoadingPage(
        height: WcHeight - 300,
      ),
      empty: () => WcErrorWidget(
        image: Image.asset(
          'assets/icons/no_result.png',
          height: 90,
        ),
        title: '검색 결과가 없습니다',
        message: '다른 검색어로 시도해주세요 :)',
      ),
      error: (message) => WcErrorWidget(
        image: Image.asset(
          'assets/icons/no_result.png',
          height: 90,
        ),
        title: message,
        message: '',
      ),
      orElse: () => LazyLoadScrollView(
        isLoading: (status == const InfiniteScrollPageStatus.loadingMore() ||
            status == const InfiniteScrollPageStatus.emptyLastPage()),
        onEndOfPage: _controller.loadNextPage,
        child: ListView.builder(
            shrinkWrap: true,
            itemCount: _controller.postListSearched.length,
            itemBuilder: (context, index) {
              return PostListTile(
                post: _controller.postListSearched[index],
                onPostTap: (post) {},
                simple: true,
                postIndex: index,
                onLikeTap: (bool) {},
              );
            }),
      ),
    );
  }
}
