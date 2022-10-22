import 'package:withconi/configs/helpers/calculator.dart';
import 'package:withconi/controller/auth_controller.dart';
import 'package:withconi/controller/infinite_scroll_controller.dart';
import 'package:withconi/controller/ui_interpreter/failure_ui_interpreter.dart';
import 'package:withconi/data/model/abstract_class/place_preview.dart';
import 'package:withconi/data/model/hospital_preview.dart';
import 'package:withconi/data/model/pharmacy_preview.dart';
import 'package:withconi/data/repository/community_repository.dart';
import 'package:withconi/ui/entities/custom_marker.dart';
import 'package:withconi/ui/entities/location.dart';
import 'package:withconi/ui/widgets/loading/loading_overlay.dart';

import '../../configs/constants/enum.dart';
import '../../data/model/post.dart';
import '../../import_basic.dart';
import '../../ui/widgets/photo_gallary/image_item.dart';
import '../ui_helper/infinite_scroll.dart';

class MapMyBookmarkController extends GetxController {
  CommunityRepository _communityRepository = CommunityRepository();
  RxList<PlacePreview> initialBookmarkPlaceList = <PlacePreview>[].obs;
  RxList<PlacePreview> bookmarkedPlaceList = <PlacePreview>[].obs;
  late String _uid;
  Rx<ScrollController> scrollController = ScrollController().obs;

  final Rx<PaginationFilter> _paginationFilter = PaginationFilter(
    page: 1,
    limit: 15,
  ).obs;

  final RxBool _lastPage = false.obs;

  final RxBool _isLoading = false.obs;

  int get limit => _paginationFilter.value.limit;
  int get _page => _paginationFilter.value.page;

  void loadNextPage() => _changePaginationFilter(_page + 1, limit);
  void loadNewPage() => _changePaginationFilter(1, limit);

  @override
  onInit() async {
    super.onInit();
    _uid = AuthController.to.wcUser.value!.uid;
  }

  @override
  Future<void> onReady() async {
    super.onReady();

    await showLoading((() => _getBookmarkedPlaceList()));
    ever(_paginationFilter, (_) => _getBookmarkedPlaceList());

    _addScrollListener(
        isLastPage: _lastPage,
        isLoading: _isLoading,
        onEndOfScroll: loadNextPage,
        scrollController: scrollController.value);
  }

  @override
  onClose() {
    super.onClose();
    scrollController.value.dispose();
  }

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

  Future<void> _getBookmarkedPlaceList() async {
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

    List<PlacePreview> newPlaceList = [
      HospitalPreview(
          locId: 'loc1',
          name: '참편한 동물병원',
          location: LatLngClass(latitude: 0, longitude: 0),
          address: 'address',
          totalVisiting: 3,
          phone: '02-1010-2020',
          totalReviews: 1,
          openingStatus: OpeningStatus.open,
          thumbnail: '',
          visitVerified: true,
          distanceByMeter: 0.0),
      PharmacyPreview(
          locId: 'loc8',
          name: '참편한 약국',
          location: LatLngClass(latitude: 0, longitude: 0),
          address: 'address',
          totalVisiting: 3,
          phone: '02-1010-2020',
          totalReviews: 1,
          openingStatus: OpeningStatus.open,
          thumbnail: '',
          visitVerified: true,
          distanceByMeter: 0.0),
      HospitalPreview(
          locId: 'loc2',
          name: '좋은 동물병원',
          location: LatLngClass(latitude: 0, longitude: 0),
          address: 'address2',
          totalVisiting: 3,
          phone: '23',
          totalReviews: 1,
          openingStatus: OpeningStatus.open,
          thumbnail: '',
          visitVerified: false,
          distanceByMeter: 0.0),
      HospitalPreview(
          locId: 'loc3',
          name: '행복한 동물병원',
          location: LatLngClass(latitude: 0, longitude: 0),
          address: 'address3',
          totalVisiting: 3,
          phone: '0-2020',
          totalReviews: 1,
          openingStatus: OpeningStatus.open,
          thumbnail: '',
          visitVerified: false,
          distanceByMeter: 0.0)
    ];

    initialBookmarkPlaceList.assignAll(newPlaceList);
    bookmarkedPlaceList.addAll(newPlaceList);
  }

  Future<void> resetPage() async {
    _getBookmarkedPlaceList();
  }

  void changeTotalPerPage(int limitValue) {
    initialBookmarkPlaceList.clear();
    _lastPage.value = false;
    _changePaginationFilter(1, limitValue);
  }

  void _changePaginationFilter(int page, int limit) {
    _paginationFilter.update((val) {
      val!.page = page;
      val.limit = limit;
    });
  }

  onBookmarkTap(PlacePreview place) async {
    bool succeedUpdate =
        await updateBookmarkedPlace(postId: 'asdf', isBookmarked: true);
    if (succeedUpdate) {
      if (bookmarkedPlaceList.contains(place)) {
        bookmarkedPlaceList.remove(place);
      } else {
        bookmarkedPlaceList.add(place);
      }
      initialBookmarkPlaceList.refresh();
    }
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
