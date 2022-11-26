import 'package:flutter_svg/svg.dart';
import 'package:lazy_load_scrollview/lazy_load_scrollview.dart';
import 'package:withconi/module/common/controllers/disease_search_controller.dart';
import 'package:withconi/import_basic.dart';
import 'package:withconi/module/common/lazy_load.dart';
import 'package:withconi/module/community/controllers/custom_state_mixin.dart';
import 'package:withconi/module/signup/widgets/disease_selection_list_button.dart';
import 'package:withconi/global_widgets/searchbar/search_bar.dart';
import '../../global_widgets/button/wide_button.dart';
import '../page_status.dart';
import '../signup/widgets/disease_item_box.dart';

class DiseaseSearchPage extends StatelessWidget {
  const DiseaseSearchPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    DiseaseSearchController _controller = Get.find();
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
                onTapClear: _controller.clearResult,
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
                                      _controller.onDiseaseClicked(value);
                                    },
                                    diseaseType: value.diseaseType,
                                  ))
                              .toList()
                          : []))),
              const SizedBox(
                height: 10,
              ),
              _getWidgetByState(_controller),
              const SizedBox(
                height: 65,
              ),
              // Obx(
              //   () => Expanded(
              //     child: ListView.builder(
              //       controller: _controller.infiniteScrollController,
              //       // physics: const NeverScrollableScrollPhysics(),
              //       physics: const AlwaysScrollableScrollPhysics(),
              //       // scrollDirection: Axis.vertical,
              //       shrinkWrap: true,
              //       itemCount: _controller.diseaseListSearched.length,
              //       itemBuilder: (context, index) => DiseaseListTileButton(
              //         disease: _controller.diseaseListSearched[index],
              //         onTap: _controller.onDiseaseClicked,
              //         searchKeyword: _controller.diseaseKeywords,
              //         selected: _controller.diseaseListSelected.any((element) =>
              //             element.code ==
              //             _controller.diseaseListSearched[index].code),
              //         width: WcWidth,
              //         diseaseIndex: index,
              //       ),
              //     ),
              //   ),
              // ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _getWidgetByState(DiseaseSearchController _controller) {
    return _controller.obx(
      onSuccess: Expanded(
        child: MyLazyLoadScrollView(
          isLoading: (_controller.status == const PageStatus.loadingMore() ||
              _controller.status == const PageStatus.emptyLastPage()),
          onEndOfPage: () => _controller.loadNextPage(),
          child: Obx(
            () => ListView.builder(
              shrinkWrap: true,
              itemCount: _controller.diseaseListSearched.length,
              itemBuilder: (context, index) => DiseaseSeletionButton(
                disease: _controller.diseaseListSearched[index],
                onTap: _controller.onDiseaseClicked,
                searchKeyword: _controller.diseaseKeywords,
                selected: _controller.diseaseListSelected.any((element) =>
                    element.code ==
                    _controller.diseaseListSearched[index].code),
                width: WcWidth,
                diseaseIndex: index,
                onDiseaseInfoTap: (disease) {
                  Get.toNamed(Routes.DICTIONARY_DETAIL, arguments: disease);
                },
              ),
            ),
          ),
        ),
      ),
    );
  }
}
