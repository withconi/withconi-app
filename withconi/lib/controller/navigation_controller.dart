import 'dart:io';

import 'package:get/get.dart';
import 'package:withconi/controller/auth_controller.dart';
import 'package:withconi/controller/map/map_main_page_controller.dart';
import 'package:withconi/ui/pages/community/community_main_page.dart';
import 'package:withconi/ui/pages/diagnosis/diagnosis_main_page.dart';
import 'package:withconi/ui/pages/dictionary/dictionary_main_page.dart';
import 'package:withconi/ui/pages/map/map_main_page.dart';
import '../../data/model/conimal.dart';
import '../../data/model/disease.dart';
import '../../data/model/user.dart';
import '../import_basic.dart';
import '../routes/withconi_routes.dart';
import '../ui/pages/home/home_page.dart';

class NavigationController extends GetxController {
  static NavigationController get to => Get.find();
  RxInt navBarIndex = 0.obs;

  // changeNavIndex(int index) {
  //   navBarIndex(index);
  //   switch (index) {
  //     case 0:
  //       selectedPage.value = HomePage();
  //       break;
  //     case 1:
  //       selectedPage.value = DiagnosisMainPage();
  //       break;
  //     case 2:
  //       selectedPage.value = MapMainPage();
  //       break;
  //     case 3:
  //       selectedPage.value = CommunityMainPage();
  //       break;
  //     case 4:
  //       selectedPage.value = DictionaryMainPage();
  //       break;
  //     default:
  //   }
  // }

  getPageByIndex(int index) {
    navBarIndex(index);
    switch (index) {
      case 0:
        return HomePage();
      case 1:
        return DiagnosisMainPage();
      case 2:
        return MapMainPage();
      case 3:
        return CommunityMainPage();
      case 4:
        return DictionaryMainPage();
      default:
    }
  }

  // void changeNavIndex(int index) {
  //   navBarIndex(index);
  // }
}
