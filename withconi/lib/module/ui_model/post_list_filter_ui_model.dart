import 'package:withconi/data/enums/enum.dart';
import 'package:withconi/core/tools/helpers/infinite_scroll.dart';
import 'package:withconi/module/ui_model/ui_model_abstract/ui_model.dart';
import 'latlng_ui_model.dart';

class PostListFilterUIModel implements UIModel {
  PostListFilterUIModel({
    required this.postType,
    required this.keyword,
  });

  PostType postType;
  String keyword;
}
