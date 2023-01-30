import 'dart:js';

import 'package:lazy_load_scrollview/lazy_load_scrollview.dart';
import 'package:withconi/module/common/controllers/breed_search_controller.dart';
import 'package:withconi/module/common/widgets/breed_list_tile.dart';
import 'package:withconi/module/community/controllers/community_post_search_controller.dart';
import 'package:withconi/import_basic.dart';
import '../../../data/enums/enum.dart';
import '../../../global_widgets/appbar/search_appbar.dart';
import '../../../global_widgets/button/text_radio_button.dart';
import '../../../global_widgets/error_widget/error_widget.dart';
import '../../../global_widgets/listtile/post_list_tile.dart';
import '../../../global_widgets/loading/loading_page.dart';
import '../page_status.dart';

class BreedSearchPage extends StatelessWidget {
  const BreedSearchPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    BreedSearchController _controller = Get.find();
    return Scaffold(
      appBar: WcSearchAppBar(
        hintText: '묘종/견종 검색',
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
                      children: Species.values
                          .where((element) => element != Species.all)
                          .map((speciesType) => WcTextRadioButton(
                                height: 33,
                                onTap: (value) {
                                  _controller
                                      .onSpeciesChanged(value as Species);
                                },
                                selectedValue:
                                    _controller.selectedSpecies.value,
                                value: speciesType,
                                text: speciesType.displayName,
                              ))
                          .toList(),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Obx(() => Expanded(
                      child: _getWidgetByState(
                          _controller.pageStatus.value, _controller, context),
                    )),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _getWidgetByState(PageStatus status, BreedSearchController _controller,
      BuildContext context) {
    return status.maybeWhen(
      // init: () => SizedBox.shrink(),
      loading: (value) => LoadingPage(
        height: WcHeight(context) - 300,
      ),

      error: (message) => WcErrorWidget(
        image: Image.asset(
          'assets/icons/no_result.png',
          height: 90,
        ),
        title: message,
        message: '',
      ),
      orElse: () => ListView.builder(
          // physics: const NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          itemCount: _controller.searchedBreedList.length,
          itemBuilder: (context, index) {
            return BreedListTileButton(
              breed: _controller.searchedBreedList[index],
              diseaseIndex: index,
              onTap: _controller.onBreedSelected,
              width: WcWidth(context),
              searchKeyword: _controller.searchKeyword,
            );
          }),
    );
  }
}
