import 'package:withconi/configs/helpers/calculator.dart';
import 'package:withconi/controller/auth_controller.dart';
import 'package:withconi/controller/infinite_scroll_controller.dart';
import 'package:withconi/controller/ui_interpreter/failure_ui_interpreter.dart';
import 'package:withconi/data/repository/community_repository.dart';
import 'package:withconi/ui/widgets/loading/loading_overlay.dart';

import '../../configs/constants/enum.dart';
import '../../data/model/post.dart';
import '../../import_basic.dart';
import '../../ui/widgets/photo_gallary/image_item.dart';
import '../ui_helper/infinite_scroll.dart';

class LikedPostController extends GetxController {
  CommunityRepository _communityRepository = CommunityRepository();
  RxList<Post> likedPostList = <Post>[].obs;
  late String _uid;
  // Rx<ScrollController> scrollController = ScrollController().obs;

  // final Rx<PaginationFilter> _paginationFilter = PaginationFilter(
  //   page: 1,
  //   limit: 15,
  // ).obs;

  // final RxBool _lastPage = false.obs;

  // final RxBool _isLoading = false.obs;

  // int get limit => _paginationFilter.value.limit!;
  // int get _page => _paginationFilter.value.page!;

  // void loadNextPage() => _changePaginationFilter(_page + 1, limit);
  // void loadNewPage() => _changePaginationFilter(1, limit);

  List<ImageItem> images = [
    ImageItem(
        id: 'tag1',
        resource: 'assets/images/image1.jpeg',
        imageType: ImageType.asset),
    ImageItem(
        id: 'tag2',
        resource: 'assets/images/image2.jpeg',
        imageType: ImageType.asset),
    ImageItem(
        id: 'tag3',
        resource:
            'https://search.pstatic.net/common/?src=http%3A%2F%2Fshop1.phinf.naver.net%2F20210917_199%2F1631861436249TX26u_JPEG%2F32997264078967613_1334183573.jpg&type=sc960_832',
        imageType: ImageType.network),
  ];

  String uploadAtStr(DateTime createdAt) =>
      TimeCalculator().calculateUploadAt(createdAt);

  Color badgeBackgroundColor(int postIndex) {
    switch (likedPostList[postIndex].postType) {
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
    switch (likedPostList[postIndex].postType) {
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
  onInit() async {
    super.onInit();
    _uid = Get.arguments as String;
  }

  @override
  Future<void> onReady() async {
    super.onReady();

    await showLoading((() => _getLikedPosts()));
    // ever(_paginationFilter, (_) => _getLikedPosts());

    // _addScrollListener(
    //     isLastPage: _lastPage,
    //     isLoading: _isLoading,
    //     onEndOfScroll: loadNextPage,
    //     scrollController: scrollController.value);
  }

  @override
  onClose() {
    super.onClose();
  }

  // _addScrollListener(
  //     {required ScrollController scrollController,
  //     required void Function() onEndOfScroll,
  //     required RxBool isLastPage,
  //     required RxBool isLoading}) {
  //   scrollController.addListener(() {
  //     if (!isLoading.value &&
  //         !isLastPage.value &&
  //         scrollController.offset >=
  //             scrollController.position.maxScrollExtent) {
  //       onEndOfScroll();
  //     }
  //   });
  // }

  Future<void> _getLikedPosts() async {
    final postDataEither = await _communityRepository.getLikedPostList();

    postDataEither.fold(
        (fail) =>
            FailureInterpreter().mapFailureToSnackbar(fail, '_getPostList'),
        (newPostList) {
      likedPostList.clear();

      if (newPostList.isEmpty) {
      } else {
        likedPostList.addAll(newPostList);
      }
    });
  }

  Future<void> resetPage() async {
    _getLikedPosts();
  }

  // void changeTotalPerPage(int limitValue) {
  //   likedPostList.clear();
  //   _lastPage.value = false;
  //   _changePaginationFilter(1, limitValue);
  // }

  // void _changePaginationFilter(int page, int limit) {
  //   _paginationFilter.update((val) {
  //     val!.page = page;
  //     val.limit = limit;
  //   });
  // }

  onPostTap(Post selectedPost) {
    Get.toNamed(Routes.COMMUNITY_POST_DETAIL, arguments: selectedPost);
  }

  onLikeChanged(String postId, bool isLiked) async {
    await _communityRepository.updateLikePost(
        uid: AuthController.to.wcUser.value!.uid,
        postId: postId,
        isLiked: isLiked);
  }
}
