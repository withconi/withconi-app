import 'package:withconi/configs/constants/enum.dart';
import 'package:withconi/controller/auth_controller.dart';

import 'package:withconi/data/model/abstract_class/place_type.dart';
import 'package:withconi/data/model/hospital_preview.dart';
import 'package:withconi/data/model/pharmacy_preview.dart';
import 'package:withconi/data/model/review.dart';
import 'package:withconi/data/repository/community_repository.dart';
import 'package:withconi/ui/entities/location.dart';
import 'package:withconi/ui/entities/review_rate_entity.dart';
import 'package:withconi/ui/widgets/loading.dart';
import '../../import_basic.dart';
import '../ui_helper/infinite_scroll.dart';

class MapMyReviewController extends GetxController {
  RxList<PlaceReview> myReviewList = <PlaceReview>[].obs;
  late String _uid;
  Rx<ScrollController> scrollController = ScrollController().obs;

  final Rx<PaginationFilter> _paginationFilter = PaginationFilter(
    page: 1,
    limit: 15,
  ).obs;

  final RxBool _lastPage = false.obs;

  final RxBool _isLoading = false.obs;

  int get limit => _paginationFilter.value.limit!;
  int get _page => _paginationFilter.value.page!;

  void loadNextPage() => _changePaginationFilter(_page + 1, limit);
  void loadNewPage() {
    myReviewList.clear();
    _changePaginationFilter(1, limit);
  }

  @override
  onInit() async {
    super.onInit();
    _uid = AuthController.to.wcUser.value!.uid;
  }

  @override
  Future<void> onReady() async {
    super.onReady();

    await showLoading((() => _getMyReviewList()));
    ever(_paginationFilter, (_) => _getMyReviewList());

    _addScrollListener(
        isLastPage: _lastPage,
        isLoading: _isLoading,
        onEndOfScroll: loadNextPage,
        scrollController: scrollController.value);
  }

  // @override
  // onClose() {
  //   super.onClose();
  // }

  _addScrollListener(
      {required ScrollController scrollController,
      required void Function() onEndOfScroll,
      required RxBool isLastPage,
      required RxBool isLoading}) {
    scrollController.addListener(() {
      if (!isLoading.value &&
          !isLastPage.value &&
          scrollController.offset >=
              scrollController.position.maxScrollExtent) {
        onEndOfScroll();
      }
    });
  }

  Future<void> _getMyReviewList() async {
    // final postDataEither =
    //     await _communityRepository.getLikedPostList(uid: _uid);

    // postDataEither.fold(
    //     (fail) =>
    //         FailureInterpreter().mapFailureToSnackbar(fail, '_getPostList'),
    //     (newPostList) {
    //   bookmarkedPlaceList.clear();

    //   if (newPostList.isEmpty) {
    //   } else {
    //     bookmarkedPlaceList.addAll(newPostList);
    //   }
    // });

    List<PlaceReview> newReviewList = [
      PlaceReview(
          userId: 'user1',
          placeId: 'placeId1',
          visitVerified: true,
          conimals: [],
          diseaseTypes: [],
          reviewEntity: HighReviewEntity(selectedReviewItems: [
            ReviewItems.adequateExamination,
            ReviewItems.kindness
          ]),
          placePreview: HospitalPreview(
              locId: 'locId',
              name: '청담 동물병원',
              location: LatLngClass(latitude: 0, longitude: 0),
              address: 'jasidjfoiajdspfio',
              totalVisitingConimal: 0,
              phoneNumber: "phoneNumber",
              totalRecommend: 2,
              openingStatus: 'openingStatus',
              thumbnail: 'thumbnail',
              distanceByMeter: 0)),
      PlaceReview(
          userId: 'user1',
          placeId: 'placeId2',
          visitVerified: true,
          conimals: [],
          diseaseTypes: [],
          reviewEntity: MiddleReviewEntity(selectedReviewItems: [
            ReviewItems.waitingExperience,
            ReviewItems.kindness
          ]),
          placePreview: HospitalPreview(
              locId: 'locId',
              name: '잘고치는 동물병원',
              location: LatLngClass(latitude: 0, longitude: 0),
              address: 'jasidjfoiajdspfio',
              totalVisitingConimal: 0,
              phoneNumber: "phoneNumber",
              totalRecommend: 2,
              openingStatus: 'openingStatus',
              thumbnail: 'thumbnail',
              distanceByMeter: 0)),
      PlaceReview(
          userId: 'user1',
          placeId: 'placeId3',
          visitVerified: true,
          conimals: [],
          diseaseTypes: [],
          reviewEntity: LowReviewEntity(
              selectedReviewItems: [ReviewItems.price, ReviewItems.kindness]),
          placePreview: HospitalPreview(
              locId: 'locId',
              name: '행복한 동물병원',
              location: LatLngClass(latitude: 0, longitude: 0),
              address: 'jasidjfoiajdspfio',
              totalVisitingConimal: 0,
              phoneNumber: "phoneNumber",
              totalRecommend: 2,
              openingStatus: 'openingStatus',
              thumbnail: 'thumbnail',
              distanceByMeter: 0)),
    ];

    myReviewList.addAll(newReviewList);
  }

  Future<void> resetPage() async {
    loadNewPage();
  }

  void changeTotalPerPage(int limitValue) {
    myReviewList.clear();
    _lastPage.value = false;
    _changePaginationFilter(1, limitValue);
  }

  void _changePaginationFilter(int page, int limit) {
    _paginationFilter.update((val) {
      val!.page = page;
      val.limit = limit;
    });
  }

  updateBookmarkedPlace(
      {required String postId, required bool isBookmarked}) async {
    // await _communityRepository.updateLikePost(
    //     uid: AuthController.to.wcUser.value!.uid,
    //     postId: postId,
    //     isLiked: isLiked);

    return true;
  }
}
