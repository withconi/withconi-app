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

class CommunityNewPostController extends GetxController {
  final CommunityRepository _communityRepository = CommunityRepository();
  final ImageRepository _imageRepository = ImageRepository();
  final List<PostType> postType = [PostType.cat, PostType.dog];
  final Rxn<PostType> selectedPostType = Rxn<PostType>();
  final int maxImageNum = 4;
  final RxInt selectedImageNum = 0.obs;

  RxList<ImageItem> imageItemList = RxList<ImageItem>();
  late String _boardId;
  final RxBool validatePostButton = false.obs;
  RxList<Conimal> _selectedConimalList = RxList<Conimal>();
  TextEditingController textController = TextEditingController();
  @override
  void onReady() {
    super.onReady();
    _boardId = Get.arguments as String;
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
        title: '글을 그만쓸까요?',
        subtitle: '작성된 내용은 모두 사라집니다');
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
    Either<Failure, List<ImageItem>> imageUploadRefsEither = await showLoading(
        () => _imageRepository.uploadImageFileList(
            imageFileItems: getOnlyFileImageItem()));

    imageUploadRefsEither.fold(
        (fail) => FailureInterpreter().mapFailureToSnackbar(
            fail, 'image upload error'), (imageRefList) async {
      var newPostResultEither = await showLoading(() =>
          _communityRepository.newPost(
              newPost: Post(
                  images: imageRefList,
                  authorId: AuthController.to.wcUser.value!.uid,
                  nickname: AuthController.to.wcUser.value!.nickname,
                  boardId: _boardId,
                  content: textController.text,
                  createdAt: DateTime.now(),
                  postType: selectedPostType.value!,
                  isLike: false)));
      newPostResultEither.fold(
          (fail) => FailureInterpreter()
              .mapFailureToSnackbar(fail, 'createNewPostDB'), (addedPost) {
        Get.back(result: addedPost);
      });
    });
  }

  List<ImageItem> getOnlyFileImageItem() {
    // imageItemList.where((p0) => p0.imageType == ImageType.file).toList();
    return imageItemList.where((p0) => p0.imageType == ImageType.file).toList();
  }
}
