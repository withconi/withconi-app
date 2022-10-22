import 'package:dartz/dartz.dart';
import 'package:withconi/controller/navigation_controller.dart';

import '../../configs/constants/enum.dart';
import '../../core/error_handling/failures.dart';
import '../../data/repository/map_repository.dart';
import '../../import_basic.dart';
import 'package:app_settings/app_settings.dart';

import '../../ui/entities/place_verfication.dart';
import '../ui_interpreter/failure_ui_interpreter.dart';

class MapVerificationController extends GetxController {
  MapRepository _mapRepository = MapRepository();
  String placeId = '635082ac09f265afe75dc70d';
  PlaceType placeType = PlaceType.pharmacy;
  late Rx<VerificationGroup> verificationGroup;
  RxBool isLoading = true.obs;
  @override
  onInit() async {
    super.onInit();
    await setPlaceVerification();
  }

  setPlaceVerification() async {
    isLoading.value = true;
    Either<Failure, VerificationGroup> placeVerificationResult =
        await _mapRepository.getPlaceVerification(
            locId: placeId, placeType: placeType);

    placeVerificationResult.fold(
        (failure) => FailureInterpreter().mapFailureToSnackbar(
            failure, 'getPlaceVerification'), (verification) {
      verificationGroup = verification.obs;
    });
    isLoading.value = false;
  }
}
