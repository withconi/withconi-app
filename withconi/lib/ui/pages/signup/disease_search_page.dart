import 'package:flutter_svg/svg.dart';
import 'package:withconi/controller/signup/disease_search_controller.dart';
import 'package:withconi/import_basic.dart';
import 'package:withconi/ui/pages/signup/signup_widgets/disease_selection_list_button.dart';
import '../../widgets/button/wide_button.dart';
import 'signup_widgets/disease_item_box.dart';

class DiseaseSearchPage extends StatelessWidget {
  const DiseaseSearchPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    DiseaseSearchController _controller = Get.put(DiseaseSearchController());
    return WillPopScope(
      onWillPop: () async => false,
      child: Scaffold(
        backgroundColor: WcColors.white,
        floatingActionButton: WcWideButtonWidget(
          active: true,
          activeButtonColor: WcColors.blue100,
          activeTextColor: WcColors.white,
          buttonText: '질병 등록',
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
                  Container(
                    height: 45,
                    width: WcWidth - 40,
                    decoration: BoxDecoration(
                      color: WcColors.white,
                      boxShadow: [
                        BoxShadow(
                          color: WcColors.grey100.withOpacity(0.6),
                          spreadRadius: 0,
                          blurRadius: 10,
                          offset: const Offset(1, 3),
                        ),
                      ],
                      borderRadius: BorderRadius.circular(30),
                    ),
                    child: Row(
                      children: [
                        GestureDetector(
                          onTap: () {},
                          child: Padding(
                            padding: const EdgeInsets.only(left: 13, right: 10),
                            child: SvgPicture.asset(
                              'assets/icons/search.svg',
                              color: WcColors.grey120,
                            ),
                          ),
                        ),
                        Expanded(
                            child: TextField(
                          controller: _controller.diseaseTextController,
                          onChanged: _controller.onDiseaseChanged,
                          style: GoogleFonts.notoSans(
                              color: WcColors.black,
                              fontSize: 16,
                              fontWeight: FontWeight.w500),
                          decoration: InputDecoration(
                            hintText: '질병 검색',
                            hintStyle: GoogleFonts.notoSans(
                                color: WcColors.grey100,
                                fontSize: 17,
                                fontWeight: FontWeight.w400),
                            border: InputBorder.none,
                          ),
                        )),
                        Container(
                          height: 45,
                          width: 1.2,
                          color: WcColors.grey80,
                        ),
                        GestureDetector(
                          onTap: _controller.clearResult,
                          child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 13),
                            child: SvgPicture.asset(
                              'assets/icons/cancle.svg',
                              color: WcColors.grey120,
                            ),
                          ),
                        ),
                      ],
                    ),
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
                                  .map((value) => WcDiseaseItemBox(
                                        diseaseName: value.name,
                                        onTap: () {
                                          _controller.diseaseListSelected
                                              .remove(value);
                                        },
                                      ))
                                  .toList()
                              : []))),
                  const SizedBox(
                    height: 10,
                  ),
                  Expanded(
                    child: Obx(
                      () => SingleChildScrollView(
                        child: Column(
                            children: (_controller
                                    .diseaseListSearched.isNotEmpty)
                                ? _controller.diseaseListSearched
                                    .map(
                                      (element) => WcDiseaseSelectListButton(
                                        name: element.name,
                                        onTap: () {
                                          _controller.diseaseListSelected
                                                  .contains(element)
                                              ? _controller.diseaseListSelected
                                                  .remove(element)
                                              : _controller.diseaseListSelected
                                                  .add(element);
                                        },
                                        selected: _controller
                                            .diseaseListSelected
                                            .contains(element),
                                        width: WcWidth,
                                      ),
                                    )
                                    .toList()
                                : [Text('검색 결과가 없습니다.')]),
                      ),
                    ),
                  ),
                  // Obx(
                  //   () => SizedBox(
                  //     height: 600,
                  //     child: ListView.builder(
                  //         itemCount: _controller.diseaseListSearched.length,
                  //         itemBuilder: ((context, index) =>
                  //             WcDiseaseSelectListButton(
                  //               name: _controller.diseaseListSelected[index].name,
                  //               onTap: () {
                  //                 _controller.diseaseListSelected.contains(
                  //                         _controller.diseaseListSelected[index])
                  //                     ? _controller.diseaseListSelected.remove(
                  //                         _controller.diseaseListSelected[index])
                  //                     : _controller.diseaseListSelected.add(
                  //                         _controller.diseaseListSelected[index]);
                  //               },
                  //               selected: _controller.diseaseListSelected
                  //                   .contains(
                  //                       _controller.diseaseListSelected[index]),
                  //               width: WcWidth,
                  //             ))),
                  //   ),
                  // )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
