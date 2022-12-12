import 'package:dartz/dartz.dart';
import 'package:withconi/data/enums/enum.dart';
import 'package:withconi/data/repository/community_repository.dart';
import 'package:withconi/global_widgets/dialog/selection_dialog.dart';

import 'package:withconi/global_widgets/loading/loading_overlay.dart';

import 'package:withconi/module/ui_model/report_ui_model.dart';

import '../../../core/error_handling/failures.dart';

import '../../../import_basic.dart';

import '../../../core/error_handling/failure_ui_interpreter.dart';

class CommunityNewReportController extends GetxController {
  CommunityNewReportController(
      this._communityRepository, this._boardId, this._postId, this._authorId);
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
  late final String _boardId;
  late final String _postId;
  late final String _authorId;
  // late final ReportUIModel _newReport;
  Rxn<ReportItem> reportItem = Rxn<ReportItem>();
  String reportDesc = '';

  onReportItemChanged(ReportItem newReportItem) {
    reportItem.value = newReportItem;
  }

  onReportTextChanged(String text) {
    reportDesc = text;
  }

  validateButton() {
    if (reportItem.value != null) {
      return true;
    } else {
      return false;
    }
  }

  onButtonTap() async {
    bool confirmed = await showSelectionDialog(
        confirmText: '신고하기',
        cancleText: '취소',
        title: '신고할까요?',
        subtitle: '신고한 글은 바로 숨겨집니다.');
    if (confirmed) {
      await _createNewReport();
    }
  }

  _createNewReport() async {
    ReportUIModel newReport = ReportUIModel(
        authorId: _authorId,
        boardId: _boardId,
        postId: _postId,
        reportItem: reportItem.value!,
        reportDesc: reportDesc);
    Either<Failure, bool> createEither = await showLoading(() =>
        _communityRepository.createReport(
            reportUiModel: ReportUIModel(
                authorId: _authorId,
                boardId: _boardId,
                postId: _postId,
                reportItem: reportItem.value!,
                reportDesc: reportDesc)));
    createEither.fold((failure) {
      FailureInterpreter().mapFailureToDialog(failure, '_createNewReport');
    }, (success) {
      Get.back(result: newReport);
    });
  }
}
