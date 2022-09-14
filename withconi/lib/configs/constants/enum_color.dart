import 'dart:ui';

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
