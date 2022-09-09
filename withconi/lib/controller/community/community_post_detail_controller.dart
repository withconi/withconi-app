import 'package:withconi/controller/community/communty_widgets/more_tap_bottom_sheet.dart';
import 'package:withconi/data/repository/community_repository.dart';
import 'package:withconi/ui/widgets/photo_gallary/image_item.dart';
import '../../configs/constants/enum.dart';
import '../../configs/helpers/calculator.dart';
import '../../data/model/comment.dart';
import '../../data/model/post.dart';
import '../../import_basic.dart';
import '../ui_helper/infinite_scroll.dart';
import 'communty_widgets/comment_bottom_sheet.dart';

class CommunityPostDetailController extends GetxController {
  // final CommunityRepository _communityRepository = CommunityRepository();
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

  Rx<Post> thisPost = Post(
          authorId: 'authorId',
          boardId: "boardId",
          postId: "postId",
          nickname: "nickname",
          postType: PostType.cat,
          content:
              "고양이가 밥을 안 먹으려고 할 때 단순히 식사 투정이라고 생각하고 그냥 넘어가면 안돼요. 질병이 원인일 수도 있기 때문이죠. 코가 막히거나 감기가 걸려 불편해서 밥을 안 먹을 수도 있고, 위장에 염증이 있거나 기생충에 감염되었을 수도 있어요. 아니면 이물질을 삼켜 식사 중 구토를 하거나 음식을 제대로 먹지 못하고, 치아나 잇몸에 염증이 있어 통증을 느낄 수도 있습니다.",
          createdAt: DateTime.now())
      .obs;
  RxList<Comment> commentList = <Comment>[
    Comment(
        nickname: "nickname",
        content: "고양이가 밥을 안 먹으려고 할 때 밥을 그냥 안줘버리면 어떻게 되나요?",
        createdAt: DateTime.now(),
        commentId: '',
        postId: '')
  ].obs;

  List<String> postType = [
    '모두',
    '강아지',
    '고양이',
  ];
  RxString selectedPostType = '모두'.obs;
  RxString selectedPostSort = '최신순'.obs;
  List<String> postSort = ['최신순', '인기순'];
  RxList<String> userLikedPost = ['먼지', 'c', 'd'].obs;

  final _paginationFilter = PaginationFilter().obs;
  final _lastPage = false.obs;
  RxInt currentImageIndex = 0.obs;
  int get limit => _paginationFilter.value.limit!;
  int get page => _paginationFilter.value.page!;
  bool get lastPage => _lastPage.value;
  String uploadAtStr(DateTime createdAt) =>
      TimeCalculator().calculateUploadAt(createdAt);

  @override
  onInit() {
    super.onInit();
  }

  void onPostSortingChanged(String? sortingType) {
    selectedPostSort.value = sortingType!;
  }

  void onPostTypeChanged(String postType) {
    selectedPostType.value = postType;
  }

  Future<void> addComment() async {
    Comment? newComment = await showCommentBottomSheet();
    if (newComment != null) {
      commentList.add(newComment);
    }
  }

  onMoreTap({required String authorId, required String authorNickname}) async {
    if (authorId != authorId) {
      return await showMoreBottomSheet(
          isAuthor: true, authorNickname: authorNickname);
    } else {
      return await showMoreBottomSheet(
          isAuthor: false, authorNickname: authorNickname);
    }
  }
}
