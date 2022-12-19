import 'dart:io';
import 'package:dartz/dartz.dart';
import 'package:image_picker/image_picker.dart';
import 'package:withconi/data/enums/enum.dart';
import 'package:withconi/module/auth/auth_controller.dart';
import 'package:withconi/data/repository/map_repository.dart';
import 'package:withconi/global_widgets/dialog/place_verification_dialog.dart';
import 'package:withconi/global_widgets/loading/loading_overlay.dart';
import 'package:withconi/module/community/controllers/custom_state_mixin.dart';
import 'package:withconi/module/ui_model/conimal_ui_model.dart';
import 'package:withconi/module/ui_model/disease_ui_model.dart';
import 'package:withconi/module/ui_model/review_detail_ui_model.dart';
import '../../../core/error_handling/failures.dart';
import '../../../core/tools/helpers/image_picker_helper.dart';
import '../../../global_widgets/photo_gallary/image_item.dart';
import '../../../import_basic.dart';
import '../../../global_widgets/dialog/selection_dialog.dart';
import '../../../global_widgets/snackbar.dart';
import '../../../core/error_handling/failure_ui_interpreter.dart';
import '../../community/widgets/more_tap_bottom_sheet.dart';
import '../../community/widgets/pick_image_bottom_sheet.dart';
import '../../page_status.dart';
import '../../ui_model/place_ui_model/abstract_class/place_preview_ui.dart';

class MapImageVerificationController extends GetxController with WcStateMixin {
  MapImageVerificationController(this._selectedImageList,
      [this.editable = true]);
  final int maxImageNum = 2;

  RxList<ImageItem> selectedPhotoList = RxList<ImageItem>();
  late final List<ImageItem> _selectedImageList;

  late final bool editable;

  @override
  onInit() {
    super.onInit();
    change(null, status: const PageStatus.init());
    selectedPhotoList.assignAll(_selectedImageList);
    change(null, status: const PageStatus.success());
  }

  deleteImage(int imageIndex) {
    selectedPhotoList.removeAt(imageIndex);
    selectedPhotoList.refresh();
  }

  _pickImage(ImageSource imageSource) async {
    final ImagePickHelper _picker = ImagePickHelper();
    final Either<Failure, ImageItem?> imageItemEither =
        await showLoading(() => _picker.pickImage(imageSource));

    var newImageItem = imageItemEither.fold((fail) {
      FailureInterpreter().mapFailureToSnackbar(fail, 'pickMultipleImages');
      return null;
    }, (imageItem) {
      return imageItem;
    });

    if (newImageItem != null) {
      selectedPhotoList.add(newImageItem);
      selectedPhotoList.refresh();
    }
  }

  onTapPickImageButton() async {
    if (selectedPhotoList.length >= 2) {
      showCustomSnackbar(text: '사진은 2개까지만 등록 가능해요');
    } else {
      ImagePickOption? selectedOption = await showPickImageBottomSheet();
      if (selectedOption != null) {
        if (selectedOption == ImagePickOption.deleteAll) {
          selectedPhotoList.clear();
          selectedPhotoList.refresh();
        } else {
          await _pickImage(selectedOption.imageSource!);
        }
      }
    }
  }

  Future<void> getBack() async {
    if (selectedPhotoList.isEmpty) {
      Get.back();
      return;
    }
    bool isConfirmed = await showSelectionDialog(
      cancleText: '삭제하기',
      confirmText: '저장하기',
      title: '사진을 저장할까요?',
    );
    if (isConfirmed) {
      Get.back(result: selectedPhotoList.toList());
    } else {
      Get.back();
    }
  }

  onFinishButtonTap() {
    if (editable) {
      Get.back(result: selectedPhotoList.toList());
    }
  }
}
