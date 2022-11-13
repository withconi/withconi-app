import 'package:flutter_svg/svg.dart';
import 'package:lazy_load_scrollview/lazy_load_scrollview.dart';
import 'package:lottie/lottie.dart';
import 'package:withconi/module/common/controllers/disease_search_controller.dart';
import 'package:withconi/import_basic.dart';
import 'package:withconi/module/signup/widgets/disease_selection_list_button.dart';
import 'package:withconi/global_widgets/searchbar/search_bar.dart';
import '../../global_widgets/button/wide_button.dart';
import '../../global_widgets/error_widget/error_widget.dart';
import '../../global_widgets/loading/loading_page.dart';
import '../page_status.dart';
import '../signup/widgets/disease_item_box.dart';

class DiseaseSearchPage extends StatelessWidget {
  const DiseaseSearchPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    DiseaseSearchController _controller = Get.put(DiseaseSearchController());
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: WcColors.white,
      floatingActionButton: WcWideButtonWidget(
        active: true,
        activeButtonColor: WcColors.blue100,
        activeTextColor: WcColors.white,
        buttonText: '완료',
        buttonWidth: WcWidth - 40,
        onTap: () {
          _controller.saveDiseases();
        },
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      body: SafeArea(
        bottom: false,
        child: Center(
          child: SizedBox(
            width: WcWidth,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const SizedBox(
                  height: 15,
                ),
                SearchBarWidget(
                  hintText: '질병 검색',
                  onTextChanged: _controller.onDiseaseChanged,
                  onTapAction: _controller.clearResult,
                  textController: _controller.diseaseTextController,
                ),
                const SizedBox(
                  height: 20,
                ),
                SizedBox(
                    width: WcWidth - 40,
                    child: Obx(() => Wrap(
                        runSpacing: 8,
                        spacing: 8,
                        direction: Axis.horizontal,
                        children: (_controller.diseaseListSelected.isNotEmpty)
                            ? _controller.diseaseListSelected
                                .map((value) => DiseaseItemBox(
                                      diseaseName: value.name,
                                      onTap: () {
                                        _controller.onDiseaseClicked(_controller
                                            .diseaseListSelected
                                            .indexOf(value));
                                      },
                                    ))
                                .toList()
                            : []))),
                const SizedBox(
                  height: 10,
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

  Widget _getWidgetByState(
      InfiniteScrollPageStatus status, DiseaseSearchController _controller) {
    return status.maybeWhen(
      init: () => SizedBox.shrink(),
      loading: () => LoadingPage(),
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
          itemCount: _controller.diseaseListSearched.length,
          itemBuilder: (context, index) => DiseaseListTileButton(
            disease: _controller.diseaseListSearched[index],
            onTap: _controller.onDiseaseClicked,
            selected: _controller.diseaseListSelected
                .contains(_controller.diseaseListSearched[index]),
            width: WcWidth,
            diseaseIndex: index,
          ),
        ),
      ),
    );
  }
}
