import 'package:dartz/dartz.dart';
import 'package:withconi/data/model/dto/request_dto/conimal_request/create_conimal_request_dto.dart';
import 'package:withconi/data/repository/fcm_repository.dart';
import 'package:withconi/module/auth/auth_controller.dart';
import 'package:withconi/core/error_handling/failure_ui_interpreter.dart';
import 'package:withconi/data/repository/conimal_repository.dart';
import 'package:withconi/global_widgets/loading/loading_overlay.dart';
import 'package:withconi/module/ui_model/breed_ui_model.dart';
import 'package:withconi/module/ui_model/conimal_ui_model.dart';
import 'package:withconi/module/ui_model/disease_ui_model.dart';
import '../../../data/enums/enum.dart';
import '../../../core/values/constants/regex.dart';
import '../../../core/values/constants/strings.dart';
import '../../../core/error_handling/failures.dart';
import '../../../import_basic.dart';

class FcmController extends GetxController {
  static FcmController get to => Get.find();
  FcmController(this._fcmRepository);
  final FcmRepository _fcmRepository;

  @override
  Future<void> onInit() async {
    super.onInit();

    Either<Failure, String?> fcmTokenResult =
        await _fcmRepository.getFcmToken();
    String? newFcmToken = fcmTokenResult.fold((l) => null, (r) => r);

    if (newFcmToken != null) {
      Either<Failure, bool> saveFcmTokenResult =
          await _fcmRepository.saveFcmTokenDB(newFcmToken);

      saveFcmTokenResult.fold(
          (l) => null, (r) => _fcmRepository.setupFirebaseMessaging());
    }

    await _fcmRepository.requestPermisstion();
  }

  // @override
  // onClose() async {
  //   super.onClose();
  //   await updateFcmTokenDB(null);
  // }

  updateFcmTokenDB(String? fcmToken) async {
    Either<Failure, bool> saveFcmTokenResult =
        await _fcmRepository.saveFcmTokenDB(fcmToken);

    bool updateTokenResult = saveFcmTokenResult.fold((l) {
      FailureInterpreter().mapFailureToDialog(l, 'removeFcmTokenDB');
      return false;
    }, (r) => true);

    return updateTokenResult;
  }

  deleteFcmToken() async {
    bool succeed = await _fcmRepository.deleteToken();

    await updateFcmTokenDB(null);
  }
}
