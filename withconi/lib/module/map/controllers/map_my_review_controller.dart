import 'package:withconi/data/enums/enum.dart';
import 'package:withconi/global_widgets/dialog/selection_dialog.dart';
import 'package:withconi/data/repository/map_repository.dart';
import 'package:withconi/module/ui_model/review_detail_ui_model.dart';
import 'package:withconi/module/ui_model/review_preview_ui_model.dart';
import 'package:withconi/global_widgets/loading/loading_overlay.dart';
import '../../../data/model/dto/response_dto/review_response/review_list_response_dto.dart';
import '../../../global_widgets/photo_gallary/image_item.dart';
import '../../../import_basic.dart';
import '../../../core/tools/helpers/infinite_scroll.dart';
import '../../../core/error_handling/failure_ui_interpreter.dart';
import '../abstract/map_update_abstract.dart';

class MapMyReviewController extends GetxController
    implements AbstractMapReviewUpdate {
  MapMyReviewController(
      this._mapRepository, this._lat, this._lng, this._mapUpdateAbstract);
  final MapRepository _mapRepository;
  final AbstractMapReviewUpdate? _mapUpdateAbstract;

  RxList<ReviewDetailUIModel> myReviewList = <ReviewDetailUIModel>[].obs;
  RxInt totalReviewNum = 0.obs;

  final Rx<PaginationFilter> _paginationFilter = PaginationFilter(
    page: 1,
    listSize: 200,
  ).obs;

  // final RxBool _lastPage = false.obs;

  late final double _lat;
  late final double _lng;
  // final RxBool _isLoading = false.obs;

  // int get limit => _paginationFilter.value.listSize;
  // int get _page => _paginationFilter.value.page;

  // void loadNextPage() => _changePaginationFilter(_page + 1, limit);

  // void loadNewPage() {
  //   myReviewList.clear();
  //   _lastPage.value = false;
  //   _changePaginationFilter(_page + 1, limit);
  // }

  @override
  Future<void> onReady() async {
    super.onReady();

    await showLoading((() => _getMyReviewList()));
    // ever(_paginationFilter, (_) => _getMyReviewList());

    // _addScrollListener(
    //     isLastPage: _lastPage,
    //     isLoading: _isLoading,
    //     onEndOfScroll: loadNextPage,
    //     scrollController: scrollController.value);
  }

  goToPhotoVerificationPage(int index) async {
    if (myReviewList[index].isPhotoReview) {
      Get.toNamed(
        Routes.MAP_IMAGE_VERIFICATION,
        arguments: {
          'selectedImageList': myReviewList[index].reviewImageList,
          'editable': false
        },
      );
    }

    // if (imageAdded != null) {
    //   myReviewList[index].reviewImageList.assignAll(imageAdded.toList());
    //   myReviewList[index].isPhotoReview =
    //       myReviewList[index].reviewImageList.isNotEmpty;
    //   myReviewList.refresh();
    // }
  }

  Future<void> _getMyReviewList() async {
    final myReviewResponseEither = await _mapRepository.getMyReviewList(
        paginationFilter: _paginationFilter.value);

    myReviewResponseEither.fold(
        (fail) =>
            FailureInterpreter().mapFailureToSnackbar(fail, '_getPostList'),
        (reviewResponseDto) {
      if (reviewResponseDto.totalDocuments == 0) {
      } else {
        totalReviewNum.value = reviewResponseDto.totalDocuments;
        myReviewList.assignAll(_parseReviewListDto(reviewResponseDto));
      }
    });
  }

  List<ReviewDetailUIModel> _parseReviewListDto(ReviewListResponseDTO dto) {
    return dto.list.map((e) => ReviewDetailUIModel.fromDTO(e)).toList();
  }

  resetPage() {
    // loadNewPage();
  }

  void _changePaginationFilter(int page, int limit) {
    _paginationFilter.update((val) {
      val!.page = page;
      val.listSize = limit;
    });
  }

  goToNewReviewPage() async {
    var newReview = await Get.toNamed(Routes.MAP_NEW_REVIEW,
        arguments: {'placeSelected': false, 'lat': _lat, 'lng': _lng});

    if (newReview != null) {
      addReview(newReview);
    }
  }

  onMoreTap(ReviewDetailUIModel review, MoreBottomSheetOption? option) async {
    if (option == MoreBottomSheetOption.delete) {
      var confirm = await showSelectionDialog(
          confirmText: '삭제',
          cancleText: '취소',
          title: '리뷰를 삭제할까요?',
          subtitle: '삭제된 리뷰는 복구할 수 없어요');
      if (confirm == true) {
        _onDeleteReviewTap(review);
      }
    }
  }

  onReviewTap(int reviewIndex) {
    Get.toNamed(Routes.MAP_REVIEW_DETAIL,
        arguments: {'reviewDetail': myReviewList[reviewIndex]});
  }

  _onDeleteReviewTap(ReviewDetailUIModel review) async {
    showLoading(() async {
      var deleteEither = await _mapRepository.deleteMyReview(
          reviewId: review.reviewId, placeId: review.placeId);

      bool result = deleteEither.fold((fail) {
        FailureInterpreter().mapFailureToSnackbar(fail, '_onDeleteReviewTap');
        return false;
      }, (succeed) {
        return succeed;
      });

      if (result) {
        deleteReview(review.reviewId, review.placeId);
      }
    });
  }

  // goToEditReviewPage(int reviewIndex) {
  //   Get.toNamed(Routes.MAP_REVIEW_DETAIL,
  //       arguments: {'reviewDetail': myReviewList[reviewIndex]});
  // }

  @override
  void addReview(ReviewDetailUIModel newReview) {
    var newReviewPreview = ReviewDetailUIModel(
        diseaseTypes: newReview.diseaseTypes,
        reviewItems: newReview.reviewItems,
        reviewRate: newReview.reviewRate,
        placeId: newReview.placeId,
        reviewId: newReview.reviewId,
        reviewImageList: newReview.reviewImageList,
        isPhotoReview: newReview.reviewImageList.isNotEmpty,
        placeName: newReview.placeName,
        placeAddress: newReview.placeAddress,
        conimals: newReview.conimals,
        diseaseList: newReview.diseaseList,
        placeThumbnail: newReview.placeThumbnail,
        reviewDesc: '');

    myReviewList.insert(0, newReviewPreview);
    totalReviewNum.value += 1;
    myReviewList.refresh();

    if (_mapUpdateAbstract != null) {
      _mapUpdateAbstract!.addReview(newReview);
    }
  }

  @override
  void deleteReview(String reviewId, String placeId) {
    int index =
        myReviewList.indexWhere((element) => element.reviewId == reviewId);
    myReviewList.removeAt(index);
    totalReviewNum.value -= 1;
    myReviewList.refresh();

    if (_mapUpdateAbstract != null) {
      _mapUpdateAbstract!.deleteReview(reviewId, placeId);
    }
  }
}
