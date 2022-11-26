import 'package:withconi/core/error_handling/failure_ui_interpreter.dart';
import 'package:withconi/data/repository/community_repository.dart';
import 'package:withconi/module/ui_model/board_ui_model.dart';
import 'package:withconi/module/ui_model/hot_post_ui_model.dart';
import 'package:withconi/module/ui_model/post_ui_model.dart';
import '../../../data/enums/enum.dart';
import '../../../import_basic.dart';
import '../pages/community_setting_page.dart';

class CommunityMainController extends GetxController {
  CommunityMainController(this._repository);
  final CommunityRepository _repository;
  TextEditingController boardKeywordTextController = TextEditingController();
  RxList<BoardUIModel> boardList = RxList<BoardUIModel>();
  RxList<PostUIModel> hotPostList = RxList<PostUIModel>();
  RxList<BoardUIModel> searchedBoardList = RxList<BoardUIModel>();
  String boardKeyword = '';

  static int hotPostListSize = 3;

  @override
  onInit() async {
    super.onInit();
    await _getBoardList();
    await _getHotPostList();
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

    boardListEither.fold(
        (fail) =>
            FailureInterpreter().mapFailureToSnackbar(fail, '_getBoardList'),
        (newBoardList) {
      boardList
          .assignAll(newBoardList.map((e) => BoardUIModel.fromDto(e)).toList());
      searchedBoardList.assignAll(boardList.toList());
      searchedBoardList.refresh();
    });
  }

  Future<void> _getHotPostList() async {
    final hotPostListEither = await _repository.getHotPostList(hotPostListSize);

    hotPostListEither.fold(
        (fail) =>
            FailureInterpreter().mapFailureToSnackbar(fail, '_getBoardList'),
        (newHotPostList) {
      hotPostList
          .addAll(newHotPostList.map((e) => PostUIModel.fromDTO(e)).toList());
      hotPostList.refresh();
    });
  }

  goToBoardDetailPage({required int boardIndex}) {
    Get.toNamed(
      Routes.COMMUNITY_POST_LIST,
      arguments: boardList[boardIndex],
    );
  }

  goToPostDetailPage(PostUIModel selectedHotPost) {
    Get.toNamed(Routes.COMMUNITY_POST_DETAIL, arguments: selectedHotPost);
  }

  goToSettingPage() {
    Get.toNamed(Routes.COMMUNITY_SETTING);
  }
}
