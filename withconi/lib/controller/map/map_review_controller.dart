import 'dart:io';
import 'package:dartz/dartz.dart';
import 'package:withconi/configs/constants/enum.dart';
import 'package:withconi/controller/auth_controller.dart';
import 'package:withconi/data/model/abstract_class/place_type.dart';
import 'package:withconi/data/model/disease.dart';
import 'package:withconi/data/repository/community_repository.dart';
import 'package:withconi/data/repository/image_repository.dart';
import 'package:withconi/ui/widgets/loading.dart';
import '../../configs/helpers/image_picker_helper.dart';
import '../../core/error_handling/failures.dart';
import '../../data/model/conimal.dart';
import '../../data/model/post.dart';
import '../../import_basic.dart';
import '../../ui/entities/review_entity.dart';
import '../../ui/widgets/dialog/selection_dialog.dart';
import '../ui_interpreter/failure_ui_interpreter.dart';

class MapReviewController extends GetxController {
  final CommunityRepository _communityRepository = CommunityRepository();
  final ImageRepository _imageRepository = ImageRepository();
  final List<PostType> postType = [PostType.cat, PostType.dog];
  final Rxn<PostType> selectedPostType = Rxn<PostType>();
  final int maxImageNum = 4;
  final RxInt selectedImageNum = 0.obs;
  final RxList<File> imageFileList = <File>[].obs;
  late PlacePreview place;
  final RxBool validatePostButton = false.obs;
  // Rxn<ReviewRate> selectedReviewRate = Rxn<ReviewRate>();
  Rxn<ReviewRateEntity> selectedReviewEntity = Rxn<ReviewRateEntity>();
  RxList<ReviewItems> selectedReviewItemList = RxList<ReviewItems>();
  RxList<Conimal> selectedConimalList = RxList<Conimal>();
  RxList<DiseaseType> selectedDiseaseTypeList = RxList<DiseaseType>();
  RxBool showDiseaseTypeSection = false.obs;
  RxBool showReviewItemSection = false.obs;
  RxBool showReviewRateSection = false.obs;
  TextEditingController textController = TextEditingController();
  List<ReviewRateEntity> reviewRateEntities = [
    HighReviewEntity(),
    MiddleReviewEntity(),
    LowReviewEntity()
  ];
  ScrollController scrollController = ScrollController();

  List<DiseaseType> diseaseTypeList = [
    DiseaseType.cardiovascular,
    DiseaseType.digestive,
    DiseaseType.musculoskeletal,
    DiseaseType.ophthalmology,
    DiseaseType.respiratory,
    DiseaseType.urinary,
  ];

  RxBool visitVerified = false.obs;
  @override
  void onInit() {
    super.onInit();
    place = Get.arguments as PlacePreview;
  }
  // @override
  // void onReady() {
  //   super.onReady();
  //   place = Get.arguments as PlacePreview;
  // }

  void onPostTypeChanged(PostType postType) {
    selectedPostType.value = postType;
  }

  Future<void> getBack() async {
    bool isConfirmed = await showSelectionDialog(
        cancleText: '아니요',
        confirmText: '네',
        title: '리뷰를 그만쓸까요?',
        subtitle: '작성된 리뷰는 모두 사라집니다');
    if (isConfirmed) {
      Get.back();
    }
  }

  onConimalSelected(Conimal conimal) {
    if (selectedConimalList.contains(conimal)) {
      selectedConimalList.remove(conimal);
    } else {
      selectedConimalList.add(conimal);
    }
    if (selectedConimalList.isNotEmpty) {
      showDiseaseTypeSection.value = true;
    } else {
      showDiseaseTypeSection.value = false;
    }
  }

  onReviewItemSelected(ReviewItems item) {
    if (selectedReviewItemList.contains(item)) {
      selectedReviewItemList.remove(item);
    } else {
      selectedReviewItemList.add(item);
    }
  }

  validateButton() {
    if (selectedConimalList.isNotEmpty &&
        selectedDiseaseTypeList.isNotEmpty &&
        selectedReviewEntity.value != null &&
        selectedReviewItemList.isNotEmpty) {
      return true;
    } else {
      return false;
    }
  }

  onDiseaseTypeSelected(DiseaseType diseaseType) {
    if (selectedDiseaseTypeList.isEmpty) {
      scrollController.animateTo(400,
          duration: const Duration(milliseconds: 200), curve: Curves.linear);
    }
    if (selectedDiseaseTypeList.contains(diseaseType)) {
      selectedDiseaseTypeList.remove(diseaseType);
    } else {
      if (selectedDiseaseTypeList.length < 3) {
        selectedDiseaseTypeList.add(diseaseType);
      }
    }
    if (selectedDiseaseTypeList.isNotEmpty) {
      showReviewRateSection.value = true;
    } else {
      showReviewRateSection.value = false;
    }
  }

  onReviewRateChanged(ReviewRateEntity reviewRateEntity) {
    selectedReviewItemList.clear();
    if (selectedReviewEntity.value == null) {
      scrollController.animateTo(700,
          duration: Duration(milliseconds: 200), curve: Curves.linear);
    }
    selectedReviewEntity.value = reviewRateEntity;
    showReviewItemSection.value = true;
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
        // createNewPostDB();
      }
    }
  }

  // void createNewPostDB() async {
  //   var imageUploadRefsEither = await showLoading(
  //       () => _imageRepository.uploadImageFileList(imageFiles: imageFileList));

  //   imageUploadRefsEither.fold(
  //       (fail) => FailureInterpreter().mapFailureToSnackbar(
  //           fail, 'image upload error'), (imageRefList) async {
  //     var newPostResultEither = await showLoading(() =>
  //         _communityRepository.newPost(
  //             newPost: Post(
  //                 authorId: AuthController.to.wcUser.value!.uid,
  //                 nickname: AuthController.to.wcUser.value!.nickname,
  //                 boardId: place,
  //                 content: textController.text,
  //                 createdAt: DateTime.now(),
  //                 postType: selectedPostType.value!)));
  //     newPostResultEither.fold(
  //         (fail) => FailureInterpreter()
  //             .mapFailureToSnackbar(fail, 'createNewPostDB'), (addedPost) {
  //       Get.back(result: addedPost);
  //     });
  //   });
  // }
}
