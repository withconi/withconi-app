import 'dart:io';
import 'package:dartz/dartz.dart';
import 'package:withconi/data/enums/enum.dart';
import 'package:withconi/data/model/dto/request_dto/community_request/create_post_request_dto.dart';
import 'package:withconi/module/auth/auth_controller.dart';
import 'package:withconi/data/repository/community_repository.dart';
import 'package:withconi/data/repository/image_repository.dart';
import 'package:withconi/global_widgets/loading/loading_overlay.dart';
import 'package:withconi/global_widgets/photo_gallary/image_item.dart';
import 'package:withconi/module/community/pages/community_post_detail_page.dart';
import 'package:withconi/module/ui_model/edit_post_ui_model.dart';
import 'package:withconi/module/ui_model/new_post_ui_model.dart';
import 'package:withconi/module/ui_model/post_ui_model.dart';
import '../../../core/tools/helpers/image_picker_helper.dart';
import '../../../core/error_handling/failures.dart';
import '../../../import_basic.dart';
import '../../../global_widgets/dialog/selection_dialog.dart';
import '../../../core/error_handling/failure_ui_interpreter.dart';

class CommunityNewPostController extends GetxController {
  CommunityNewPostController(this._communityRepository, this._imageRepository);
  final CommunityRepository _communityRepository;
  final ImageRepository _imageRepository;
  final int maxImageNum = 4;
  late Rx<NewPostUIModel> newPost = NewPostUIModel(
    content: '',
    postType: null,
    images: [],
  ).obs;
  late String _boardId;
  final RxBool validatePostButton = false.obs;
  TextEditingController contentsTextController = TextEditingController();

  @override
  void onReady() {
    super.onReady();
    _boardId = Get.arguments as String;
  }

  void onPostTypeChanged(PostType postType) {
    newPost.value.postType = postType;
    newPost.refresh();
  }

  void onContentsChanged(String contentsText) {
    newPost.value.content = contentsText;
  }

  deleteImage(int imageIndex) {
    newPost.value.images.removeAt(imageIndex);
    newPost.refresh();
  }

  void pickMultipleImageFiles() async {
    final ImagePickHelper _picker = ImagePickHelper();
    final Either<Failure, List<ImageItem>>? imageFilesEither =
        await _picker.pickMultipleImages(
            maxImageNum: maxImageNum,
            selectedImageNum: newPost.value.images.length);

    if (imageFilesEither != null) {
      imageFilesEither.fold(
          (fail) => FailureInterpreter()
              .mapFailureToSnackbar(fail, 'pickMultipleImages'), (imageItems) {
        newPost.value.images.addAll(imageItems);
        newPost.refresh();
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
    if (newPost.value.postType == null) {
      return FailureInterpreter().mapFailureToSnackbar(
          const NoPostTypeSelectedFailure(), 'addNewPost');
    } else if (contentsTextController.text.isEmpty) {
      return FailureInterpreter()
          .mapFailureToSnackbar(const NoPostContentsFailure(), 'addNewPost');
    } else {
      bool isConfirmed = await showSelectionDialog(
        cancleText: '아니요',
        confirmText: '네',
        title: '글을 남길까요?',
      );

      if (isConfirmed) {
        _createNewPostDB();
      }
    }
  }

  void _createNewPostDB() async {
    var onlyFileImageItemList = _getOnlyFileImageItem();
    List<String> imageRefList = [];
    if (onlyFileImageItemList.isNotEmpty) {
      imageRefList = await _uploadFileImageDB(onlyFileImageItemList);
    }

    var newPostResultEither = await showLoading(() =>
        _communityRepository.newPost(
            newPost: newPost.value,
            boardId: _boardId,
            imageRefList: imageRefList));
    newPostResultEither.fold(
        (fail) =>
            FailureInterpreter().mapFailureToSnackbar(fail, 'createNewPostDB'),
        (addedPost) {
      Get.back(result: newPost.value);
    });
  }

  Future<List<String>> _uploadFileImageDB(
      List<ImageItem> fileImageItems) async {
    Either<Failure, List<String>> imageUploadRefsEither =
        await _imageRepository.uploadImageFileList(fileImageItems);

    List<String> imageRefListOrNull = imageUploadRefsEither.fold((fail) {
      FailureInterpreter().mapFailureToSnackbar(fail, 'image upload error');
      return [];
    }, (imageRefList) {
      return imageRefList;
    });
    return imageRefListOrNull;
  }

  List<ImageItem> _getOnlyFileImageItem() {
    return newPost.value.images
        .where((p0) => p0.imageType == ImageType.file)
        .toList();
  }
}
