import 'package:flutter_svg/svg.dart';

import '../../import_basic.dart';

class NavDestination {
  const NavDestination(this.title, this.iconSrc, this.color, this.index);
  final String title;
  final int index;
  final String iconSrc;
  final Color color;
}

const List<NavDestination> allDestinations = <NavDestination>[
  NavDestination('홈', 'assets/icons/nav_home.svg', WcColors.grey200, 0),
  // NavDestination('자가진단', 'assets/icons/nav_diagnosis.svg', WcColors.grey200, 1),
  NavDestination('병원/약국', 'assets/icons/nav_hospital.svg', WcColors.grey200, 1),
  NavDestination('커뮤니티', 'assets/icons/nav_community.svg', WcColors.grey200, 2),
  NavDestination(
      '질병백과', 'assets/icons/nav_dictionary.svg', WcColors.grey200, 3),
];
