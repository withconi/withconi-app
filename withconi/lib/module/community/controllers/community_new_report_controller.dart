import 'package:dartz/dartz.dart';
import 'package:withconi/data/enums/enum.dart';
import 'package:withconi/data/repository/community_repository.dart';

import 'package:withconi/global_widgets/loading/loading_overlay.dart';

import 'package:withconi/module/ui_model/report_ui_model.dart';

import '../../../core/error_handling/failures.dart';

import '../../../import_basic.dart';

import '../../../core/error_handling/failure_ui_interpreter.dart';

class CommunityNewReportController extends GetxController {
  CommunityNewReportController(this._communityRepository);
  final CommunityRepository _communityRepository;
  // List<ReportItem> reportItemList = [
  //   ReportItem.animalCruelty,
  //   ReportItem.maliciousContents,
  //   ReportItem.sexualContents,
  //   ReportItem.wrongInformation,
  //   ReportItem.promotionalContents,
  //   ReportItem.ect
  // ];
  // Rxn<ReportItem> selectedReportItem = Rxn<ReportItem>();
  TextEditingController reportDetailTextController = TextEditingController();

  late Rx<ReportUIModel> newReport;

  @override
  onInit() {
    super.onInit();
    newReport = Rx<ReportUIModel>(Get.arguments as ReportUIModel);
  }

  onReportItemChanged(ReportItem reportItem) {
    newReport.value.reportItem = reportItem;
    newReport.refresh();
  }

  validateButton() {
    if (newReport.value.reportItem != null) {
      return true;
    } else {
      return false;
    }
  }

  onButtonTap() async {
    await _createNewReport();
  }

  _createNewReport() async {
    Either<Failure, bool> createEither = await showLoading(() =>
        _communityRepository.createReport(reportUiModel: newReport.value));
    createEither.fold((failure) {
      FailureInterpreter().mapFailureToDialog(failure, '_createNewReport');
    }, (success) {
      Get.back();
    });
  }
}
