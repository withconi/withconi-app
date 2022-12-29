import 'package:withconi/core/error_handling/error_message_object.dart';
import 'package:withconi/core/error_handling/failure_ui_interpreter.dart';
import 'package:withconi/data/repository/community_repository.dart';
import 'package:withconi/module/page_status.dart';
import 'package:withconi/module/ui_model/board_ui_model.dart';
import 'package:withconi/module/ui_model/post_ui_model.dart';
import '../../../data/enums/enum.dart';
import '../../../import_basic.dart';
import '../pages/community_setting_page.dart';
import 'custom_state_mixin.dart';

class CommunityMainController extends GetxController with WcStateMixin {
  CommunityMainController(this._repository);
  final CommunityRepository _repository;
  TextEditingController boardKeywordTextController = TextEditingController();
  RxList<BoardUIModel> boardList = RxList<BoardUIModel>();
  RxList<PostUIModel> hotPostList = RxList<PostUIModel>();
  RxList<BoardUIModel> searchedBoardList = RxList<BoardUIModel>();
  String boardKeyword = '';

  static int hotPostListSize = 4;

  @override
  onInit() async {
    super.onInit();
    change(null, status: const PageStatus.init());

    _getBoardList();
    _getHotPostList();
  }

  onBoardKeywordChanged(String keyword) {
    boardKeyword = keyword;
    _setSearchBoardList(keyword);
  }

  _setSearchBoardList(String keyword) {
    if (keyword.isEmpty) {
      clearResult();
      return;
    } else {
      searchedBoardList.assignAll(
          boardList.where((p0) => p0.title.contains(keyword)).toList());
    }
  }

  clearResult() {
    boardKeywordTextController.clear();
    _resetSearchBoardList();
  }

  _resetSearchBoardList() {
    searchedBoardList.assignAll(boardList.toList());
    searchedBoardList.refresh();
  }

  Future<void> _getBoardList() async {
    final boardListEither = await _repository.getBoardList();
    change([], status: PageStatus.loading());
    boardListEither.fold((fail) {
      ErrorObject errorObject =
          ErrorObject.mapFailureToErrorMessage(failure: fail);
      change(null, status: PageStatus.error(errorObject.message));
    }, (newBoardList) {
      boardList
          .assignAll(newBoardList.map((e) => BoardUIModel.fromDto(e)).toList());

      if (newBoardList.isEmpty) {
        change(null, status: PageStatus.empty());
      } else {
        searchedBoardList.assignAll(boardList.toList());
        searchedBoardList.refresh();
      }
    });
  }

  Future<void> _getHotPostList() async {
    final hotPostListEither = await _repository.getHotPostList(hotPostListSize);

    hotPostListEither.fold((fail) {
      ErrorObject errorObject =
          ErrorObject.mapFailureToErrorMessage(failure: fail);
      change(null, status: PageStatus.error(errorObject.message));
    }, (newHotPostList) {
      if (newHotPostList.isEmpty) {
        change([], status: PageStatus.success());
      } else {
        hotPostList
            .addAll(newHotPostList.map((e) => PostUIModel.fromDTO(e)).toList());
        hotPostList.refresh();
        change(searchedBoardList, status: PageStatus.success());
      }
    });
  }

  goToBoardDetailPage({required int boardIndex}) {
    Get.toNamed(Routes.COMMUNITY_POST_LIST, arguments: {
      'boardId': boardList[boardIndex].boardId,
      'boardName': boardList[boardIndex].title,
    });
  }

  goToPostDetailPage(PostUIModel selectedHotPost) {
    Get.toNamed(Routes.COMMUNITY_POST_DETAIL, arguments: {
      'boardId': selectedHotPost.boardId,
      'postId': selectedHotPost.postId,
      'fromRootPage': true,
    });
  }

  goToSettingPage() {
    Get.toNamed(Routes.COMMUNITY_SETTING);
  }
}
