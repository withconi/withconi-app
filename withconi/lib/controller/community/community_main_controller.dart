import 'package:withconi/controller/ui_interpreter/failure_ui_interpreter.dart';
import 'package:withconi/data/repository/community_repository.dart';
import '../../configs/constants/enum.dart';
import '../../data/model/board.dart';
import '../../data/model/post.dart';
import '../../import_basic.dart';
import '../../ui/pages/community/community_setting_page.dart';

class CommunityMainController extends GetxController {
  CommunityRepository _communityRepository = CommunityRepository();
  RxList<Board> _boardList = RxList<Board>();
  List<Post> hotPostList = [
    Post(
        boardId: 'boardId',
        authorId: 'authorId',
        nickname: 'nickname',
        postType: PostType.cat,
        content: '고양이를 위한 100가지 사료추천 글을 들고왔습니다',
        images: [],
        createdAt: DateTime.now()),
    Post(
        boardId: 'boardId',
        authorId: 'authorId',
        nickname: 'nickname',
        postType: PostType.cat,
        content: '고양이를 위한 100가지 사료추천 글을 들고왔습니다',
        images: [],
        createdAt: DateTime.now())
  ];
  List<Board> get boardList => _boardList.toList();

  @override
  onInit() async {
    super.onInit();
    await _getBoardList();
  }

  Future<void> _getBoardList() async {
    final boardListEither = await _communityRepository.getBoardList();

    boardListEither.fold(
        (fail) =>
            FailureInterpreter().mapFailureToSnackbar(fail, '_getBoardList'),
        (newBoardList) {
      _boardList.addAll(newBoardList);
    });
  }

  toBoardDetailPage({required String boardId}) {
    Get.toNamed(Routes.COMMUNITY_DETAIL, arguments: boardId);
  }

  toSettingPage() {
    Get.to(CommunitySettingPage());
  }
}
