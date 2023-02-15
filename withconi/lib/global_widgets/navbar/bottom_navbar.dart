import 'package:flutter_svg/svg.dart';
import 'package:withconi/module/theme/text_theme.dart';
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
      unselectedLabelStyle: const TextStyle(
        fontFamily: WcFontFamily.notoSans,
        fontSize: 11.2,
        height: 1.7,
      ),

      selectedLabelStyle: const TextStyle(
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

      currentIndex: currentNavIndex, // 지정 인덱스로 이동
      selectedItemColor: WcColors.grey200,

      onTap: onTap, // 선언했던 onItemTapped
    );
  }
}
