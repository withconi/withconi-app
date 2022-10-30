import 'dart:io';
import 'package:dartz/dartz.dart';
import 'package:withconi/data/enums/enum.dart';
import 'package:withconi/controller/auth_controller.dart';
import 'package:withconi/data/repository/community_repository.dart';
import 'package:withconi/data/repository/image_repository.dart';
import 'package:withconi/module/widgets/loading/loading_overlay.dart';
import 'package:withconi/module/widgets/photo_gallary/image_item.dart';
import '../../../core/tools/helpers/image_picker_helper.dart';
import '../../../core/error_handling/failures.dart';
import '../../../data/model/conimal.dart';
import '../../../data/model/post.dart';
import '../../../import_basic.dart';
import '../../widgets/dialog/selection_dialog.dart';
import '../../../controller/ui_interpreter/failure_ui_interpreter.dart';

class CommunityEditMyPostController extends GetxController {
  final CommunityRepository _communityRepository = CommunityRepository();
  final ImageRepository _imageRepository = ImageRepository();
  final List<PostType> postType = [PostType.cat, PostType.dog];
  final Rxn<PostType> selectedPostType = Rxn<PostType>();
  final int maxImageNum = 4;
  final RxInt selectedImageNum = 0.obs;
  RxList<ImageItem> imageItemList = RxList<ImageItem>();
  late Post post;
  final RxBool validatePostButton = false.obs;
  RxList<Conimal> _selectedConimalList = RxList<Conimal>();

  TextEditingController textController = TextEditingController();

  @override
  void onInit() {
    super.onInit();
    post = Get.arguments as Post;
    selectedPostType.value = post.postType;
    textController.text = post.content;
    imageItemList = [
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
    ].obs;
    selectedImageNum.value = imageItemList.length;
  }

  @override
  void onReady() {
    super.onReady();

    ever(imageItemList, setImageNum);
  }

  setImageNum(_imageList) {
    selectedImageNum.value = _imageList.length;
  }

  void onPostTypeChanged(PostType postType) {
    selectedPostType.value = postType;
  }

  void onImageFileAdded(List<File> imageList) {
    List<ImageItem> newImageFileList = imageList
        .map(
          (e) => ImageItem(
              id: DateTime.now().microsecondsSinceEpoch.toString(),
              resource: e.path,
              imageType: ImageType.file),
        )
        .toList();

    imageItemList.addAll(newImageFileList);
  }

  deleteImage(ImageItem imageItem) {
    imageItemList.remove(imageItem);
  }

  void pickMultipleImageFiles() async {
    final ImagePickHelper _picker = ImagePickHelper();
    final Either<Failure, List<File>>? imageFilesEither =
        await _picker.pickMultipleImages(
            maxImageNum: 4, selectedImageNum: selectedImageNum.value);

    if (imageFilesEither != null) {
      imageFilesEither.fold(
          (fail) => FailureInterpreter()
              .mapFailureToSnackbar(fail, 'pickMultipleImages'), (files) {
        onImageFileAdded(files);
      });
    }
  }

  Future<void> getBack() async {
    bool isConfirmed = await showSelectionDialog(
        cancleText: '계속하기',
        confirmText: '그만하기',
        title: '수정을 그만할까요?',
        subtitle: '수정한 내용은 모두 사라집니다');
    if (isConfirmed) {
      Get.back();
    }
  }

  onConimalSelected(Conimal conimal) {
    if (_selectedConimalList.contains(conimal)) {
      _selectedConimalList.remove(conimal);
    } else {
      _selectedConimalList.add(conimal);
    }
  }

  Future<void> onCreateButtonTap() async {
    if (selectedPostType.value == null) {
      return FailureInterpreter().mapFailureToSnackbar(
          NoPostTypeSelectedFailure(), 'onCreateButtonTap');
    } else if (textController.text.isEmpty) {
      return FailureInterpreter()
          .mapFailureToSnackbar(NoPostContentsFailure(), 'onCreateButtonTap');
    } else {
      bool isConfirmed = await showSelectionDialog(
        cancleText: '아니요',
        confirmText: '네',
        title: '글을 남길까요?',
      );

      if (isConfirmed) {
        editPost();
      }
    }
  }

  void editPost() async {
    // TODO 이미지 업로드 하는 부분 정리 필요함 : 삭제, 새로운 이미지 추가 시 처리하는 부분
    Either<Failure, List<ImageItem>> imageUploadRefsEither = await showLoading(
        () => _imageRepository.uploadImageFileList(
            imageFileItems: getOnlyFileImageItems()));

    imageUploadRefsEither.fold(
        (fail) => FailureInterpreter().mapFailureToSnackbar(
            fail, 'image upload error'), (imageRefList) async {
      List<ImageItem> editedImageList =
          imageItemList.where((p0) => p0.imageType != ImageType.file).toList();
      editedImageList.addAll(imageRefList);

      Post editedPost = Post(
          images: editedImageList,
          authorId: AuthController.to.wcUser.value!.uid,
          nickname: AuthController.to.wcUser.value!.nickname,
          boardId: post.boardId,
          postId: post.postId,
          content: textController.text,
          createdAt: DateTime.now(),
          postType: selectedPostType.value!,
          isLike: false);

      var newPostResultEither = await showLoading(
          () => _communityRepository.updateMyPost(editPost: editedPost));
      newPostResultEither.fold(
          (fail) => FailureInterpreter()
              .mapFailureToSnackbar(fail, 'createNewPostDB'), (addedPost) {
        Get.back(result: editedPost);
      });
    });
  }

  List<ImageItem> getOnlyFileImageItems() {
    // imageItemList.where((p0) => p0.imageType == ImageType.file).toList();
    return imageItemList.where((p0) => p0.imageType == ImageType.file).toList();
  }
}
