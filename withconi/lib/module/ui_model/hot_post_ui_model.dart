// import 'package:withconi/global_widgets/photo_gallary/image_item.dart';

// import '../../core/tools/helpers/calculator.dart';
// import '../../data/enums/enum.dart';
// import '../../data/model/dto/response_dto/community_response/post_response_dto.dart';

// class HotPostUIModel {
//   DateTime uploadAt;
//   String content;
//   final String postId;
//   final DiseaseType diseaseType;

//   String get uploadAtStr => TimeCalculator().calculateUploadAt(uploadAt);

//   HotPostUIModel({
//     required this.diseaseType,
//     required this.uploadAt,
//     required this.content,
//     required this.postId,
//   });

//   factory HotPostUIModel.fromDTO(PostResponseDTO postDTO) {
//     return HotPostUIModel(
//       uploadAt: postDTO.createdAt,
//       content: postDTO.content,
//       postId: postDTO.postId!,
//       diseaseType: postDTO.diseaseType,
//     );
//   }
// }
