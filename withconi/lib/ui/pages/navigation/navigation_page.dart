import 'package:withconi/import_basic.dart';
import 'package:withconi/ui/pages/community/community_main_page.dart';
import 'package:withconi/ui/pages/diagnosis/diagnosis_main_page.dart';
import 'package:withconi/ui/pages/dictionary/dictionary_main_page.dart';
import 'package:withconi/ui/pages/home/home_page.dart';

import '../../../controller/navigation_controller.dart';
import '../../widgets/navbar/bottom_navbar.dart';
import '../map/map_main_page.dart';

class NavigationPage extends StatelessWidget {
  const NavigationPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    NavigationController _controller = Get.put(NavigationController());
    return Obx(
      () => Scaffold(
        body: _controller.getPageByIndex(_controller.navBarIndex.value),
        bottomNavigationBar: WcBottomNavBar(
          currentNavIndex: _controller.navBarIndex.value,
          onTap: _controller.getPageByIndex,
        ),
      ),
    );
  }

  // @override
  // Widget build(BuildContext context) {
  //   NavigationController _controller = Get.put(NavigationController());
  //   return Obx(
  //     () => Scaffold(
  //       body: IndexedStack(
  //         index: _controller.navBarIndex.value,
  //         children: [
  //           HomePage(),
  //           const DiagnosisMainPage(),
  //           MapMainPage(),
  //           const CommunityMainPage(),
  //           const DictionaryMainPage()
  //         ],
  //       ),
  //       bottomNavigationBar: Obx(
  //         () => WcBottomNavBar(
  //           currentNavIndex: _controller.navBarIndex.value,
  //           onTap: _controller.changeNavIndex,
  //         ),
  //       ),
  //     ),
  //   );
  // }
}


// class NavigationPage extends StatelessWidget {
//   const NavigationPage({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     NavigationController _controller = Get.put(NavigationController());
//     return Obx(
//       () => Scaffold(
//         body: _controller.changeNavIndex(_controller.navBarIndex.value),
//         bottomNavigationBar: Obx(
//           () => WcBottomNavBar(
//             currentNavIndex: _controller.navBarIndex.value,
//             onTap: _controller.changeNavIndex,
//           ),
//         ),
//       ),
//     );
//   }
// }
