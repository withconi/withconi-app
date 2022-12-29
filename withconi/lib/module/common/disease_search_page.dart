import 'package:flutter_svg/svg.dart';
import 'package:lazy_load_scrollview/lazy_load_scrollview.dart';
import 'package:withconi/module/common/controllers/disease_search_controller.dart';
import 'package:withconi/import_basic.dart';
import 'package:withconi/module/common/my_lazy_load_scroll_view.dart';
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
        child: Container(
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
                height: 70,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _getWidgetByState(DiseaseSearchController _controller) {
    return _controller.obx(
      onSuccess: (diseaseList) => Expanded(
        child: MyLazyLoadScrollView(
          isLoading: (_controller.status == const PageStatus.loadingMore() ||
              _controller.status == const PageStatus.emptyLastPage()),
          onEndOfPage: () => _controller.loadNextPage(),
          child: Stack(children: [
            ListView.builder(
              shrinkWrap: false,
              itemCount: diseaseList.length,
              itemBuilder: (context, index) => DiseaseSeletionButton(
                disease: diseaseList[index],
                onTap: _controller.onDiseaseClicked,
                searchKeyword: _controller.diseaseKeywords,
                selected: _controller.diseaseListSelected.any((element) =>
                    element.diseaseId == diseaseList[index].diseaseId),
                width: WcWidth,
                diseaseIndex: index,
                onDiseaseInfoTap: (disease) {
                  Get.toNamed(Routes.DICTIONARY_DETAIL,
                      arguments: {'diseaseId': disease.diseaseId});
                },
              ),
            ),
            (_controller.status == PageStatus.loadingMore())
                ? Positioned(
                    bottom: 0,
                    child: Center(
                      child: Container(
                        width: WcWidth,
                        padding: const EdgeInsets.symmetric(vertical: 20),
                        margin: const EdgeInsets.symmetric(vertical: 20),
                        child: const Center(
                            child: SizedBox(
                          height: 20,
                          width: 20,
                          child: CircularProgressIndicator(
                            color: WcColors.grey100,
                          ),
                        )),
                      ),
                    ))
                : SizedBox.shrink()
          ]),
        ),
      ),
    );
  }
}
