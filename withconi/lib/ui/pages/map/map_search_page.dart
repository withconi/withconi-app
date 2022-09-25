import 'package:flutter/widgets.dart';
import 'package:flutter_svg/svg.dart';
import 'package:lottie/lottie.dart';
import 'package:withconi/controller/common_controller/disease_search_controller.dart';
import 'package:withconi/controller/map/map_search_controller.dart';
import 'package:withconi/import_basic.dart';
import 'package:withconi/ui/pages/signup/signup_widgets/disease_selection_list_button.dart';
import 'package:withconi/ui/widgets/searchbar/search_bar.dart';
import '../../../configs/constants/enum.dart';
import '../../theme/text_theme.dart';
import '../../widgets/button/wide_button.dart';
import '../../widgets/error_widget/error_widget.dart';
import '../signup/signup_widgets/disease_item_box.dart';

class MapSearchPage extends StatelessWidget {
  const MapSearchPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    MapSearchController _controller = Get.put(MapSearchController());
    return Scaffold(
      backgroundColor: WcColors.white,
      body: SafeArea(
        bottom: false,
        child: Center(
          child: SizedBox(
            width: WcWidth,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SearchBarWidget(
                  textController: TextEditingController(),
                  onTextChanged: _controller.onSearchNameChanged,
                  hintText: '동물병원/약국 검색',
                  boxShadow: const [
                    BoxShadow(
                      color: Color.fromARGB(50, 0, 0, 0),
                      spreadRadius: -2,
                      blurRadius: 5,
                      offset: Offset(0, 1),
                    ),
                  ],
                  margin: EdgeInsets.symmetric(vertical: 20),
                ),
                Divider(
                  height: 15,
                  color: WcColors.grey40,
                  thickness: 10,
                ),
                _controller.obx(
                    (onSuccessResult) => (onSuccessResult!.isNotEmpty)
                        ? Expanded(
                            child: Obx(
                              () => SingleChildScrollView(
                                controller: _controller.scrollController.value,
                                child: Column(
                                    children: onSuccessResult
                                        .map(
                                          (disease) => SearchedPlaceListTile(
                                            onTap: () {
                                              _controller.onPlaceSelected(
                                                  selectedPlace: disease);
                                            },
                                            address: disease.address,
                                            distance:
                                                _controller.getDistanceToString(
                                                    distanceMeter: disease
                                                        .distanceByMeter),
                                            placeName: disease.name,
                                            placeType: disease.placeType,
                                          ),
                                        )
                                        .toList()),
                              ),
                            ),
                          )
                        : WcErrorWidget(
                            image: Image.asset(
                              'assets/icons/no_result.png',
                              height: 100,
                            ),
                            title: '검색 결과가 없어요',
                            message: '다른 검색어로 다시 시도해 보세요 :)',
                          ),
                    onEmpty: const SizedBox.shrink(),
                    onLoading: SizedBox(
                      height: WcHeight - 380,
                      child: OverflowBox(
                        minHeight: 160,
                        maxHeight: 160,
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

class SearchedPlaceListTile extends StatelessWidget {
  SearchedPlaceListTile({
    Key? key,
    required this.address,
    required this.placeType,
    required this.placeName,
    required this.distance,
    this.onTap,
  }) : super(key: key);

  String address;
  PlaceType placeType;
  String placeName;
  String distance;
  void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.fromLTRB(20, 12, 20, 0),
        height: 75,
        width: WcWidth,
        decoration: BoxDecoration(
            color: WcColors.white,
            border:
                Border(bottom: BorderSide(width: 1, color: WcColors.grey80))),
        child: Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Padding(
            padding: EdgeInsets.only(top: 4),
            child: Image.asset(
              'assets/icons/hospital_unclicked.png',
              height: 23,
            ),
          ),
          SizedBox(
            width: 13,
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(placeName,
                    style: TextStyle(
                        fontFamily: WcFontFamily.notoSans,
                        fontSize: 17,
                        fontWeight: FontWeight.w500)),
                Text(address,
                    style: TextStyle(
                        fontFamily: WcFontFamily.notoSans,
                        color: WcColors.grey120,
                        fontSize: 14,
                        overflow: TextOverflow.ellipsis,
                        height: 1.5,
                        fontWeight: FontWeight.w500)),
                // Row(
                //   children: [
                //     Text('리뷰',
                //         style: TextStyle(
                //             height: 1.5,
                //             fontFamily: WcFontFamily.notoSans,
                //             fontSize: 13,
                //             color: WcColors.grey140,
                //             fontWeight: FontWeight.w500)),
                //     SizedBox(
                //       width: 5,
                //     ),
                //     Text('24',
                //         style: TextStyle(
                //             height: 1.5,
                //             fontFamily: WcFontFamily.notoSans,
                //             fontSize: 13,
                //             color: WcColors.grey200,
                //             fontWeight: FontWeight.w500)),
                //   ],
                // ),
              ],
            ),
          ),
          SizedBox(
            width: 80,
            height: 45,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text((placeType == PlaceType.hospital) ? '병원' : '약국',
                    style: TextStyle(
                        fontFamily: WcFontFamily.notoSans,
                        fontSize: 14,
                        color: WcColors.grey140,
                        fontWeight: FontWeight.w500)),
                Text(distance,
                    style: GoogleFonts.openSans(
                        color: WcColors.grey140,
                        fontSize: 14,
                        fontWeight: FontWeight.w600)),
              ],
            ),
          )
        ]),
      ),
    );
  }
}
