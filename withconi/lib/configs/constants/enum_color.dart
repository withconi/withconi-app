import 'dart:ui';
import '../../import_basic.dart';
import '../../ui/theme/colors.dart';
import 'enum.dart';

Color colorByDisease(DiseaseType? diseaseType) {
  switch (diseaseType) {
    case DiseaseType.cardiovascular:
      return WcColors.pinkLight;
    case DiseaseType.musculoskeletal:
      return WcColors.grey160;
    case DiseaseType.digestive:
      return WcColors.mintLight;
    case DiseaseType.ophthalmology:
      return WcColors.blue80;
    case DiseaseType.urinary:
      return WcColors.yellowLight;
    case DiseaseType.respiratory:
      return WcColors.purpleLight;
    default:
      return WcColors.green40;
  }
}

Color colorBySpecies(Species? species) {
  switch (species) {
    case Species.cat:
      return WcColors.blue80;
    case Species.dog:
      return WcColors.mintLight;
    default:
      return WcColors.green40;
  }
}

Color colorByReview(ReviewRate? reviewRate) {
  switch (reviewRate) {
    case ReviewRate.high:
      return WcColors.blue80;
    case ReviewRate.middle:
      return WcColors.yellowLight;
    case ReviewRate.low:
      return WcColors.pinkLight;
    default:
      return WcColors.grey110;
  }
}

Color postTypeBackgroundColor(PostType postType) {
  switch (postType) {
    case PostType.all:
      return WcColors.orange20;
    case PostType.cat:
      return WcColors.blue60;
    case PostType.dog:
      return WcColors.green40;
    default:
      return Colors.transparent;
  }
}

Color speciesBackgroundColor(Species species) {
  switch (species) {
    case Species.dog:
      return WcColors.orange20;
    case Species.cat:
      return WcColors.blue60;

    default:
      return Colors.transparent;
  }
}

Color postTypeTextColor(PostType postType) {
  switch (postType) {
    case PostType.all:
      return WcColors.orange100;
    case PostType.cat:
      return WcColors.blue100;
    case PostType.dog:
      return WcColors.green100;

    default:
      return Colors.transparent;
  }
}

Color speciesTypeTextColor(Species species) {
  switch (species) {
    case Species.dog:
      return WcColors.orange100;
    case Species.cat:
      return WcColors.blue100;

    default:
      return Colors.transparent;
  }
}
