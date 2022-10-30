import 'dart:ui';
import '../../import_basic.dart';
import '../../module/theme/colors.dart';
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
      return WcColors.blue100.withOpacity(0.7);
    case DiseaseType.urinary:
      return WcColors.yellowLight;
    case DiseaseType.respiratory:
      return WcColors.purpleLight;
//
    case DiseaseType.infectiousDisease:
      return WcColors.grey110;
    case DiseaseType.emergency:
      return WcColors.red100;

    case DiseaseType.endocrinology:
      return WcColors.green100;

    case DiseaseType.otorhinolaryngology:
      return WcColors.mustardLight;

    case DiseaseType.brainNeurology:
      return WcColors.orange100;

    case DiseaseType.oncology:
      return WcColors.blue100;
    case DiseaseType.dermatology:
      return WcColors.purpleLight;

    case DiseaseType.dentistry:
      return WcColors.babyPinkLight;

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

Color backgroundColorByGender(Gender? gender) {
  switch (gender) {
    case Gender.female:
      return WcColors.red20;
    case Gender.male:
      return WcColors.blue20;
    default:
      return Colors.transparent;
  }
}

Color textColorByGender(Gender? gender) {
  switch (gender) {
    case Gender.female:
      return WcColors.red100;
    case Gender.male:
      return WcColors.blue100;
    default:
      return Colors.transparent;
  }
}

Color colorByDiseasePosibility(DiseasePosibility posibility) {
  switch (posibility) {
    case DiseasePosibility.high:
      return WcColors.red100;
    case DiseasePosibility.middle:
      return WcColors.orange100;
    case DiseasePosibility.low:
      return WcColors.yellowLight;
    default:
      return WcColors.white;
  }
}
