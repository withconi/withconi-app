import 'package:withconi/module/common/controllers/life_cycle_controller.dart';
import '../../core/tools/helpers/utils.dart';
import '../../import_basic.dart';
import '../../routes/bindings.dart';
import '../community/pages/community_main_page.dart';
import '../dictionary/pages/dictionary_main_page.dart';
import '../home/home_page.dart';
import '../map/map_main_page.dart';

class NavigationController extends GetxController {
  static NavigationController get to => Get.find();
  RxInt navBarIndex = 0.obs;
  RxString rootPageRoute = Routes.HOME.obs;

  @override
  onReady() {
    super.onReady();
    ever(rootPageRoute, _checkPermissionStatus);
  }

  _checkPermissionStatus(String changedRootRoute) async {
    await LifeCycleController.to
        .checkRootPageStatus(rootRoute: changedRootRoute);
  }

  changePageIndex(int index) {
    navBarIndex.value = index;

    // switch (index) {
    //   case 0:
    //     rootPageRoute(Routes.HOME);
    //     Utils.mainListNav.currentState?.pushReplacementNamed(Routes.HOME);
    //     // Utils.mainListNav.currentState?.pushReplacementNamed(Routes.HOME);
    //     break;
    //   case 1:
    //     rootPageRoute(Routes.MAP_MAIN);
    //     Utils.mainListNav.currentState?.pushReplacementNamed(Routes.MAP_MAIN);
    //     // Utils.mainListNav.currentState?.pushReplacementNamed(Routes.MAP_MAIN);
    //     break;
    //   case 2:
    //     rootPageRoute(Routes.COMMUNITY_MAIN);
    //     Utils.mainListNav.currentState
    //         ?.pushReplacementNamed(Routes.COMMUNITY_MAIN);
    //     // Utils.mainListNav.currentState
    //     //     ?.pushReplacementNamed(Routes.COMMUNITY_MAIN);
    //     break;
    //   case 3:
    //     rootPageRoute(Routes.DICTIONARY_MAIN);
    //     Utils.mainListNav.currentState
    //         ?.pushReplacementNamed(Routes.DICTIONARY_MAIN);
    //     // Utils.mainListNav.currentState
    //     //     ?.pushReplacementNamed(Routes.DICTIONARY_MAIN);
    //     break;
    //   default:
    // }
  }

  // getPageByKey(int index) {
  //   switch (index) {
  //     case 0:
  //       return Navigator(
  //         // 네비게이터 추가.
  //         key: Get.nestedKey(1), // id 설정.
  //         initialRoute: Routes.HOME, // OutsidePage를 initialRoute로 설정.
  //         onGenerateRoute: (settings) {
  //           if (settings.name == Routes.HOME) {
  //             return GetPageRoute(
  //               routeName: Routes.HOME,
  //               page: () => const HomePage(),
  //               binding: HomeBinding(),
  //               maintainState: true,
  //             );
  //           }
  //         },
  //       );

  //     case 1:
  //       return Navigator(
  //         // 네비게이터 추가.
  //         key: Get.nestedKey(2), // id 설정.
  //         initialRoute: Routes.MAP_MAIN, // OutsidePage를 initialRoute로 설정.
  //         onGenerateRoute: (settings) {
  //           if (settings.name == Routes.MAP_MAIN) {
  //             return GetPageRoute(
  //               page: () => MapMainPage(),
  //               binding: MapMainBinding(),
  //             );
  //           }
  //         },
  //       );

  //     case 2:
  //       return Navigator(
  //         // 네비게이터 추가.
  //         key: Get.nestedKey(3), // id 설정.
  //         initialRoute: Routes.COMMUNITY_MAIN, // OutsidePage를 initialRoute로 설정.
  //         onGenerateRoute: (settings) {
  //           if (settings.name == Routes.COMMUNITY_MAIN) {
  //             return GetPageRoute(
  //               routeName: Routes.COMMUNITY_MAIN,
  //               page: () => CommunityMainPage(),
  //               binding: CommunityMainBinding(),
  //               maintainState: true,
  //             );
  //           }
  //         },
  //       );
  //     case 3:
  //       return Navigator(
  //         // 네비게이터 추가.
  //         key: Get.nestedKey(4), // id 설정.
  //         initialRoute:
  //             Routes.DICTIONARY_MAIN, // OutsidePage를 initialRoute로 설정.
  //         onGenerateRoute: (settings) {
  //           if (settings.name == Routes.DICTIONARY_MAIN) {
  //             return GetPageRoute(
  //               routeName: Routes.DICTIONARY_MAIN,
  //               page: () => DictionaryMainPage(),
  //               // binding: CommunityBinding(),
  //             );
  //           }
  //         },
  //       );

  //     default:
  //       return Navigator(
  //         // 네비게이터 추가.
  //         key: Get.nestedKey(1), // id 설정.
  //         initialRoute: Routes.HOME, // OutsidePage를 initialRoute로 설정.
  //         onGenerateRoute: (settings) {
  //           if (settings.name == Routes.HOME) {
  //             return GetPageRoute(
  //               routeName: Routes.HOME,
  //               page: () => const HomePage(),
  //               binding: HomeBinding(),
  //             );
  //           }
  //         },
  //       );
  //   }
  // }
}
