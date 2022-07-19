import 'package:withconi/controller/infinite_scroll_controller.dart';
import 'package:withconi/controller/ui_interpreter/failure_ui_interpreter.dart';
import 'package:withconi/data/repository/community_repository.dart';
import 'package:withconi/ui/widgets/photo_gallary/image_item.dart';

import '../../configs/constants/enum.dart';
import '../../data/model/comment.dart';
import '../../data/model/post.dart';
import '../../import_basic.dart';
import '../ui_helper/infinite_scroll.dart';

class CommunityPostDetailController extends GetxController {
  CommunityRepository _communityRepository = CommunityRepository();
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
          boardId: "boardId",
          postId: "postId",
          nickname: "nickname",
          speciesType: PostType.cat,
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
  int get _page => _paginationFilter.value.page!;
  bool get lastPage => _lastPage.value;

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
    TextEditingController textEditingController = TextEditingController();
    Comment? newComment = await Get.bottomSheet(
      Container(
        height: 280,
        padding: const EdgeInsets.symmetric(vertical: 0, horizontal: 20),
        child: Column(
          children: [
            const SizedBox(
              height: 25,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 5),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('먼지님의 댓글',
                      style: GoogleFonts.notoSans(
                          fontSize: 17,
                          color: WcColors.black,
                          fontWeight: FontWeight.bold)),
                  GestureDetector(
                    onTap: () {
                      Comment newComment = Comment(
                          postId: 'postId',
                          commentId: 'commentId',
                          nickname: '댓글닉네임',
                          content: textEditingController.text,
                          createdAt: DateTime.now());

                      Get.back(result: newComment);
                    },
                    child: Text('남기기',
                        style: GoogleFonts.notoSans(
                            fontSize: 16,
                            color: WcColors.blue100,
                            fontWeight: FontWeight.bold)),
                  )
                ],
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Container(
              height: 170,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(25),
                  color: WcColors.blue20),
              child: TextField(
                controller: textEditingController,
                style: GoogleFonts.notoSans(
                    color: WcColors.black,
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                    height: 1.5),
                maxLines: 20,
                minLines: 5,
                decoration: InputDecoration(
                    contentPadding: EdgeInsets.all(20),
                    isDense: true,
                    border: InputBorder.none,
                    hintStyle: GoogleFonts.notoSans(
                        color: WcColors.grey120,
                        fontSize: 15,
                        fontWeight: FontWeight.w500,
                        height: 1.5),
                    hintText:
                        '욕설, 비방 등 상대방을 불쾌하게 하는 의견은 남기지 말아주세요. 신고를 당하면 커뮤니티 이용이 제한될 수 있습니다.'),
              ),
            ),
          ],
        ),
      ),
      enterBottomSheetDuration: const Duration(milliseconds: 170),
      exitBottomSheetDuration: const Duration(milliseconds: 170),
      backgroundColor: Colors.white,
      elevation: 0,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
        ),
      ),
    );
    if (newComment != null) {
      commentList.add(newComment);
    }
  }
}
