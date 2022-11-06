import 'dart:ui';

import 'package:withconi/module/ui_model/ui_model_abstract/ui_model.dart';

class ChartData implements UIModel {
  final int percent;
  final Color color;
  final String title;
  final int value;

  ChartData(
      {required this.percent,
      required this.color,
      required this.title,
      required this.value});
}
