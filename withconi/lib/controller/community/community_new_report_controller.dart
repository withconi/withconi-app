import 'dart:io';
import 'package:dartz/dartz.dart';
import 'package:withconi/configs/constants/enum.dart';
import 'package:withconi/controller/auth_controller.dart';
import 'package:withconi/data/repository/community_repository.dart';
import 'package:withconi/data/repository/image_repository.dart';
import 'package:withconi/ui/widgets/loading/loading_overlay.dart';
import 'package:withconi/ui/widgets/photo_gallary/image_item.dart';
import '../../configs/helpers/image_picker_helper.dart';
import '../../core/error_handling/failures.dart';
import '../../data/model/conimal.dart';
import '../../data/model/post.dart';
import '../../data/model/report.dart';
import '../../import_basic.dart';
import '../../ui/widgets/dialog/selection_dialog.dart';
import '../ui_interpreter/failure_ui_interpreter.dart';

class CommunityNewReportController extends GetxController {
  final CommunityRepository _communityRepository = CommunityRepository();
  List<ReportItem> reportItemList = [
    ReportItem.animalCruelty,
    ReportItem.maliciousContents,
    ReportItem.sexualContents,
    ReportItem.wrongInformation,
    ReportItem.promotionalContents,
    ReportItem.ect
  ];
  Rxn<ReportItem> selectedReportItem = Rxn<ReportItem>();
  TextEditingController reportDetailTextController = TextEditingController();

  late Report newReport;

  @override
  onInit() {
    super.onInit();
    newReport = Get.arguments as Report;
  }

  onReportItemChanged(ReportItem reportItem) {
    selectedReportItem.value = reportItem;
  }

  validateButton() {
    if (selectedReportItem.value != null) {
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
        _communityRepository.createReport(
            newReport:
                newReport.copyWith(reviewDesc: [selectedReportItem.value!])));
    createEither.fold((failure) {
      FailureInterpreter().mapFailureToDialog(failure, '_createNewReport');
    }, (success) {
      Get.back();
    });
  }
}
