import 'package:withconi/data/enums/enum.dart';
import 'package:withconi/module/ui_model/conimal_ui_model.dart';
import 'package:withconi/module/ui_model/disease_ui_model.dart';
import 'package:withconi/module/ui_model/latlng_ui_model.dart';
import 'package:withconi/module/ui_model/place_ui_model/abstract_class/place_preview_ui.dart';
import 'package:withconi/module/ui_model/place_ui_model/hospital_preview_ui_model.dart';
import 'package:withconi/module/ui_model/place_ui_model/pharmacy_preview_ui_model.dart';
import 'package:withconi/module/ui_model/ui_model_abstract/ui_model.dart';

import '../../data/model/dto/response_dto/review_response/review_detail_response_dto.dart';
import '../../global_widgets/photo_gallary/image_item.dart';

class ReviewDetailUIModel
    implements UIModel<ReviewDetailUIModel, ReviewDetailResponseDTO> {
  ReviewDetailUIModel({
    required this.conimals,
    required this.diseaseTypes,
    required this.reviewItems,
    required this.reviewRate,
    required this.diseaseList,
    required this.placeId,
    required this.reviewDesc,
    required this.reviewImageList,
    required this.isPhotoReview,
    required this.placeName,
    required this.placeAddress,
    required this.placeThumbnail,
    required this.reviewId,
  });

  List<ConimalUIModel> conimals;
  List<DiseaseType> diseaseTypes;
  List<DiseaseUIModel> diseaseList;
  ReviewRate? reviewRate;
  List<ReviewItem> reviewItems;
  String placeId;
  String reviewId;
  String placeName;
  String placeAddress;
  ImageItem placeThumbnail;
  List<ImageItem> reviewImageList;
  bool isPhotoReview;
  String reviewDesc;

  factory ReviewDetailUIModel.fromDTO(ReviewDetailResponseDTO responseDTO) {
    return ReviewDetailUIModel(
      reviewId: responseDTO.reviewId,
      reviewDesc: responseDTO.reviewDesc,
      conimals:
          responseDTO.conimals.map((e) => ConimalUIModel.fromDTO(e)).toList(),
      diseaseTypes: responseDTO.diseaseTypeList,
      reviewItems: responseDTO.reviewItems,
      reviewRate: responseDTO.reviewRate,
      reviewImageList: responseDTO.reviewImageList
          .map((imageUrl) => ImageItem(
              id: imageUrl, imageUrl: imageUrl, imageType: ImageType.network))
          .toList(),
      diseaseList: responseDTO.diseaseList
          .map((dto) => DiseaseUIModel.fromDTO(dto))
          .toList(),
      // placePreview: placePreview,
      placeId: responseDTO.placeId,
      placeName: responseDTO.placeName,
      placeAddress: responseDTO.placeAddress,
      placeThumbnail: ImageItem(
          id: responseDTO.placeThumbnail,
          imageUrl: responseDTO.placeThumbnail,
          imageType: ImageType.network),
      isPhotoReview: responseDTO.reviewImageList.isNotEmpty,
    );
  }
}
