import 'dart:ui';

import 'package:withconi/module/ui_model/ui_model_abstract/ui_model.dart';

class DropdownDataUIModel<T> implements UIModel {
  final T? value;
  final String text;

  DropdownDataUIModel({
    required this.value,
    required this.text,
  });
}
