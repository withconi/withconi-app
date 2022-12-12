import 'package:withconi/data/enums/enum.dart';
import 'package:withconi/data/model/dto/response_dto/review_response/review_preview_response_dto.dart';
import 'package:withconi/module/ui_model/conimal_ui_model.dart';
import 'package:withconi/module/ui_model/disease_ui_model.dart';
import 'package:withconi/module/ui_model/latlng_ui_model.dart';
import 'package:withconi/module/ui_model/place_ui_model/abstract_class/place_preview_ui.dart';
import 'package:withconi/module/ui_model/place_ui_model/hospital_preview_ui_model.dart';
import 'package:withconi/module/ui_model/place_ui_model/pharmacy_preview_ui_model.dart';
import 'package:withconi/module/ui_model/ui_model_abstract/ui_model.dart';

import '../../data/model/dto/response_dto/review_response/review_detail_response_dto.dart';
import '../../global_widgets/photo_gallary/image_item.dart';

class ReviewPreviewUIModel
    implements UIModel<ReviewPreviewUIModel, ReviewPreviewResponseDTO> {
  ReviewPreviewUIModel({
    required this.diseaseTypes,
    required this.reviewItems,
    required this.reviewRate,
    required this.placeId,
    required this.reviewId,
    required this.reviewImageList,
    required this.isPhotoReview,
    required this.placeName,
    required this.placeAddress,
  });

  List<DiseaseType> diseaseTypes;
  ReviewRate? reviewRate;
  List<ReviewItem> reviewItems;
  String reviewId;
  String placeId;

  String placeName;
  String placeAddress;
  List<ImageItem> reviewImageList;
  bool isPhotoReview;

  factory ReviewPreviewUIModel.fromDTO(ReviewPreviewResponseDTO responseDTO) {
    return ReviewPreviewUIModel(
      reviewId: responseDTO.reviewId,
      diseaseTypes: responseDTO.diseaseTypeList,
      reviewItems: responseDTO.reviewItems,
      reviewRate: responseDTO.reviewRate,
      reviewImageList: responseDTO.reviewImageList
          .map((imageUrl) => ImageItem(
              id: imageUrl, imageUrl: imageUrl, imageType: ImageType.network))
          .toList(),
      placeId: responseDTO.placeId,
      placeName: responseDTO.placeName,
      placeAddress: responseDTO.placeAddress,
      isPhotoReview: responseDTO.reviewImageList.isNotEmpty,
    );
  }
}
