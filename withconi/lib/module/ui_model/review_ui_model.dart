import 'package:withconi/data/model/hospital_preview.dart';
import 'package:withconi/data/model/pharmacy_preview.dart';
import 'package:withconi/data/enums/enum.dart';
import 'package:withconi/module/ui_model/conimal_ui_model.dart';
import 'package:withconi/module/ui_model/place_preview_ui.dart';

import '../../data/model/abstract_class/place_preview.dart';
import '../../data/model/disease.dart';

class ReviewUIModel {
  ReviewUIModel({
    required this.conimals,
    required this.diseaseTypes,
    required this.reviewItems,
    required this.reviewRate,
    required this.diseaseList,
    required this.placePreviewUIModel,
    required this.reviewDesc,
  });

  List<ConimalUIModel> conimals;
  List<DiseaseType> diseaseTypes;
  List<Disease> diseaseList;
  ReviewRate reviewRate;
  List<ReviewItem> reviewItems;
  PlacePreviewUIModel placePreviewUIModel;
  String reviewDesc;
}
