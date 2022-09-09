import 'package:withconi/controller/ui_interpreter/failure_ui_interpreter.dart';
import 'package:withconi/data/repository/community_repository.dart';
import '../../data/model/board.dart';
import '../../import_basic.dart';
import '../../ui/pages/community/community_setting_page.dart';

class CommunityMainController extends GetxController {
  CommunityRepository _communityRepository = CommunityRepository();
  RxList<Board> _boardList = RxList<Board>();
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
