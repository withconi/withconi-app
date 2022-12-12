import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:withconi/data/model/dto/response_dto/auth_response/user_response_dto.dart';
import 'package:withconi/module/ui_model/conimal_ui_model.dart';
import 'package:withconi/module/ui_model/conimal_ui_model.dart';
import 'package:withconi/module/ui_model/ui_model_abstract/ui_model.dart';

import '../../data/enums/enum.dart';
import '../../global_widgets/photo_gallary/image_item.dart';
part 'user_ui_model.freezed.dart';

@unfreezed
class UserUIModel with _$UserUIModel {
  const UserUIModel._();

  factory UserUIModel({
    required String uid,
    required String email,
    required String diaplayName,
    required String nickname,
    required Provider provider,
    required bool isEmailVerified,
    required bool verificationSkipped,
    required ImageItem profileImage,
    required bool isWrittenReview,
    required List<ConimalUIModel> conimals,
    required bool passwordChangable,
  }) = _UserUIModel;

  factory UserUIModel.fromDTO(UserResponseDTO userResponseDTO) {
    List<ConimalUIModel> conimals = userResponseDTO.conimals
        .map((conimal) => ConimalUIModel.fromDTO(conimal))
        .toList();

    bool passwordChangable =
        (userResponseDTO.provider == Provider.email) ? true : false;
    return UserUIModel(
        uid: userResponseDTO.uid,
        email: userResponseDTO.email,
        diaplayName: userResponseDTO.displayName,
        nickname: (userResponseDTO.nickname.isNotEmpty)
            ? userResponseDTO.nickname
            : '사용자 없음',
        provider: userResponseDTO.provider,
        isEmailVerified: userResponseDTO.isEmailVerified,
        verificationSkipped: userResponseDTO.verificationSkipped,
        profileImage: ImageItem(
            id: DateTime.now().toString(),
            imageUrl: userResponseDTO.photoURL,
            imageType: ImageType.network),
        isWrittenReview: userResponseDTO.isWrittenReview,
        conimals: conimals,
        passwordChangable: passwordChangable);
  }
}
