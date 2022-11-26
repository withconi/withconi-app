import 'package:dartz/dartz.dart';
import 'package:withconi/module/navigation/navigation_controller.dart';

import '../../../data/enums/enum.dart';
import '../../../core/error_handling/failures.dart';
import '../../../data/repository/map_repository.dart';
import '../../../import_basic.dart';
import 'package:app_settings/app_settings.dart';

import '../../../data/model/place_verfication.dart';
import '../../../core/error_handling/failure_ui_interpreter.dart';

class MapVerificationController extends GetxController {
  MapVerificationController(this._mapRepository);
  final MapRepository _mapRepository;

  late String placeId;
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
            placeId: placeId, placeType: placeType);

    placeVerificationResult.fold(
        (failure) => FailureInterpreter().mapFailureToSnackbar(
            failure, 'getPlaceVerification'), (verification) {
      verificationGroup = verification.obs;
    });
    isLoading.value = false;
  }
}
