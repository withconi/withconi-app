import 'dart:io';
import 'package:dartz/dartz.dart';
import 'package:withconi/data/enums/enum.dart';
import 'package:withconi/data/repository/community_repository.dart';
import 'package:withconi/data/repository/image_repository.dart';
import 'package:withconi/global_widgets/loading/loading_overlay.dart';
import 'package:withconi/global_widgets/photo_gallary/image_item.dart';
import 'package:withconi/module/ui_model/edit_post_ui_model.dart';
import 'package:withconi/module/ui_model/post_ui_model.dart';
import '../../../core/tools/helpers/image_picker_helper.dart';
import '../../../core/error_handling/failures.dart';
import '../../../import_basic.dart';
import '../../../global_widgets/dialog/selection_dialog.dart';
import '../../../core/error_handling/failure_ui_interpreter.dart';

class CommunityEditMyPostController extends GetxController {
  CommunityEditMyPostController(
      this._communityRepository, this._imageRepository);
  final CommunityRepository _communityRepository;
  final ImageRepository _imageRepository;
  final int maxImageNum = 4;
  late Rx<PostUIModel> post;
  final RxBool validatePostButton = false.obs;

  TextEditingController textController = TextEditingController();

  @override
  void onInit() {
    super.onInit();
    post = Rx<PostUIModel>((Get.arguments as PostUIModel).copyWith());
    // post.value.images = [
    //   ImageItem(
    //       id: 'tag1',
    //       resource: 'assets/images/image1.jpeg',
    //       imageType: ImageType.asset),
    //   ImageItem(
    //       id: 'tag2',
    //       resource: 'assets/images/image2.jpeg',
    //       imageType: ImageType.asset),
    //   ImageItem(
    //       id: 'tag3',
    //       resource:
    //           'https://search.pstatic.net/common/?src=http%3A%2F%2Fshop1.phinf.naver.net%2F20210917_199%2F1631861436249TX26u_JPEG%2F32997264078967613_1334183573.jpg&type=sc960_832',
    //       imageType: ImageType.network),
    // ].obs;
    // selectedImageNum.value = imageItemList.length;
  }

  void onPostTypeChanged(PostType postType) {
    post.value.postType = postType;
    post.refresh();
  }

  deleteImage(ImageItem imageItem) {
    post.value.images.remove(imageItem);
    post.refresh();
  }

  void pickMultipleImageFiles() async {
    final ImagePickHelper _picker = ImagePickHelper();
    final Either<Failure, List<ImageItem>>? imageFilesEither =
        await _picker.pickMultipleImages(
            maxImageNum: 4, selectedImageNum: post.value.images.length);

    if (imageFilesEither != null) {
      imageFilesEither.fold(
          (fail) => FailureInterpreter()
              .mapFailureToSnackbar(fail, 'pickMultipleImages'), (imageItems) {
        post.value.images.addAll(imageItems);
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

  Future<void> onCreateButtonTap() async {
    if (post.value.postType == null) {
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
        () => _imageRepository.uploadImageFileList(getFileImageItems()));

    imageUploadRefsEither.fold(
        (fail) => FailureInterpreter().mapFailureToSnackbar(
            fail, 'image upload error'), (imageRefList) async {
      post.value.images
          .removeWhere((element) => element.imageType == ImageType.file);
      post.value.images.addAll(imageRefList);

      // PostUIModel editedPost = PostUIModel(
      //     images: editedImageList,
      //     authorId: AuthController.to.wcUser.value!.uid,
      //     nickname: AuthController.to.wcUser.value!.nickname,
      //     boardId: post,
      //     postId: post.postId,
      //     content: textController.text,
      //     postType: selectedPostType.value!,
      //     commentNum: 12,
      //     isLikeOn: false,
      //     likeNum: 12,
      //     uploadAt: DateTime.now());

      var newPostResultEither = await showLoading(
          () => _communityRepository.updateMyPost(editPost: post.value));
      newPostResultEither.fold(
          (fail) => FailureInterpreter()
              .mapFailureToSnackbar(fail, 'createNewPostDB'), (addedPost) {
        Get.back(result: post.value);
      });
    });
  }

  List<ImageItem> getFileImageItems() {
    List<ImageItem> imageFileItemList = post.value.images
        .where((p0) => p0.imageType == ImageType.file)
        .toList(); // imageItemList.where((p0) => p0.imageType == ImageType.file).toList();

    return imageFileItemList;
  }
}
