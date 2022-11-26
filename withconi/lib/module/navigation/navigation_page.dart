import 'package:withconi/import_basic.dart';
import 'package:withconi/module/community/pages/community_post_list_page.dart';
import 'package:withconi/module/ui_model/nav_destination_ui_model.dart';
import 'package:withconi/module/community/pages/community_main_page.dart';
import 'package:withconi/module/diagnosis/pages/diagnosis_main_page.dart';
import 'package:withconi/module/dictionary/pages/dictionary_main_page.dart';
import 'package:withconi/module/home/home_page.dart';

import '../../core/tools/helpers/utils.dart';
import '../../routes/bindings.dart';
import 'navigation_controller.dart';
import '../../global_widgets/navbar/bottom_navbar.dart';
import '../map/map_main_page.dart';

// class NavigationPage extends StatelessWidget {
//   const NavigationPage({Key? key}) : super(key: key);
//   @override
//   Widget build(BuildContext context) {
//     NavigationController _controller = Get.find();
//     return Scaffold(
//       body: Obx(() => _controller.getPageByKey(_controller.navBarIndex.value)),
//       bottomNavigationBar: Obx(
//         () => WcBottomNavBar(
//           currentNavIndex: _controller.navBarIndex.value,
//           onTap: _controller.changePageIndex,
//           navList: allDestinations,
//         ),
//       ),
//     );
//   }
// }

class NavigationPage extends StatelessWidget {
  const NavigationPage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    NavigationController _controller = Get.find();
    return Scaffold(
      body: Obx(
        () => IndexedStack(
          index: _controller.navBarIndex.value,
          children: [
            Navigator(
              // 네비게이터 추가.
              key: Get.nestedKey(1), // id 설정.
              initialRoute: Routes.HOME, // OutsidePage를 initialRoute로 설정.
              onGenerateRoute: (settings) {
                if (settings.name == Routes.HOME) {
                  return GetPageRoute(
                    routeName: Routes.HOME,
                    page: () => const HomePage(),
                    binding: HomeBinding(),
                  );
                }
              },
            ),
            Navigator(
              // 네비게이터 추가.
              key: Get.nestedKey(2), // id 설정.
              initialRoute: Routes.MAP_MAIN, // OutsidePage를 initialRoute로 설정.
              onGenerateRoute: (settings) {
                if (settings.name == Routes.MAP_MAIN) {
                  return GetPageRoute(
                    page: () => MapMainPage(),
                    binding: MapMainBinding(),
                  );
                }
              },
            ),
            Navigator(
              // 네비게이터 추가.
              key: Get.nestedKey(3), // id 설정.
              initialRoute:
                  Routes.COMMUNITY_MAIN, // OutsidePage를 initialRoute로 설정.
              onGenerateRoute: (settings) {
                print(Get.currentRoute);
                if (settings.name == Routes.COMMUNITY_MAIN) {
                  return GetPageRoute(
                    routeName: Routes.COMMUNITY_MAIN,
                    page: () => CommunityMainPage(),
                    binding: CommunityMainBinding(),
                  );
                }
              },
            ),
            Navigator(
              // 네비게이터 추가.
              key: Get.nestedKey(4), // id 설정.
              initialRoute:
                  Routes.DICTIONARY_MAIN, // OutsidePage를 initialRoute로 설정.
              onGenerateRoute: (settings) {
                if (settings.name == Routes.DICTIONARY_MAIN) {
                  return GetPageRoute(
                    routeName: Routes.DICTIONARY_MAIN,
                    page: () => const DictionaryMainPage(),
                    binding: DictionaryMainBinding(),
                  );
                }
              },
            ),
          ],
        ),
      ),
      bottomNavigationBar: Obx(
        () => WcBottomNavBar(
          currentNavIndex: _controller.navBarIndex.value,
          onTap: _controller.changePageIndex,
          navList: allDestinations,
        ),
      ),
    );
  }
}

// class NavigationPage extends StatelessWidget {
//   const NavigationPage({Key? key}) : super(key: key);
//   @override
//   Widget build(BuildContext context) {
//     NavigationController _controller = Get.find();
//     return Scaffold(
//       body: Obx(
//         () => Navigator(
//           // 네비게이터 추가.
//           key: Get.nestedKey(_controller.navBarIndex.value), // id 설정.
//           initialRoute: Routes.HOME, // OutsidePage를 initialRoute로 설정.
//           onGenerateRoute: (settings) {
//             switch (_controller.navBarIndex.value) {
//               case 0:
//                 return GetPageRoute(
//                   routeName: Routes.HOME,
//                   page: () => const HomePage(),
//                   binding: HomeBinding(),
//                 );
//               case 1:
//                 return GetPageRoute(
//                   routeName: Routes.HOME,
//                   page: () => const MapMainPage(),
//                   binding: MapMainBinding(),
//                 );

//               case 2:
//                 return GetPageRoute(
//                   routeName: Routes.COMMUNITY_MAIN,
//                   page: () => CommunityMainPage(),
//                   binding: CommunityMainBinding(),
//                 );

//               case 3:
//                 return GetPageRoute(
//                   routeName: Routes.DICTIONARY_MAIN,
//                   page: () => const DictionaryMainPage(),
//                 );

//               default:
//             }
//           },
//         ),
//       ),
//       bottomNavigationBar: Obx(
//         () => WcBottomNavBar(
//           currentNavIndex: _controller.navBarIndex.value,
//           onTap: _controller.getPageByIndex,
//           navList: allDestinations,
//         ),
//       ),
//     );
//   }
// }

// class NavigationPage extends StatelessWidget {
//   const NavigationPage({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     NavigationController _controller = Get.find();
//     return Obx(
//       () => Scaffold(
//         body: IndexedStack(
//           index: _controller.navBarIndex.value,
//           children: [
//             HomePage(),
//             const MapMainPage(),
//             CommunityMainPage(),
//             const DictionaryMainPage()
//           ],
//         ),
//         bottomNavigationBar: WcBottomNavBar(
//           currentNavIndex: _controller.navBarIndex.value,
//           onTap: _controller.getPageByIndex,
//           navList: allDestinations,
//         ),
//       ),
//     );
//   }
// }

// class NavigationPage extends StatefulWidget {
//   NavigationPage({
//     Key? key,
//   }) : super(key: key);

//   @override
//   _NavigationPageState createState() => _NavigationPageState();
// }

// class _NavigationPageState extends State<NavigationPage> {
//   // This navigator state will be used to navigate different pages
//   final GlobalKey<NavigatorState> _navigatorKey = GlobalKey<NavigatorState>();
//   int _currentTabIndex = 0;

//   @override
//   Widget build(BuildContext context) {
//     return SafeArea(
//       top: false,
//       child: Scaffold(
//         body: Navigator(key: _navigatorKey, onGenerateRoute: generateRoute),
//         bottomNavigationBar: WcBottomNavBar(
//           currentNavIndex: _currentTabIndex,
//           onTap: _onTap,
//           navList: allDestinations,
//         ),
//       ),
//     );
//   }

//   _onTap(int tabIndex) {
//     switch (tabIndex) {
//       case 0:
//         _navigatorKey.currentState!.pushReplacementNamed(Routes.HOME);
//         break;
//       case 1:
//         _navigatorKey.currentState!.pushReplacementNamed(Routes.MAP_MAIN);
//         break;
//       case 2:
//         _navigatorKey.currentState!.pushReplacementNamed(Routes.COMMUNITY_MAIN);
//         break;
//       case 3:
//         _navigatorKey.currentState!
//             .pushReplacementNamed(Routes.DICTIONARY_MAIN);
//         break;
//     }

//     setState(() {
//       _currentTabIndex = tabIndex;
//     });
//   }

//   Route<dynamic> generateRoute(RouteSettings settings) {
//     switch (settings.name) {
//       case Routes.HOME:
//         return GetPageRoute(
//             page: () => HomePage(),
//             routeName: Routes.HOME,
//             transition: Transition.noTransition);
//       case Routes.MAP_MAIN:
//         return GetPageRoute(
//             page: () => MapMainPage(),
//             routeName: Routes.MAP_MAIN,
//             transition: Transition.noTransition);
//       case Routes.COMMUNITY_MAIN:
//         return GetPageRoute(
//             page: () => CommunityMainPage(),
//             routeName: Routes.COMMUNITY_MAIN,
//             transition: Transition.noTransition);
//       case Routes.DICTIONARY_MAIN:
//         return GetPageRoute(
//             page: () => DictionaryMainPage(),
//             routeName: Routes.DICTIONARY_MAIN,
//             transition: Transition.noTransition);
//       default:
//         return GetPageRoute(page: () => HomePage(), routeName: Routes.HOME);
//     }
//   }
// }
