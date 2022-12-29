import 'package:dartz/dartz.dart';
import 'package:withconi/data/enums/enum.dart';

import '../../../../core/error_handling/failure_ui_interpreter.dart';
import '../../../../core/error_handling/failures.dart';
import '../../../../data/repository/app_setting_repository.dart';
import '../../../../global_widgets/dialog/selection_dialog.dart';
import '../../../../global_widgets/loading/loading_overlay.dart';
import '../../../../import_basic.dart';

import '../../../auth/auth_controller.dart';

class InquiryController extends GetxController {
  InquiryController(
    this._settingRepository,
  );
  // final CommunityRepository _communityRepository;
  final AppSettingRepository _settingRepository;

  TextEditingController inquiryDetailTextController = TextEditingController();
  String get _userId => AuthController.to.userId;

  Rxn<InquiryItem> inquiryItem = Rxn<InquiryItem>();
  RxString inquiryDesc = ''.obs;

  onReportItemChanged(InquiryItem newReportItem) {
    inquiryItem.value = newReportItem;
  }

  onReportTextChanged(String text) {
    inquiryDesc.value = text;
  }

  validateButton() {
    if (inquiryItem.value != null && inquiryDesc.value.isNotEmpty) {
      return true;
    } else {
      return false;
    }
  }

  onButtonTap() async {
    bool confirmed = await showSelectionDialog(
      confirmText: '등록',
      cancleText: '취소',
      title: '건의사항을 등록할까요?',
    );
    if (confirmed) {
      await _createNewInquiry();
    }
  }

  _createNewInquiry() async {
    Either<Failure, bool> createEither = await showLoading(() =>
        _settingRepository.createInquiry(
            inquiryItem: inquiryItem.value!, inquiryDesc: inquiryDesc.value));
    createEither.fold((failure) {
      FailureInterpreter().mapFailureToDialog(failure, '_createNewReport');
    }, (success) {
      Get.back();
    });
  }
}
