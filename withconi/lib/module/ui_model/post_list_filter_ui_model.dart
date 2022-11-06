import 'package:withconi/data/enums/enum.dart';
import 'package:withconi/core/tools/helpers/infinite_scroll.dart';
import 'package:withconi/module/ui_model/ui_model_abstract/ui_model.dart';
import '../../data/model/latlng.dart';

class PostListFilterUIModel implements UIModel<PostListFilterUIModel> {
  PostListFilterUIModel({
    required this.paginationFilter,
    required this.boardId,
    required this.postType,
    this.keyword,
  });

  PaginationFilter paginationFilter;
  String boardId;
  PostType postType;
  String? keyword;
}
