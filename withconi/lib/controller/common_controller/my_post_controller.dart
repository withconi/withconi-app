import 'package:withconi/configs/helpers/calculator.dart';
import 'package:withconi/controller/infinite_scroll_controller.dart';
import 'package:withconi/controller/ui_interpreter/failure_ui_interpreter.dart';
import 'package:withconi/data/repository/community_repository.dart';
import 'package:withconi/ui/widgets/loading.dart';

import '../../configs/constants/enum.dart';
import '../../data/model/post.dart';
import '../../import_basic.dart';
import '../../ui/widgets/snackbar.dart';
import '../ui_helper/infinite_scroll.dart';

class MyPostPageController extends GetxController {
  CommunityRepository _communityRepository = CommunityRepository();
  RxList<Post> userPostList = <Post>[].obs;
  late String _userId;

  Rx<ScrollController> scrollController = ScrollController().obs;

  final Rx<PaginationFilter> _paginationFilter = PaginationFilter(
    page: 1,
    limit: 15,
  ).obs;

  final RxBool _lastPage = false.obs;
  final RxBool isLiked = false.obs;
  final RxBool _isLoading = false.obs;

  int get limit => _paginationFilter.value.limit!;
  int get _page => _paginationFilter.value.page!;

  void loadNextPage() => _changePaginationFilter(_page + 1, limit);
  void loadNewPage() => _changePaginationFilter(1, limit);

  String uploadAtStr(int postIndex) =>
      TimeCalculator().calculateUploadAt(userPostList[postIndex].createdAt);

  Color badgeBackgroundColor(int postIndex) {
    switch (userPostList[postIndex].postType) {
      case PostType.all:
        return WcColors.purple20;
      case PostType.cat:
        return WcColors.blue60;
      case PostType.dog:
        return WcColors.green40;
      default:
        return Colors.transparent;
    }
  }

  Color badgeTextColor(int postIndex) {
    switch (userPostList[postIndex].postType) {
      case PostType.all:
        return WcColors.purple100;
      case PostType.cat:
        return WcColors.blue100;
      case PostType.dog:
        return WcColors.green100;

      default:
        return Colors.transparent;
    }
  }

  @override
  Future<void> onInit() async {
    super.onInit();
    _userId = Get.arguments;
  }

  @override
  Future<void> onReady() async {
    super.onReady();

    await showLoading((() => _getMyPostList()));
    ever(_paginationFilter, (_) => _getMyPostList());

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

  onLikeTap() {
    showSnackbar(text: '내 글에는 좋아요를 누를 수 없어요');
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

  Future<void> _getMyPostList() async {
    _isLoading.value = true;
    final postDataEither = await _communityRepository.getUserPostList(
        paginationFilter: _paginationFilter.value, userId: _userId);

    postDataEither.fold(
        (fail) => FailureInterpreter()
            .mapFailureToSnackbar(fail, '_getPostListByPage'), (newPostList) {
      if (_paginationFilter.value.page == 1) {
        userPostList.clear();
      }
      if (newPostList.isEmpty) {
        _lastPage.value = true;
      } else {
        userPostList.addAll(newPostList);
      }
      _isLoading.value = false;
    });
  }

  Future<void> resetPage({SortType? sortType, PostType? postType}) async {
    _lastPage.value = false;
    _changePaginationFilter(1, 15);
  }

  void changeTotalPerPage(int limitValue) {
    userPostList.clear();
    _lastPage.value = false;
    _changePaginationFilter(1, limitValue);
  }

  void _changePaginationFilter(int page, int limit) {
    _paginationFilter.update((val) {
      val!.page = page;
      val.limit = limit;
    });
  }
}
