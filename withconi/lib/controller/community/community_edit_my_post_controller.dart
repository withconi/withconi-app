import 'dart:io';
import 'package:dartz/dartz.dart';
import 'package:withconi/configs/constants/enum.dart';
import 'package:withconi/controller/auth_controller.dart';
import 'package:withconi/data/repository/community_repository.dart';
import 'package:withconi/data/repository/image_repository.dart';
import 'package:withconi/ui/widgets/loading.dart';
import 'package:withconi/ui/widgets/photo_gallary/image_item.dart';
import '../../configs/helpers/image_picker_helper.dart';
import '../../core/error_handling/failures.dart';
import '../../data/model/conimal.dart';
import '../../data/model/post.dart';
import '../../import_basic.dart';
import '../../ui/widgets/dialog/selection_dialog.dart';
import '../ui_interpreter/failure_ui_interpreter.dart';

class CommunityEditMyPostController extends GetxController {
  final CommunityRepository _communityRepository = CommunityRepository();
  final ImageRepository _imageRepository = ImageRepository();
  final List<PostType> postType = [PostType.cat, PostType.dog];
  final Rxn<PostType> selectedPostType = Rxn<PostType>();
  final int maxImageNum = 4;
  final RxInt selectedImageNum = 0.obs;
  RxList<ImageItem> imageItemList = RxList<ImageItem>();
  late String _boardId;
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
    // _boardId = Get.arguments as String;
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
        createNewPostDB();
      }
    }
  }

  void createNewPostDB() async {
    // var imageUploadRefsEither = await showLoading(() =>
    //     _imageRepository.uploadImageFileList(imageFiles: getOnlyFileImage()));

    // imageUploadRefsEither.fold(
    //     (fail) => FailureInterpreter().mapFailureToSnackbar(
    //         fail, 'image upload error'), (imageRefList) async {
    //   var newPostResultEither = await showLoading(() =>
    //       _communityRepository.newPost(
    //           newPost: Post(
    //               authorId: AuthController.to.wcUser.value!.uid,
    //               nickname: AuthController.to.wcUser.value!.nickname,
    //               boardId: _boardId,
    //               content: textController.text,
    //               createdAt: DateTime.now(),
    //               postType: selectedPostType.value!)));
    //   newPostResultEither.fold(
    //       (fail) => FailureInterpreter()
    //           .mapFailureToSnackbar(fail, 'createNewPostDB'), (addedPost) {
    //     Get.back(result: addedPost);
    //   });
    // });
  }

  List<File> getOnlyFileImage() {
    List<File> imageFiles = [];

    for (ImageItem imageItem in imageItemList) {
      if (imageItem.imageType == ImageType.file) {
        imageFiles.add(File(imageItem.resource));
      }
    }
    return imageFiles;
  }
}
