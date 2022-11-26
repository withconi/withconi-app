// import 'package:flutter_svg/svg.dart';

// import '../../../controller/auth_controller.dart';
// import '../../../import_basic.dart';

// class WcBottomNavBar extends StatelessWidget {
//   WcBottomNavBar({
//     Key? key,
//     required this.currentNavIndex,
//     required this.onTap,
//   }) : super(key: key);
//   int currentNavIndex;
//   void Function(int)? onTap;

//   @override
//   Widget build(BuildContext context) {
//     return BottomNavigationBar(
//       elevation: 7,
//       backgroundColor: WcColors.white,
//       type: BottomNavigationBarType.fixed,
//       showUnselectedLabels: true,
//       unselectedItemColor: WcColors.grey120,
//       unselectedLabelStyle: GoogleFonts.notoSans(
//         color: WcColors.grey110,
//         fontSize: 11,
//         height: 1.7,
//       ),
//       selectedLabelStyle: GoogleFonts.notoSans(
//         color: WcColors.black,
//         fontSize: 11,
//         height: 1.7,
//       ),
//       items: <BottomNavigationBarItem>[
//         BottomNavigationBarItem(
//           icon: SvgPicture.asset(
//             'assets/icons/nav_home.svg',
//             color: (currentNavIndex == 0) ? WcColors.black : WcColors.grey100,
//           ),
//           label: '홈',
//         ),
//         BottomNavigationBarItem(
//           icon: SvgPicture.asset(
//             'assets/icons/nav_diagnosis.svg',
//             color: (currentNavIndex == 1) ? WcColors.black : WcColors.grey100,
//           ),
//           label: '자가진단',
//         ),
//         BottomNavigationBarItem(
//           icon: SvgPicture.asset(
//             'assets/icons/nav_hospital.svg',
//             color: (currentNavIndex == 2) ? WcColors.black : WcColors.grey100,
//           ),
//           label: '병원/약국',
//         ),
//         BottomNavigationBarItem(
//           icon: SvgPicture.asset(
//             'assets/icons/nav_community.svg',
//             color: (currentNavIndex == 3) ? WcColors.black : WcColors.grey100,
//           ),
//           label: '커뮤니티',
//         ),
//         BottomNavigationBarItem(
//           icon: SvgPicture.asset(
//             'assets/icons/nav_dictionary.svg',
//             color: (currentNavIndex == 4) ? WcColors.black : WcColors.grey100,
//           ),
//           label: '질병백과',
//         ),
//       ],
//       currentIndex: currentNavIndex, // 지정 인덱스로 이동
//       selectedItemColor: WcColors.black,
//       onTap: onTap, // 선언했던 onItemTapped
//     );
//   }
// }
import 'package:flutter_svg/svg.dart';
import 'package:withconi/module/theme/text_theme.dart';

import '../../module/auth/auth_controller.dart';
import '../../import_basic.dart';
import '../../module/ui_model/nav_destination_ui_model.dart';

class WcBottomNavBar extends StatelessWidget {
  WcBottomNavBar({
    Key? key,
    required this.currentNavIndex,
    required this.navList,
    required this.onTap,
  }) : super(key: key);
  int currentNavIndex;
  List<NavDestinationUIModel> navList;
  void Function(int)? onTap;

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      elevation: 7,
      backgroundColor: WcColors.white,
      type: BottomNavigationBarType.fixed,
      showUnselectedLabels: true,
      unselectedItemColor: WcColors.grey120,
      unselectedLabelStyle: TextStyle(
        fontFamily: WcFontFamily.notoSans,
        fontSize: 11.2,
        height: 1.7,
      ),

      selectedLabelStyle: TextStyle(
        fontFamily: WcFontFamily.notoSans,
        fontSize: 11.2,
        height: 1.7,
      ),

      items: navList
          .map((e) => BottomNavigationBarItem(
              icon: SvgPicture.asset(
                e.iconSrc,
                color:
                    (e.index == currentNavIndex) ? e.color : WcColors.grey100,
              ),
              label: e.title))
          .toList(),
      // items: <BottomNavigationBarItem>[
      //   BottomNavigationBarItem(
      //     icon: SvgPicture.asset(
      //       'assets/icons/nav_home.svg',
      //       color: (navDestination.title == 0) ? WcColors.black : WcColors.grey100,
      //     ),
      //     label: '홈',
      //   ),
      //   BottomNavigationBarItem(
      //     icon: SvgPicture.asset(
      //       'assets/icons/nav_diagnosis.svg',
      //       color: (currentNavIndex == 1) ? WcColors.black : WcColors.grey100,
      //     ),
      //     label: '자가진단',
      //   ),
      //   BottomNavigationBarItem(
      //     icon: SvgPicture.asset(
      //       'assets/icons/nav_hospital.svg',
      //       color: (currentNavIndex == 2) ? WcColors.black : WcColors.grey100,
      //     ),
      //     label: '병원/약국',
      //   ),
      //   BottomNavigationBarItem(
      //     icon: SvgPicture.asset(
      //       'assets/icons/nav_community.svg',
      //       color: (currentNavIndex == 3) ? WcColors.black : WcColors.grey100,
      //     ),
      //     label: '커뮤니티',
      //   ),
      //   BottomNavigationBarItem(
      //     icon: SvgPicture.asset(
      //       'assets/icons/nav_dictionary.svg',
      //       color: (currentNavIndex == 4) ? WcColors.black : WcColors.grey100,
      //     ),
      //     label: '질병백과',
      //   ),
      // ],
      currentIndex: currentNavIndex, // 지정 인덱스로 이동
      selectedItemColor: WcColors.grey200,

      onTap: onTap, // 선언했던 onItemTapped
    );
  }
}
