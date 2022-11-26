import 'package:withconi/core/signing_auth_info.dart';
import 'package:withconi/data/model/dto/response_dto/auth_response/user_response_dto.dart';
import 'package:withconi/module/ui_model/conimal_ui_model.dart';
import 'package:withconi/module/ui_model/conimal_ui_model.dart';
import 'package:withconi/module/ui_model/ui_model_abstract/ui_model.dart';

import '../../data/enums/enum.dart';
import '../../global_widgets/photo_gallary/image_item.dart';

class SignUpDataModel implements UIModel {
  late String email;
  late String name;
  late String nickname;
  SigningAuthInfo? signingAuthInfo;
  late bool isEmailVerified;
  late bool verificationSkipped;
  ImageItem? profileImage;
  late bool isWrittenReview;
  late List<ConimalUIModel> conimals;

  // factory SignupUiModel.fromDTO(UserResponseDTO userResponseDTO) {
  //   List<ConimalUIModel> conimals = userResponseDTO.conimals
  //       .map((conimal) => ConimalUIModel.fromDTO(conimal))
  //       .toList();

  //   ImageItem? profileImageItem = (userResponseDTO.photoURL.isEmpty)
  //       ? null
  //       : ImageItem(
  //           id: DateTime.now().toString(),
  //           resource: userResponseDTO.photoURL,
  //           imageType: ImageType.network);

  //   bool passwordChangable =
  //       (userResponseDTO.provider == Provider.email) ? true : false;
  //   return UserUIModel(
  //       userResponseDTO.uid,
  //       userResponseDTO.displayName,
  //       userResponseDTO.nickname,
  //       userResponseDTO.provider,
  //       userResponseDTO.isEmailVerified,
  //       userResponseDTO.verificationSkipped,
  //       profileImageItem,
  //       userResponseDTO.isWrittenReview,
  //       conimals,
  //       passwordChangable);
  // }

  SignUpDataModel(
    this.email,
    this.name,
    this.nickname,
    this.signingAuthInfo,
    this.isEmailVerified,
    this.verificationSkipped,
    this.profileImage,
    this.isWrittenReview,
    this.conimals,
  );
}
