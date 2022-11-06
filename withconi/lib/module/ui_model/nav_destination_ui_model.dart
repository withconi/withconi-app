import 'package:flutter_svg/svg.dart';
import 'package:withconi/module/ui_model/ui_model_abstract/ui_model.dart';

import '../../import_basic.dart';

class NavDestinationUIModel implements UIModel {
  const NavDestinationUIModel(this.title, this.iconSrc, this.color, this.index);
  final String title;
  final int index;
  final String iconSrc;
  final Color color;
}

const List<NavDestinationUIModel> allDestinations = <NavDestinationUIModel>[
  NavDestinationUIModel('홈', 'assets/icons/nav_home.svg', WcColors.grey200, 0),
  // NavDestination('자가진단', 'assets/icons/nav_diagnosis.svg', WcColors.grey200, 1),
  NavDestinationUIModel(
      '병원/약국', 'assets/icons/nav_hospital.svg', WcColors.grey200, 1),
  NavDestinationUIModel(
      '커뮤니티', 'assets/icons/nav_community.svg', WcColors.grey200, 2),
  NavDestinationUIModel(
      '질병백과', 'assets/icons/nav_dictionary.svg', WcColors.grey200, 3),
];
