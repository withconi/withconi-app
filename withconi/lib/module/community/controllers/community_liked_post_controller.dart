import 'package:withconi/core/tools/helpers/calculator.dart';
import 'package:withconi/module/auth/auth_controller.dart';
import 'package:withconi/core/error_handling/failure_ui_interpreter.dart';
import 'package:withconi/data/repository/community_repository.dart';
import 'package:withconi/global_widgets/loading/loading_overlay.dart';

import '../../../data/enums/enum.dart';
import '../../../import_basic.dart';
import '../../../global_widgets/photo_gallary/image_item.dart';

import '../../ui_model/post_ui_model.dart';

class LikedPostController extends GetxController {
  LikedPostController(this._communityRepository);
  final CommunityRepository _communityRepository;
  RxList<PostUIModel> likedPostList = <PostUIModel>[].obs;
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
  Future<void> onReady() async {
    super.onReady();

    await showLoading((() => _getLikedPosts()));
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
        likedPostList.addAll(newPostList.map(
          (postDTO) {
            return PostUIModel.fromDTO(postDTO);
          },
        ).toList());
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

  onPostTap(int postIndex) {
    Get.toNamed(Routes.COMMUNITY_POST_DETAIL,
        arguments: likedPostList[postIndex]);
  }

  onLikeChanged(int postIndex, bool isLiked) async {
    await _communityRepository.updateLikePost(
        postId: likedPostList[postIndex].postId, isLiked: isLiked);
  }
}
