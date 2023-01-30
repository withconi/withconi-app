// ignore_for_file: non_constant_identifier_names

import 'dart:io';

import 'package:get/get.dart';

import '../../import_basic.dart';

double WcWidth([BuildContext? context]) =>
    MediaQuery.of(context ?? Get.context!).size.width;
double WcHeight([BuildContext? context]) =>
    MediaQuery.of(context ?? Get.context!).size.height;
