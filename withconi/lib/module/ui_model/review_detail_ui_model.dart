import 'package:withconi/data/enums/enum.dart';
import 'package:withconi/module/ui_model/conimal_ui_model.dart';
import 'package:withconi/module/ui_model/disease_ui_model.dart';
import 'package:withconi/module/ui_model/latlng_ui_model.dart';
import 'package:withconi/module/ui_model/place_ui_model/abstract_class/place_preview_ui.dart';
import 'package:withconi/module/ui_model/place_ui_model/hospital_preview_ui_model.dart';
import 'package:withconi/module/ui_model/place_ui_model/pharmacy_preview_ui_model.dart';
import 'package:withconi/module/ui_model/ui_model_abstract/ui_model.dart';

import '../../data/model/dto/response_dto/review_response/review_detail_response_dto.dart';

class ReviewDetailUIModel
    implements UIModel<ReviewDetailUIModel, ReviewDetailResponseDTO> {
  ReviewDetailUIModel({
    required this.conimals,
    required this.diseaseTypes,
    required this.reviewItems,
    required this.reviewRate,
    required this.diseaseList,
    required this.placePreview,
    required this.reviewDesc,
  });

  List<ConimalUIModel> conimals;
  List<DiseaseType> diseaseTypes;
  List<DiseaseUIModel> diseaseList;
  ReviewRate? reviewRate;
  List<ReviewItem> reviewItems;
  PlacePreviewUiModel? placePreview;
  String reviewDesc;

  factory ReviewDetailUIModel.fromDTO(ReviewDetailResponseDTO responseDTO) {
    return ReviewDetailUIModel(
        conimals:
            responseDTO.conimals.map((e) => ConimalUIModel.fromDTO(e)).toList(),
        diseaseTypes: responseDTO.diseaseTypeList,
        reviewItems: responseDTO.reviewItems,
        reviewRate: responseDTO.reviewRate,
        diseaseList: responseDTO.diseaseList
            .map((e) => DiseaseUIModel.fromDTO(e))
            .toList(),
        placePreview: responseDTO.placePreview.map(
            pharmacy: (value) => PharmacyPreviewUIModel.fromDTO(
                value, LatLngUIModel(lat: 0, lng: 0)),
            hospital: (value) => HospitalPreviewUIModel.fromDTO(
                value, LatLngUIModel(lat: 0, lng: 0))),
        reviewDesc: responseDTO.reviewDesc);
  }
}
