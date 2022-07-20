import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:flutter/services.dart';
import 'package:withconi/configs/constants/enum.dart';
import 'package:withconi/controller/auth_controller.dart';
import 'package:withconi/data/repository/community_repository.dart';
import 'package:withconi/ui/widgets/loading.dart';

import '../../configs/helpers/image_picker_helper.dart';
import '../../core/error_handling/failures.dart';
import '../../data/model/post.dart';
import '../../import_basic.dart';
import '../ui_interpreter/failure_ui_interpreter.dart';

class CommunityNewPostController extends GetxController {
  CommunityRepository _communityRepository = CommunityRepository();
  List<PostType> postType = [PostType.cat, PostType.dog];
  Rxn<PostType> selectedPostType = Rxn<PostType>();
  final int maxImageNum = 4;
  RxInt selectedImageNum = 0.obs;
  RxList<File> imageFileList = <File>[].obs;
  late String _boardId;
  RxBool validatePostButton = false.obs;

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

  addNewPost() async {
    if (selectedPostType.value == null) {
      return FailureInterpreter()
          .mapFailureToSnackbar(NoPostTypeSelectedFailure(), 'addNewPost');
    } else if (textController.text.isEmpty) {
      return FailureInterpreter()
          .mapFailureToSnackbar(NoPostContentsFailure(), 'addNewPost');
    } else {
      var newPostResultEither = await showLoading(() =>
          _communityRepository.newPost(
              newPost: Post(
                  authorId: AuthController.to.wcUser.value!.uid,
                  nickname: AuthController.to.wcUser.value!.nickname,
                  boardId: _boardId,
                  content: textController.text,
                  createdAt: DateTime.now(),
                  speciesType: selectedPostType.value!)));

      newPostResultEither.fold(
          (fail) => FailureInterpreter()
              .mapFailureToSnackbar(fail, 'pickMultipleImages'), (addedPost) {
        Get.back(result: addedPost);
      });
    }
  }
}
