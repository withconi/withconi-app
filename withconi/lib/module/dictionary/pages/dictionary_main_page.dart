import 'package:withconi/data/enums/enum.dart';
import 'package:withconi/import_basic.dart';
import 'package:withconi/module/community/controllers/custom_state_mixin.dart';
import 'package:withconi/module/theme/text_theme.dart';
import 'package:withconi/global_widgets/searchbar/search_bar.dart';
import '../../common/lazy_load.dart';
import '../../page_status.dart';
import '../controllers/dictionary_main_controller.dart';
import '../widgets/common_disease_list_tile.dart';
import '../widgets/dictionary_list_tile.dart';

class DictionaryMainPage extends StatelessWidget {
  const DictionaryMainPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    DictionaryMainController _controller = Get.find();

    return WillPopScope(
      onWillPop: () async => false,
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: WcColors.white,
        body: Container(
          constraints: BoxConstraints(
            minHeight: WcHeight,
            minWidth: WcWidth,
          ),
          child: SafeArea(
            bottom: false,
            child: Column(
              mainAxisSize: MainAxisSize.max,
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const SizedBox(
                        height: 20,
                      ),
                      SizedBox(
                        width: WcWidth - 40,
                        height: 50,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text('질병백과',
                                style: TextStyle(
                                    fontFamily: WcFontFamily.notoSans,
                                    fontWeight: FontWeight.w600,
                                    fontSize: 25)),
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      SearchBarWidget(
                        onTextChanged: _controller.onDiseaseChanged,
                        onTapClear: _controller.clearResult,
                        hintText: '질병을 검색해보세요',
                        textController: _controller.diseaseTextController,
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Expanded(child: _getWidgetByState(_controller)),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _getWidgetByState(DictionaryMainController _controller) {
    return _controller.obx(
        onSuccess: MyLazyLoadScrollView(
          isLoading: (_controller.status == const PageStatus.loadingMore() ||
              _controller.status == const PageStatus.emptyLastPage()),
          onEndOfPage: () => _controller.loadNextPage(),
          child: Obx(
            () => ListView.builder(
              shrinkWrap: true,
              itemCount: _controller.diseaseListSearched.length,
              itemBuilder: (context, index) => DictionaryListTile(
                disease: _controller.diseaseListSearched[index],
                searchKeyword: _controller.diseaseKeywords,
                width: WcWidth,
                diseaseIndex: index,
                onTap: (disease) =>
                    Get.toNamed(Routes.DICTIONARY_DETAIL, arguments: disease),
              ),
            ),
          ),
        ),
        onInit: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              height: 30,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('고양이',
                      style: TextStyle(
                          fontFamily: WcFontFamily.notoSans,
                          fontWeight: FontWeight.w600,
                          fontSize: 17,
                          color: Species.cat.mainColor,
                          height: 1)),
                  Text('에게 자주 발생하는 질병',
                      style: TextStyle(
                          fontFamily: WcFontFamily.notoSans,
                          fontWeight: FontWeight.w500,
                          fontSize: 17,
                          color: WcColors.grey200,
                          height: 1)),
                ],
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Obx(() => ListView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: _controller.catDiseaseList.length,
                itemBuilder: (context, index) => CommonDiseaseListTile(
                      commonDisease: _controller.catDiseaseList[index],
                      index: index,
                      onTap: _controller.goToDiseaseDetailPage,
                      species: Species.cat,
                    ))),
            const SizedBox(
              height: 30,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('강아지',
                      style: TextStyle(
                          fontFamily: WcFontFamily.notoSans,
                          fontWeight: FontWeight.w600,
                          fontSize: 17,
                          color: WcColors.orange100,
                          height: 1)),
                  Text('에게 자주 발생하는 질병',
                      style: TextStyle(
                          fontFamily: WcFontFamily.notoSans,
                          fontWeight: FontWeight.w500,
                          fontSize: 17,
                          color: WcColors.grey200,
                          height: 1)),
                ],
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Obx(() => Expanded(
                  child: ListView.builder(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: _controller.dogDiseaseList.length,
                      itemBuilder: (context, index) => CommonDiseaseListTile(
                            commonDisease: _controller.dogDiseaseList[index],
                            index: index,
                            onTap: _controller.goToDiseaseDetailPage,
                            species: Species.dog,
                          )),
                )),
            // const SizedBox(
            //   height: 30,
            // )
          ],
        ));
  }
}
