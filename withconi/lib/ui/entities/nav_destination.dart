import 'package:flutter_svg/svg.dart';

import '../../import_basic.dart';

class NavDestination {
  const NavDestination(this.title, this.icon, this.color);
  final String title;
  final IconData icon;
  final Color color;
}

const List<NavDestination> allDestinations = <NavDestination>[
  NavDestination('홈', Icons.home, Colors.teal),
  NavDestination('자가진단', Icons.business, Colors.cyan),
  NavDestination('병원/약국', Icons.school, Colors.orange),
  NavDestination('커뮤니티', Icons.flight, Colors.blue),
  NavDestination('질병백과', Icons.flight, Colors.blue)
];
