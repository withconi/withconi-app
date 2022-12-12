import 'package:dartz/dartz.dart';
import 'package:withconi/data/model/dto/response_dto/community_response/breed_response_dto.dart';
import 'package:withconi/data/repository/conimal_repository.dart';
import 'package:withconi/core/error_handling/error_message_object.dart';
import 'package:withconi/global_widgets/snackbar.dart';
import 'package:withconi/module/ui_model/breed_ui_model.dart';
import '../../../data/enums/enum.dart';
import '../../../core/error_handling/failures.dart';
import '../../../import_basic.dart';
import '../../page_status.dart';

class BreedSearchController extends GetxController {
  BreedSearchController(
    this._conimalRepository,
    this._species,
  );
  final ConimalRepository _conimalRepository;

  late final Species? _species;

  TextEditingController searchKeywordTextController = TextEditingController();
  RxBool listLoaded = false.obs;
  Rxn<Failure> failure = Rxn<Failure>();
  String searchKeyword = '';
  final Rx<Species> selectedSpecies = Species.cat.obs;
  RxList<BreedUIModel> totalBreedList = RxList<BreedUIModel>();
  RxList<BreedUIModel> searchedBreedList = RxList<BreedUIModel>();

  Rx<PageStatus> pageStatus = Rx<PageStatus>(const PageStatus.init());

  @override
  void onReady() {
    super.onReady();
    selectedSpecies.value = _species ?? Species.cat;
    ever(selectedSpecies, _getBreedList);
    _getBreedList(selectedSpecies.value);
  }

  @override
  void onClose() {
    totalBreedList.close();
    searchedBreedList.close();
    super.onClose();
  }

  void onKeywordChanged(String val) {
    searchKeyword = val;
    if (val.isEmpty) {
      clearResult();
      return;
    }
    _setSearchedBreedList(val);
  }

  void clearResult() {
    searchKeywordTextController.clear();
    searchedBreedList.assignAll(totalBreedList.toList());
  }

  _setSearchedBreedList(_keyword) {
    searchedBreedList.assignAll(
        totalBreedList.where((p0) => p0.name.contains(_keyword)).toList());
    searchedBreedList.refresh();
  }

  Future<void> _getBreedList(_species) async {
    pageStatus.value = const PageStatus.loading();
    final Either<Failure, List<BreedResponseDTO>> postDataEither =
        await _conimalRepository.getBreedList(species: _species);

    postDataEither.fold((fail) {
      ErrorObject errorObject =
          ErrorObject.mapFailureToErrorMessage(failure: fail);
      pageStatus.value = PageStatus.error(errorObject.message);
    }, (newBreedListDto) {
      if (newBreedListDto.isEmpty) {
        pageStatus.value = const PageStatus.empty();
        return;
      } else {
        totalBreedList.assignAll(_parseBreedListDto(newBreedListDto));
        searchedBreedList.assignAll(totalBreedList.toList());
        pageStatus.value = const PageStatus.success();
      }

      return;
    });
  }

  List<BreedUIModel> _parseBreedListDto(List<BreedResponseDTO> breedListDto) {
    return breedListDto
        .map((e) => BreedUIModel.fromDto(e, selectedSpecies.value))
        .toList();
  }

  void onSpeciesChanged(Species speciesType) {
    if (_species != null && speciesType != _species) {
      showCustomSnackbar(text: '${_species!.displayName} 종류만 선택 가능합니다');
    } else {
      selectedSpecies.value = speciesType;
    }
  }

  void onBreedSelected(BreedUIModel breed) {
    Get.back(result: breed);
  }
}
