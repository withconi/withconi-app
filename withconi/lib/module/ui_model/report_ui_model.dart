import 'package:withconi/module/ui_model/ui_model_abstract/ui_model.dart';

import '../../data/enums/enum.dart';

class ReportUIModel implements UIModel {
  ReportUIModel({
    required this.authorId,
    required this.boardId,
    required this.postId,
    required this.reportDesc,
    required this.reportItems,
  });
  String boardId;
  String postId;
  String authorId;
  List<ReportItem> reportItems;
  String reportDesc;
}
