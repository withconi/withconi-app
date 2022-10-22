import 'package:dartz/dartz.dart';
import 'package:withconi/controller/ui_interpreter/failure_ui_interpreter.dart';
import 'package:withconi/core/error_handling/error_message_object.dart';
import 'package:withconi/data/model/disease.dart';
import 'package:withconi/data/repository/disease_repository.dart';
import '../../core/error_handling/failures.dart';
import '../../data/model/response_model/response_model.dart';
import '../../import_basic.dart';
import '../ui_helper/infinite_scroll.dart';

class DiseaseSearchController extends GetxController
    with StateMixin<List<Disease>> {
  RxString _disease = ''.obs;
  final DiseaseRepository _diseaseRepository = DiseaseRepository();
  TextEditingController diseaseTextController = TextEditingController();
  RxBool listLoaded = false.obs;
  String get disease => _disease.value;
  Rxn<Failure> failure = Rxn<Failure>();
  RxList<Disease> diseaseListSelected = RxList<Disease>();
  RxList<Disease> diseaseListSearched = RxList<Disease>();

  final Rx<PaginationFilter> _paginationFilter = PaginationFilter(
    page: 1,
    limit: 20,
  ).obs;

  Rx<ScrollController> scrollController = ScrollController().obs;

  final RxBool _lastPage = false.obs;
  final RxBool _isLoading = false.obs;

  RxInt count = 0.obs;

  late Worker _debounceWorker;

  int get limit => _paginationFilter.value.limit;
  int get _page => _paginationFilter.value.page;

  void loadNextPage() => _changePaginationFilter(_page + 1, limit);

  @override
  void onInit() {
    super.onInit();

    diseaseListSelected
        .assignAll(Get.arguments ?? <Disease>[] as List<Disease>);
    change(null, status: RxStatus.empty());
  }

  @override
  void onReady() {
    super.onReady();

    _debounceWorker = debounce(_disease, _changeSeachKeywords,
        time: Duration(milliseconds: 300));

    ever(_paginationFilter, _getDiseaseList);

    scrollController.value.addListener(() {
      var nextPageTrigger =
          0.8 * scrollController.value.position.maxScrollExtent;
      if (!_isLoading.value &&
          !_lastPage.value &&
          scrollController.value.offset >= nextPageTrigger) {
        loadNextPage();
      }
    });
  }

  @override
  void onClose() {
    super.onClose();
    scrollController.value.dispose();
    _debounceWorker.dispose();
  }

  void _changePaginationFilter(int page, int limit) {
    _paginationFilter.update((val) {
      val!.page = page;
      val.limit = limit;
    });
  }

  void _changeSeachKeywords(_keyword) {
    diseaseListSearched.clear();
    _lastPage.value = false;
    _changePaginationFilter(1, limit);
  }

  void onDiseaseChanged(String val) {
    _disease.value = val;
    count.value++;
    if (val.isEmpty) clearResult();
  }

  void clearResult() {
    diseaseTextController.clear();
    diseaseListSearched.clear();
    change(null, status: RxStatus.empty());
  }

  _getDiseaseList(_paginationFilter) async {
    if (disease.isEmpty) {
      clearResult();
      return;
    } else {
      _isLoading.value = true;
      if (_paginationFilter.page == 1) {
        change(null, status: RxStatus.loading());
      }

      Either<Failure, DiseaseResponse> newResultListEither =
          await _diseaseRepository.getDiseaseList(
              diseaseName: disease, paginationFilter: _paginationFilter);

      newResultListEither.fold((failure) {
        ErrorMessage errorMessage =
            ErrorMessage.mapFailureToErrorMessage(failure: failure);
        change(null, status: RxStatus.error(errorMessage.message));
      }, (diseaseResponse) {
        if (diseaseResponse.list.isEmpty) {
          _lastPage.value = true;
        } else {
          diseaseListSearched.addAll(diseaseResponse.list);
        }
        change(diseaseListSearched, status: RxStatus.success());
        _isLoading.value = false;
      });
      Get.focusScope!.unfocus();
    }
  }

  // _getMoreDiseaseList(_paginationFilter) async {
  //   if (disease.isEmpty) {
  //     clearResult();
  //     return;
  //   } else {
  //     change(null, status: RxStatus.loading());

  //     Either<Failure, DiseaseResponse> newResultListEither =
  //         await _diseaseRepository.getDiseaseList(
  //             diseaseName: disease, paginationFilter: _paginationFilter);

  //     newResultListEither.fold((failure) {
  //       ErrorMessage errorMessage =
  //           ErrorMessage.mapFailureToErrorMessage(failure: failure);
  //       change(null, status: RxStatus.error(errorMessage.message));
  //     }, (diseaseResponse) {
  //       if (diseaseResponse.list.isEmpty) {
  //         _lastPage.value = true;
  //       } else {
  //         diseaseListSearched.addAll(diseaseResponse.list);
  //       }

  //       change(diseaseListSearched, status: RxStatus.success());
  //     });
  //   }
  // }

  onDiseaseClicked(Disease disease) {
    if (diseaseListSelected.contains(disease)) {
      diseaseListSelected.remove(disease);
    } else {
      if (diseaseListSelected.length < 3) {
        diseaseListSelected.add(disease);
      } else {
        FailureInterpreter().mapFailureToDialog(
            Failure.maxDiseaseFailure(), 'onDiseaseClicked');
      }
    }
  }

  saveDiseases() {
    Get.back(result: diseaseListSelected.toList());
  }
}
