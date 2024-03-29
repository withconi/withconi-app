// import 'package:crypto/crypto.dart';
// import 'package:dartz/dartz.dart';
// import 'package:withconi/core/error_handling/failure_ui_interpreter.dart';
// import 'package:withconi/core/error_handling/error_message_object.dart';
// import 'package:withconi/data/enums/enum.dart';
// import 'package:withconi/data/model/dto/response_dto/disease_response/disease_response_dto.dart';
// import 'package:withconi/data/repository/disease_repository.dart';
// import 'package:withconi/global_widgets/loading/loading_overlay.dart';
// import 'package:withconi/module/community/controllers/custom_state_mixin.dart';
// import 'package:withconi/module/page_status.dart';
// import 'package:withconi/module/ui_model/disease_ui_model.dart';
// import '../../../core/error_handling/failures.dart';
// import '../../../import_basic.dart';
// import '../../../core/tools/helpers/infinite_scroll.dart';

// class DictionarySearchController extends GetxController with WcStateMixin {
//   DictionarySearchController(this._diseaseRepository);
//   final DiseaseRepository _diseaseRepository;

//   final RxString _diseaseKeyword = ''.obs;

//   TextEditingController diseaseTextController = TextEditingController();
//   RxBool listLoaded = false.obs;
//   String get diseaseKeywords => _diseaseKeyword.value;
//   Rxn<Failure> failure = Rxn<Failure>();
//   RxList<DiseaseUIModel> diseaseListSearched = RxList<DiseaseUIModel>();

//   int get _page => _paginationFilter.value.page;
//   int get _listSize => _paginationFilter.value.listSize;

//   late Worker _debounceWorker;

//   @override
//   void loadNextPage() => changePaginationFilter(_page + 1, _listSize);

//   @override
//   void loadNewPage() => changePaginationFilter(1, _listSize);
//   // @override
//   // Rx<PageStatus> pageStatus = const PageStatus.init().obs;

//   @override
//   final Rx<PaginationFilter> _paginationFilter =
//       PaginationFilter(page: 1, listSize: 8).obs;

//   @override
//   void onInit() {
//     super.onInit();
//     change(null, status: const PageStatus.init());
//   }

//   @override
//   void onReady() {
//     super.onReady();

//     _debounceWorker = debounce(_diseaseKeyword, (_) => loadNewPage(),
//         time: const Duration(milliseconds: 700));
//     ever(_paginationFilter, getDataByPaginationFilter);
//   }

//   @override
//   getDataByPaginationFilter(PaginationFilter _paginationFilter) async {
//     if (_paginationFilter.page == 1) {
//       await _getDiseaseList(_paginationFilter);
//     } else if (_paginationFilter.page > 1) {
//       await _moreDiseaseList(_paginationFilter);
//     }
//   }

//   @override
//   void onClose() {
//     super.onClose();
//     _debounceWorker.dispose();
//   }

//   @override
//   void changePaginationFilter(int page, int listSize) {
//     _paginationFilter.update((val) {
//       val!.page = page;
//       val.listSize = listSize;
//     });
//   }

//   void onDiseaseChanged(String val) {
//     if (val.isEmpty) return;
//     _diseaseKeyword.value = val;
//   }

//   void clearResult() {
//     diseaseTextController.clear();
//     diseaseListSearched.clear();
//     change([], status: const PageStatus.success());
//   }

//   _getDiseaseList(_paginationFilter) async {
//     change([], status: const PageStatus.loading());
//     Either<Failure, List<DiseaseResponseDTO>> newResultListEither =
//         await _diseaseRepository.getDiseaseList(
//             keyword: diseaseKeywords, paginationFilter: _paginationFilter);

//     newResultListEither.fold((failure) {
//       ErrorObject errorObject =
//           ErrorObject.mapFailureToErrorMessage(failure: failure);
//       change([], status: PageStatus.error(errorObject.message));
//     }, (dtoList) {
//       if (dtoList.isEmpty) {
//         change([], status: const PageStatus.empty());
//       } else {
//         diseaseListSearched.assignAll(parseDtoToUiModel(dtoList));
//         change(diseaseListSearched, status: const PageStatus.success());
//       }
//     });

//     diseaseListSearched.refresh();

//     Get.focusScope!.unfocus();
//   }

//   _moreDiseaseList(_paginationFilter) async {
//     // pageStatus.value = PageStatus.loadingMore();

//     change(null, status: const PageStatus.loadingMore());

//     Either<Failure, List<DiseaseResponseDTO>> newResultListEither =
//         await _diseaseRepository.getDiseaseList(
//             keyword: diseaseKeywords, paginationFilter: _paginationFilter);

//     newResultListEither.fold((failure) {
//       ErrorObject errorMessage =
//           ErrorObject.mapFailureToErrorMessage(failure: failure);
//       // pageStatus.value = PageStatus.error(errorMessage.message);
//       change(null, status: PageStatus.error(errorMessage.message));
//     }, (dtoList) {
//       if (dtoList.isEmpty) {
//         // pageStatus.value = PageStatus.emptyLastPage();

//         change([], status: const PageStatus.emptyLastPage());
//       } else {
//         diseaseListSearched.addAll(parseDtoToUiModel(dtoList));
//         // pageStatus.value = PageStatus.success();
//         change(diseaseListSearched, status: const PageStatus.success());
//       }
//     });

//     diseaseListSearched.refresh();

//     // }
//   }

//   List<DiseaseUIModel> parseDtoToUiModel(List<DiseaseResponseDTO> dto) {
//     return dto.map((e) => DiseaseUIModel.fromDTO(e)).toList();
//   }
// }
