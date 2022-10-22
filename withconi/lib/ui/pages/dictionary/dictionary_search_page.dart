import 'package:flutter_svg/svg.dart';
import 'package:lottie/lottie.dart';
import 'package:withconi/controller/common_controller/disease_search_controller.dart';
import 'package:withconi/controller/dictionary/dictionary_search_controller.dart';
import 'package:withconi/import_basic.dart';
import 'package:withconi/ui/pages/signup/signup_widgets/disease_selection_list_button.dart';
import 'package:withconi/ui/widgets/appbar/appbar.dart';
import 'package:withconi/ui/widgets/searchbar/search_bar.dart';
import '../../../data/model/disease.dart';
import '../../widgets/button/wide_button.dart';
import '../../widgets/error_widget/error_widget.dart';
import '../signup/signup_widgets/disease_item_box.dart';

class DictionarySearchPage extends StatelessWidget {
  const DictionarySearchPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    DictionarySearchController _controller =
        Get.put(DictionarySearchController());
    return Scaffold(
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
                const SizedBox(
                  height: 15,
                ),
                // Container(
                //   height: 45,
                //   width: WcWidth - 40,
                //   decoration: BoxDecoration(
                //     color: WcColors.white,
                //     boxShadow: [
                //       BoxShadow(
                //         color: WcColors.grey100.withOpacity(0.4),
                //         spreadRadius: -2,
                //         blurRadius: 10,
                //         offset: const Offset(1, 2),
                //       ),
                //     ],
                //     borderRadius: BorderRadius.circular(30),
                //   ),
                //   child: Row(
                //     children: [
                //       GestureDetector(
                //         onTap: () {},
                //         child: Padding(
                //           padding: const EdgeInsets.only(left: 13, right: 12),
                //           child: SvgPicture.asset(
                //             'assets/icons/search.svg',
                //             color: WcColors.grey120,
                //           ),
                //         ),
                //       ),
                //       Expanded(
                //           child: TextField(
                //         controller: _controller.diseaseTextController,
                //         onChanged: _controller.onDiseaseChanged,
                //         style: GoogleFonts.notoSans(
                //             color: WcColors.black,
                //             fontSize: 16,
                //             fontWeight: FontWeight.w500),
                //         decoration: InputDecoration(
                //           hintText: '질병 검색',
                //           hintStyle: GoogleFonts.notoSans(
                //               color: WcColors.grey100,
                //               fontSize: 16,
                //               fontWeight: FontWeight.w400),
                //           border: InputBorder.none,
                //         ),
                //       )),
                //       Container(
                //         height: 45,
                //         width: 1.2,
                //         color: WcColors.grey80,
                //       ),
                //       GestureDetector(
                //         onTap: _controller.clearResult,
                //         child: Padding(
                //           padding: const EdgeInsets.only(left: 12, right: 14),
                //           child: SvgPicture.asset(
                //             'assets/icons/cancle.svg',
                //             color: WcColors.grey120,
                //             height: 16,
                //           ),
                //         ),
                //       ),
                //     ],
                //   ),
                // ),
                SearchBarWidget(
                  hintText: '질병 검색',
                  onTextChanged: _controller.onDiseaseChanged,
                  onTapAction: _controller.clearResult,
                  textController: _controller.diseaseTextController,
                ),
                const SizedBox(
                  height: 20,
                ),

                _controller.obx(
                    (onSuccessResult) => (onSuccessResult!.isEmpty)
                        ? WcErrorWidget(
                            image: Image.asset(
                              'assets/icons/no_result.png',
                              height: 90,
                            ),
                            title: '검색 결과가 없습니다',
                            message: '다른 검색어로 시도해주세요 :)',
                          )
                        : Expanded(
                            child: SingleChildScrollView(
                              controller: _controller.scrollController.value,
                              child: Column(
                                children: [
                                  Column(
                                      children: onSuccessResult
                                          .map(
                                            (disease) => Obx(
                                              () => DiseaseListTileButton(
                                                searchKeyword: _controller
                                                    .searchKeywords.value,
                                                disease: disease,
                                                onTap:
                                                    _controller.selectDisease,
                                                selected: false,
                                                enableSelect: false,
                                                width: WcWidth,
                                              ),
                                            ),
                                          )
                                          .toList()),
                                  SizedBox(
                                    height: 100,
                                  )
                                ],
                              ),
                            ),
                          ),
                    onEmpty: WcErrorWidget(
                      image: Image.asset(
                        'assets/icons/search_color.png',
                        height: 70,
                      ),
                      title: '',
                      message: '',
                    ),
                    onLoading: SizedBox(
                      height: WcHeight - 200,
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
