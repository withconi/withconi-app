// ignore_for_file: constant_identifier_names
import '../../import_basic.dart';

class NavigationController extends GetxController {
  static const NAVIGATOR_KEY = 1;
  // static const INDEX_PAGE_INDEX = 2;
  static NavigationController get to => Get.find();

  final _pages = [
    Routes.HOME,
    Routes.COMMUNITY_MAIN,
    Routes.MAP_MAIN,
    Routes.DICTIONARY_MAIN
  ];

  final _pageIndex = 0.obs;

  int get pageIndex => _pageIndex.value;

  goToPage(int pageIndex) {
    if (_pageIndex.value == pageIndex) {
      return;
    }
    _pageIndex(pageIndex);

    Get.offNamed(_pages[pageIndex], id: NAVIGATOR_KEY);
  }
}
