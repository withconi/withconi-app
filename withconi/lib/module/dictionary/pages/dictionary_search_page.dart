// import 'package:flutter_svg/svg.dart';
// import 'package:lazy_load_scrollview/lazy_load_scrollview.dart';
// import 'package:withconi/module/common/controllers/disease_search_controller.dart';
// import 'package:withconi/import_basic.dart';
// import 'package:withconi/module/common/lazy_load.dart';
// import 'package:withconi/module/community/controllers/custom_state_mixin.dart';
// import 'package:withconi/module/dictionary/controllers/dictionary_search_controller.dart';
// import 'package:withconi/module/signup/widgets/disease_selection_list_button.dart';
// import 'package:withconi/global_widgets/searchbar/search_bar.dart';

// import '../../../core/tools/helpers/search_highlighter.dart';
// import '../../page_status.dart';
// import '../../theme/text_theme.dart';
// import '../../ui_model/disease_ui_model.dart';
// import '../widgets/dictionary_list_tile.dart';

// class DictionarySearchPage extends StatelessWidget {
//   const DictionarySearchPage({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     DictionarySearchController _controller = Get.find();
//     return Scaffold(
//       resizeToAvoidBottomInset: false,
//       backgroundColor: WcColors.white,
//       floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
//       body: SafeArea(
//         bottom: false,
//         child: SizedBox(
//           width: WcWidth,
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.center,
//             children: [
//               const SizedBox(
//                 height: 15,
//               ),
//               SearchBarWidget(
//                 hintText: '질병 검색',
//                 onTextChanged: _controller.onDiseaseChanged,
//                 onTapClear: _controller.clearResult,
//                 textController: _controller.diseaseTextController,
//               ),
//               const SizedBox(
//                 height: 20,
//               ),
//               _getWidgetByState(_controller),
//               const SizedBox(
//                 height: 65,
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }

//   Widget _getWidgetByState(DictionarySearchController _controller) {
//     return _controller.obx(
//       onSuccess: Expanded(
//         child: MyLazyLoadScrollView(
//           isLoading: (_controller.status == const PageStatus.loadingMore() ||
//               _controller.status == const PageStatus.emptyLastPage()),
//           onEndOfPage: () => _controller.loadNextPage(),
//           child: Obx(
//             () => ListView.builder(
//               shrinkWrap: true,
//               itemCount: _controller.diseaseListSearched.length,
//               itemBuilder: (context, index) => DictionaryListTile(
//                 disease: _controller.diseaseListSearched[index],
//                 searchKeyword: _controller.diseaseKeywords,
//                 width: WcWidth,
//                 diseaseIndex: index,
//                 onTap: (disease) =>
//                     Get.toNamed(Routes.DICTIONARY_DETAIL, arguments: disease),
//               ),
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }
