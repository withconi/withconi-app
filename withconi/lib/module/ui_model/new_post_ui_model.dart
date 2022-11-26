import 'package:withconi/global_widgets/photo_gallary/image_item.dart';

import '../../core/tools/helpers/calculator.dart';
import '../../data/enums/enum.dart';
import '../../data/model/dto/response_dto/community_response/post_response_dto.dart';

class NewPostUIModel {
  String content;
  PostType? postType;
  List<ImageItem> images;
  NewPostUIModel({
    required this.content,
    required this.postType,
    required this.images,
  });
}
