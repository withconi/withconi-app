import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:withconi/controller/signup/signup_profile_controller.dart';
import 'package:withconi/ui/theme/colors.dart';
import 'package:withconi/ui/theme/sizes.dart';
import 'package:withconi/ui/widgets/button/wide_button.dart';
import '../../widgets/text_field/textfield.dart';

class SignupProfilePage extends StatelessWidget {
  SignupProfilePage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    SignupProfileController _controller = Get.put(SignupProfileController());

    return GestureDetector(
      onTap: () {
        FocusScopeNode currentFocus = FocusScope.of(context);

        if (!currentFocus.hasPrimaryFocus) {
          currentFocus.unfocus();
        }
      },
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        body: SafeArea(
          child: SizedBox(
            height: WcHeight,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  const SizedBox(
                    height: 45,
                  ),
                  Text(
                    '사용자의 이름과\n프로필을 알려주세요',
                    style: GoogleFonts.notoSans(
                        fontSize: 25, fontWeight: FontWeight.w600),
                  ),
                  const SizedBox(
                    height: 45,
                  ),
                  Center(
                    child: GestureDetector(
                      onTap: _controller.pickImage,
                      child: Stack(
                        children: [
                          SizedBox(
                            width: 100,
                            height: 100,
                          ),
                          SizedBox(
                            width: 94,
                            height: 94,
                            child: Obx(
                              () => CircleAvatar(
                                  backgroundColor: WcColors.grey60,
                                  child: (_controller.profileSelected.value)
                                      ? ClipOval(
                                          child: Image.file(
                                            File(_controller
                                                .profileImg.value!.path),
                                            fit: BoxFit.cover,
                                            height: 100,
                                            width: 100,
                                          ),
                                        )
                                      : SvgPicture.asset(
                                          'assets/icons/withconi_grey.svg',
                                          width: 44,
                                        )),
                            ),
                          ),
                          Positioned(
                            right: 0,
                            bottom: 7,
                            child: Container(
                              decoration: BoxDecoration(boxShadow: [
                                BoxShadow(
                                  color: WcColors.grey100.withOpacity(0.5),
                                  spreadRadius: -2,
                                  blurRadius: 10,
                                  offset: const Offset(
                                      2, 4), // changes position of shadow
                                ),
                              ]),
                              child: CircleAvatar(
                                maxRadius: 17,
                                backgroundColor: WcColors.white,
                                child: SvgPicture.asset(
                                  'assets/icons/edit.svg',
                                  width: 17,
                                ),
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                  Obx(() {
                    return WcTextField(
                      errorText: _controller.nameErrorText.value,
                      labelText: '이름',
                      hintText: '이름',
                      onChanged: _controller.onNameChanged,
                      textController: _controller.nameTextController,
                      keyboardType: TextInputType.name,
                    );
                  }),
                  const SizedBox(
                    height: 24,
                  ),
                  Obx(() {
                    return WcTextField(
                      errorText: _controller.nickNameErrorText.value,
                      labelText: '닉네임',
                      hintText: '닉네임',
                      onChanged: _controller.onNickNameChanged,
                      textController: _controller.nickNameTextController,
                      keyboardType: TextInputType.name,
                    );
                  }),
                  const SizedBox(
                    height: 60,
                  ),
                  Obx(() {
                    return WcWideButtonWidget(
                      active: _controller.validateButton(),
                      activeButtonColor: WcColors.blue100,
                      activeTextColor: WcColors.white,
                      buttonText: '다음',
                      buttonWidth: WcWidth - 40,
                      onTap: (_controller.isButtonValid.value)
                          ? _controller.nextStep
                          : null,
                    );
                  }),
                  const SizedBox(
                    height: 20,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
