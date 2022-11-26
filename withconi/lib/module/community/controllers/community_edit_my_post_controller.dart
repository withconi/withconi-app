import 'dart:io';
import 'package:dartz/dartz.dart';
import 'package:withconi/core/error_handling/error_message_object.dart';
import 'package:withconi/data/enums/enum.dart';
import 'package:withconi/data/repository/community_repository.dart';
import 'package:withconi/data/repository/image_repository.dart';
import 'package:withconi/global_widgets/loading/loading_overlay.dart';
import 'package:withconi/global_widgets/photo_gallary/image_item.dart';
import 'package:withconi/module/page_status.dart';
import 'package:withconi/module/ui_model/edit_post_ui_model.dart';
import 'package:withconi/module/ui_model/post_ui_model.dart';
import '../../../core/tools/helpers/image_picker_helper.dart';
import '../../../core/error_handling/failures.dart';
import '../../../import_basic.dart';
import '../../../global_widgets/dialog/selection_dialog.dart';
import '../../../core/error_handling/failure_ui_interpreter.dart';
import 'custom_state_mixin.dart';

class CommunityEditMyPostController extends GetxController with WcStateMixin {
  CommunityEditMyPostController(
      this._communityRepository, this._imageRepository);
  final CommunityRepository _communityRepository;
  final ImageRepository _imageRepository;
  final int maxImageNum = 4;
  late PostUIModel post;
  final RxBool validatePostButton = false.obs;
  RxList<ImageItem> selectedImageItem = RxList<ImageItem>();
  late Rx<PostType> selectedPostType;
  String _contentsText = '';
  TextEditingController textController = TextEditingController();

  PostUIModel get _editedPost => post.copyWith(
      content: _contentsText,
      postType: selectedPostType.value,
      images: selectedImageItem.toList());
  // Rx<PageStatus> pageStatus = const PageStatus.init().obs;

  List<ImageItem> get _fileImageItems {
    List<ImageItem> imageFileItemList = selectedImageItem
        .where((p0) => p0.imageType == ImageType.file)
        .toList();

    return imageFileItemList;
  }

  List<ImageItem> get _networkImageItems {
    List<ImageItem> networkImageItemList = selectedImageItem
        .where((p0) => p0.imageType == ImageType.network)
        .toList();

    return networkImageItemList;
  }

  @override
  void onInit() {
    super.onInit();
    change(null, status: const PageStatus.init());
    post = Get.arguments as PostUIModel;
    selectedPostType = Rx<PostType>(post.postType!);
    selectedImageItem.assignAll(post.images.toList());
    _contentsText = post.content;
    textController.text = _contentsText;
    // pageStatus.value = const PageStatus.success();
    change(null, status: const PageStatus.success());
  }

  onContentsTextChanged(String text) {
    _contentsText = text;
  }

  void onPostTypeChanged(PostType postType) {
    selectedPostType.value = postType;
  }

  deleteImage(ImageItem imageItem) {
    selectedImageItem.remove(imageItem);
    selectedImageItem.refresh();
  }

  void pickMultipleImageFiles() async {
    final ImagePickHelper _picker = ImagePickHelper();
    final Either<Failure, List<ImageItem>>? imageFilesEither =
        await _picker.pickMultipleImages(
            maxImageNum: 4, selectedImageNum: selectedImageItem.length);

    if (imageFilesEither != null) {
      imageFilesEither.fold(
          (fail) => FailureInterpreter()
              .mapFailureToSnackbar(fail, 'pickMultipleImages'), (imageItems) {
        selectedImageItem.addAll(imageItems);
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
    if (_contentsText.isEmpty) {
      return FailureInterpreter().mapFailureToSnackbar(
          const NoPostTypeSelectedFailure(), 'onCreateButtonTap');
      // } else if (textController.text.isEmpty) {
      // ErrorObject errorObject = ErrorObject.mapFailureToErrorMessage(
      //     failure: const NoPostContentsFailure());
      // change(null, status: PageStatus.error(errorObject.message));
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
    List<String> networkImageRefList =
        _networkImageItems.map((e) => e.resource).toList();
    // List<String> newlyUploadImageRefList = await _uploadSingleImageFileDb();
    List<String> newlyUploadImageRefList = await _uploadImageFileListDb();

    List<String> editedImageRefList = [
      ...networkImageRefList,
      ...newlyUploadImageRefList
    ];
    var newPostResultEither = await showLoading(() => _communityRepository
        .updateMyPost(editPost: _editedPost, imageRefList: editedImageRefList));
    newPostResultEither.fold(
        (fail) =>
            FailureInterpreter().mapFailureToSnackbar(fail, 'createNewPostDB'),
        (addedPost) {
      Get.back(
          result: _editedPost.copyWith(
              images: editedImageRefList
                  .map((image) => ImageItem(
                      id: image, resource: image, imageType: ImageType.network))
                  .toList()));
    });
  }

  Future<List<String>> _uploadImageFileListDb() async {
    List<String> uploadImageRefList = [];
    var onlyFileImage = _fileImageItems;
    if (onlyFileImage.isNotEmpty) {
      Either<Failure, List<String>> imageUploadRefsEither = await showLoading(
          () => _imageRepository.uploadImageFileList(onlyFileImage));

      uploadImageRefList = imageUploadRefsEither.fold((fail) {
        FailureInterpreter().mapFailureToSnackbar(fail, 'image upload error');
        return [];
      }, (imageRefList) {
        return imageRefList;
      });
    }
    return uploadImageRefList;
  }

  // _uploadSingleImageFileDb() async {
  //   String uploadImageRef = '';
  //   var onlyFileImage = _fileImageItems;
  //   if (onlyFileImage.isNotEmpty) {
  //     Either<Failure, String> imageUploadRefsEither = await showLoading(
  //         () => _imageRepository.uploadImageFile(imageItem: onlyFileImage[0]));

  //     uploadImageRef = imageUploadRefsEither.fold((fail) {
  //       FailureInterpreter().mapFailureToSnackbar(fail, 'image upload error');
  //       return '';
  //     }, (imageRef) {
  //       return imageRef;
  //     });
  //   }
  //   return uploadImageRef;
  // }
}
