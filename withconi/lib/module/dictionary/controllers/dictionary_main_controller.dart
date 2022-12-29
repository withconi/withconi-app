import 'package:dartz/dartz.dart';
import 'package:withconi/core/error_handling/failure_ui_interpreter.dart';
import 'package:withconi/data/model/dto/response_dto/disease_response/disease_common_list_response_dto.dart';
import 'package:withconi/data/repository/community_repository.dart';
import 'package:withconi/module/ui_model/board_ui_model.dart';
import 'package:withconi/module/ui_model/disease_ui_model.dart';
import '../../../core/error_handling/error_message_object.dart';
import '../../../core/error_handling/failures.dart';
import '../../../core/tools/helpers/infinite_scroll.dart';
import '../../../data/enums/enum.dart';
import '../../../data/model/dto/response_dto/disease_response/disease_response_dto.dart';
import '../../../data/repository/disease_repository.dart';
import '../../../import_basic.dart';
import '../../auth/auth_controller.dart';
import '../../community/controllers/custom_state_mixin.dart';
import '../../page_status.dart';

class DictionaryMainController extends GetxController with WcStateMixin {
  DictionaryMainController(this._diseaseRepository);
  final DiseaseRepository _diseaseRepository;
  TextEditingController boardKeywordTextController = TextEditingController();
  // RxList<BoardUIModel> boardList = RxList<BoardUIModel>();
  // RxList<PostUIModel> hotPostList = RxList<PostUIModel>();
  RxList<DiseaseUIModel> catDiseaseList = RxList<DiseaseUIModel>();
  RxList<DiseaseUIModel> dogDiseaseList = RxList<DiseaseUIModel>();

  final RxString _diseaseKeyword = ''.obs;

  String get diseaseKeywords => _diseaseKeyword.value;

  TextEditingController diseaseTextController = TextEditingController();
  RxList<DiseaseUIModel> diseaseListSearched = RxList<DiseaseUIModel>();

  int get _page => _paginationFilter.value.page;
  int get _listSize => _paginationFilter.value.listSize;

  late Worker _debounceWorker;

  void loadNextPage() => changePaginationFilter(_page + 1, _listSize);

  void loadNewPage() => changePaginationFilter(1, _listSize);

  final Rx<PaginationFilter> _paginationFilter =
      PaginationFilter(page: 1, listSize: 30).obs;

  @override
  onInit() async {
    super.onInit();

    await _getCommonDiseaseList();

    change(null, status: const PageStatus.init());
  }

  _getCommonDiseaseList() async {
    var diseaseEither = await _diseaseRepository.getCommonDiseaseList();

    DiseaseCommonListResponseDTO? result = diseaseEither.fold((fail) {
      FailureInterpreter().mapFailureToSnackbar(fail, '_getCommonDiseaseList');
      return null;
    }, (responseDTO) => responseDTO);
    try {
      if (result != null) {
        catDiseaseList.assignAll(_parseDtoToUiModel(result.catDiseaseList));
        dogDiseaseList.assignAll(_parseDtoToUiModel(result.catDiseaseList));
        change(null, status: const PageStatus.init());
      } else {
        change([], status: const PageStatus.empty());
      }
    } catch (e) {
      change([], status: const PageStatus.empty());
    }
  }

  goToDiseaseDetailPage(Species species, int diseaseIndex) {
    switch (species) {
      case Species.cat:
        Get.toNamed(Routes.DICTIONARY_DETAIL, arguments: {
          'diseaseId': catDiseaseList[diseaseIndex].diseaseId,
        });
        break;

      case Species.dog:
        Get.toNamed(Routes.DICTIONARY_DETAIL, arguments: {
          'diseaseId': dogDiseaseList[diseaseIndex].diseaseId,
        });
        break;
      default:
    }
  }

  @override
  void onReady() {
    super.onReady();

    _debounceWorker = debounce(_diseaseKeyword, (_) => loadNewPage(),
        time: const Duration(milliseconds: 700));
    ever(_paginationFilter, getDataByPaginationFilter);
  }

  @override
  getDataByPaginationFilter(PaginationFilter _paginationFilter) async {
    if (_paginationFilter.page == 1) {
      await _getDiseaseList(_paginationFilter);
    } else if (_paginationFilter.page > 1) {
      await _moreDiseaseList(_paginationFilter);
    }
  }

  @override
  void onClose() {
    super.onClose();
    _debounceWorker.dispose();
  }

  @override
  void changePaginationFilter(int page, int listSize) {
    _paginationFilter.update((val) {
      val!.page = page;
      val.listSize = listSize;
    });
  }

  void onDiseaseChanged(String val) {
    if (val.isEmpty) {
      clearResult();
      return;
    } else {
      _diseaseKeyword.value = val;
    }
  }

  void clearResult() {
    diseaseTextController.clear();
    diseaseListSearched.clear();
    change([], status: const PageStatus.init());
  }

  _getDiseaseList(_paginationFilter) async {
    change(null, status: const PageStatus.loading());
    Either<Failure, List<DiseaseResponseDTO>> newResultListEither =
        await _diseaseRepository.getDiseaseList(
            keyword: diseaseKeywords, paginationFilter: _paginationFilter);

    newResultListEither.fold((failure) {
      ErrorObject errorObject =
          ErrorObject.mapFailureToErrorMessage(failure: failure);
      change(null, status: PageStatus.error(errorObject.message));
    }, (dtoList) {
      if (dtoList.isEmpty) {
        change(null, status: const PageStatus.empty());
      } else {
        diseaseListSearched.assignAll(_parseDtoToUiModel(dtoList));
        change(diseaseListSearched, status: const PageStatus.success());
      }
    });

    diseaseListSearched.refresh();
  }

  _moreDiseaseList(_paginationFilter) async {
    // pageStatus.value = PageStatus.loadingMore();

    change(null, status: const PageStatus.loadingMore());

    Either<Failure, List<DiseaseResponseDTO>> newResultListEither =
        await _diseaseRepository.getDiseaseList(
            keyword: _diseaseKeyword.value,
            paginationFilter: _paginationFilter);

    newResultListEither.fold((failure) {
      ErrorObject errorMessage =
          ErrorObject.mapFailureToErrorMessage(failure: failure);
      // pageStatus.value = PageStatus.error(errorMessage.message);
      change(null, status: PageStatus.error(errorMessage.message));
    }, (dtoList) {
      if (dtoList.isEmpty) {
        // pageStatus.value = PageStatus.emptyLastPage();

        change([], status: const PageStatus.emptyLastPage());
      } else {
        diseaseListSearched.addAll(_parseDtoToUiModel(dtoList));
        // pageStatus.value = PageStatus.success();
        change(diseaseListSearched, status: const PageStatus.success());
      }
    });

    diseaseListSearched.refresh();
    Get.focusScope!.unfocus();
    // }
  }

  List<DiseaseUIModel> _parseDtoToUiModel(List<DiseaseResponseDTO> dto) {
    return dto.map((e) => DiseaseUIModel.fromDTO(e)).toList();
  }
}
