// ignore_for_file: non_constant_identifier_names

import 'dart:io';

import 'package:get/get.dart';

import '../../import_basic.dart';

final double WcWidth = Get.width;
final double WcHeight = Get.height;
// final double WcSafePaddingTop = WidgetsBinding.instance.window.padding.top;
double safeAreaTop(bool isNeedSafeArea) => (isNeedSafeArea) ? 152 : 135;
