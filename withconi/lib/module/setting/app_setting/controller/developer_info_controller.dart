import 'package:withconi/core/error_handling/failure_ui_interpreter.dart';
import 'package:withconi/data/enums/enum.dart';
import 'package:withconi/data/model/dto/response_dto/setting_response/developer_info_response_dto.dart';
import 'package:withconi/data/repository/app_setting_repository.dart';

import '../../../../import_basic.dart';

class DeveloperInfoController extends GetxController {
  DeveloperInfoController(
    this._settingRepository,
  );
  final AppSettingRepository _settingRepository;

  Rx<DeveloperInfoResponseDTO> backend = DeveloperInfoResponseDTO(
          buymeacoffee: "https://www.buymeacoffee.com/seungdeokjeong",
          github: 'https://github.com/seungdeok',
          mail: 'jeong9132@gmail.com')
      .obs;
  Rx<DeveloperInfoResponseDTO> frontend = DeveloperInfoResponseDTO(
          buymeacoffee: 'https://www.buymeacoffee.com/yellowtoast',
          github: 'https://github.com/Yellowtoast',
          mail: 'kjh9519@naver.com')
      .obs;

  String frontendImageSrc = 'assets/images/jihye_profile.jpg';
  String backendImageSrc = 'assets/images/sd_profile.jpeg';

  @override
  onInit() {
    super.onInit();
    _getDeveloperInfo();
  }

  _getDeveloperInfo() async {
    var infoEither = await _settingRepository.getDeveloperInfo();

    var result = infoEither.fold((fail) {
      FailureInterpreter().mapFailureToSnackbar(fail, '_getDeveloperInfo');
      return null;
    }, (result) => result);

    if (result != null) {
      if (result.frontend.mail.isNotEmpty &&
          result.frontend.github.isNotEmpty &&
          result.frontend.buymeacoffee.isNotEmpty) {
        frontend.value = result.frontend;
      }

      if (result.backend.mail.isNotEmpty &&
          result.backend.github.isNotEmpty &&
          result.backend.buymeacoffee.isNotEmpty) {
        backend.value = result.backend;
      }

      frontend.refresh();
      backend.refresh();
    }
  }
}
