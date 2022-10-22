import 'package:withconi/import_basic.dart';
import 'package:withconi/ui/entities/nav_destination.dart';
import 'package:withconi/ui/pages/community/community_main_page.dart';
import 'package:withconi/ui/pages/diagnosis/diagnosis_main_page.dart';
import 'package:withconi/ui/pages/dictionary/dictionary_main_page.dart';
import 'package:withconi/ui/pages/home/home_page.dart';

import '../../../controller/navigation_controller.dart';
import '../../widgets/navbar/bottom_navbar.dart';
import '../map/map_main_page.dart';

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
//             const CommunityMainPage(),
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

class NavigationPage extends StatelessWidget {
  const NavigationPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    NavigationController _controller = Get.find();
    return Obx(
      () => Scaffold(
        body: IndexedStack(
          index: _controller.navBarIndex.value,
          children: [
            HomePage(),
            const MapMainPage(),
            const CommunityMainPage(),
            const DictionaryMainPage()
          ],
        ),
        bottomNavigationBar: WcBottomNavBar(
          currentNavIndex: _controller.navBarIndex.value,
          onTap: _controller.getPageByIndex,
          navList: allDestinations,
        ),
      ),
    );
  }
}





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
