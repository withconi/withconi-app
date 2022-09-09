import 'dart:io';
import 'package:dartz/dartz.dart';
import 'package:withconi/configs/constants/enum.dart';
import 'package:withconi/controller/auth_controller.dart';
import 'package:withconi/data/repository/community_repository.dart';
import 'package:withconi/data/repository/image_repository.dart';
import 'package:withconi/ui/widgets/loading.dart';
import '../../configs/helpers/image_picker_helper.dart';
import '../../core/error_handling/failures.dart';
import '../../data/model/post.dart';
import '../../import_basic.dart';
import '../../ui/widgets/dialog/selection_dialog.dart';
import '../ui_interpreter/failure_ui_interpreter.dart';

class CommunityNewPostController extends GetxController {
  final CommunityRepository _communityRepository = CommunityRepository();
  final ImageRepository _imageRepository = ImageRepository();
  final List<PostType> postType = [PostType.cat, PostType.dog];
  final Rxn<PostType> selectedPostType = Rxn<PostType>();
  final int maxImageNum = 4;
  final RxInt selectedImageNum = 0.obs;
  final RxList<File> imageFileList = <File>[].obs;
  late String _boardId;
  final RxBool validatePostButton = false.obs;

  TextEditingController textController = TextEditingController();
  @override
  void onReady() {
    super.onReady();
    _boardId = Get.arguments;
    ever(imageFileList, setImageNum);
  }

  setImageNum(_imageList) {
    selectedImageNum.value = _imageList.length;
  }

  void onPostTypeChanged(PostType postType) {
    selectedPostType.value = postType;
  }

  void onImageListChanged(List<File> imageList) {
    imageFileList.addAll(imageList);
  }

  deleteImage(File image) {
    imageFileList.remove(image);
  }

  void pickMultipleImages() async {
    final ImagePickHelper _picker = ImagePickHelper();
    final Either<Failure, List<File>>? imageFilesEither =
        await _picker.pickMultipleImages(
            maxImageNum: 4, selectedImageNum: selectedImageNum.value);

    if (imageFilesEither != null) {
      imageFilesEither.fold(
          (fail) => FailureInterpreter()
              .mapFailureToSnackbar(fail, 'pickMultipleImages'), (list) {
        onImageListChanged(list);
      });
    }
  }

  Future<void> getBack() async {
    bool isConfirmed = await showSelectionDialog(
        cancleText: '계속하기',
        confirmText: '그만하기',
        title: '글을 그만쓸까요?',
        subtitle: '작성된 내용은 모두 사라집니다');
    if (isConfirmed) {
      Get.back();
    }
  }

  Future<void> onCreateButtonTap() async {
    if (selectedPostType.value == null) {
      return FailureInterpreter()
          .mapFailureToSnackbar(NoPostTypeSelectedFailure(), 'addNewPost');
    } else if (textController.text.isEmpty) {
      return FailureInterpreter()
          .mapFailureToSnackbar(NoPostContentsFailure(), 'addNewPost');
    } else {
      bool isConfirmed = await showSelectionDialog(
        cancleText: '아니요',
        confirmText: '네',
        title: '글을 남길까요?',
      );

      if (isConfirmed) {
        createNewPostDB();
      }
    }
  }

  void createNewPostDB() async {
    var imageUploadRefsEither = await showLoading(
        () => _imageRepository.uploadImageFileList(imageFiles: imageFileList));

    imageUploadRefsEither.fold(
        (fail) => FailureInterpreter().mapFailureToSnackbar(
            fail, 'image upload error'), (imageRefList) async {
      var newPostResultEither = await showLoading(() =>
          _communityRepository.newPost(
              newPost: Post(
                  authorId: AuthController.to.wcUser.value!.uid,
                  nickname: AuthController.to.wcUser.value!.nickname,
                  boardId: _boardId,
                  content: textController.text,
                  createdAt: DateTime.now(),
                  postType: selectedPostType.value!)));
      newPostResultEither.fold(
          (fail) => FailureInterpreter()
              .mapFailureToSnackbar(fail, 'createNewPostDB'), (addedPost) {
        Get.back(result: addedPost);
      });
    });
  }
}
