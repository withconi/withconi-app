import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:withconi/controller/setting/user/edit_user_controller.dart';
import 'package:withconi/controller/signup/signup_profile_controller.dart';
import 'package:withconi/controller/ui_interpreter/failure_ui_interpreter.dart';
import 'package:withconi/ui/pages/home/home_page.dart';
import 'package:withconi/ui/theme/colors.dart';
import 'package:withconi/ui/theme/sizes.dart';
import 'package:withconi/ui/widgets/appbar/appbar.dart';
import 'package:withconi/ui/widgets/button/icon_button.dart';
import 'package:withconi/ui/widgets/button/text_button.dart';
import 'package:withconi/ui/widgets/button/wide_button.dart';
import 'package:withconi/ui/widgets/text_field/suffix_button_textfield.dart';

import '../../../widgets/text_field/textfield.dart';
import '../../start/start_widgets/sns_button.dart';

class EditUserPage extends StatelessWidget {
  EditUserPage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    EditUserController _controller = Get.put(EditUserController());

    return GestureDetector(
      onTap: () {
        FocusScopeNode currentFocus = FocusScope.of(context);

        if (!currentFocus.hasPrimaryFocus) {
          currentFocus.unfocus();
        }
      },
      child: Scaffold(
        resizeToAvoidBottomInset: true,
        appBar: WcAppBar(title: '내 정보 수정'),
        body: SingleChildScrollView(
          child: SafeArea(
            bottom: false,
            child: SizedBox(
              height: WcHeight,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    const SizedBox(
                      height: 20,
                    ),
                    Center(
                      child: GestureDetector(
                        onTap: _controller.pickImage,
                        child: Stack(
                          children: [
                            const SizedBox(
                              width: 100,
                              height: 100,
                            ),
                            SizedBox(
                              width: 90,
                              height: 90,
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
                      height: 24,
                    ),
                    WcSuffixIconTextField(
                      readOnly: true,
                      labelText: '비밀번호',
                      hintText: '비밀번호',
                      keyboardType: TextInputType.name,
                      textObscure: true,
                      textController: TextEditingController(text: '********'),
                      suffixIcon: WcTextButton(
                        onTap: _controller.changePassword,
                        activeButtonColor: WcColors.blue100,
                        inactiveButtonColor: WcColors.grey80,
                        active: _controller.passwordEditable,
                        width: 72,
                        height: 33,
                        text: '변경하기',
                        textSize: 13,
                      ),
                    ),
                    const SizedBox(
                      height: 24,
                    ),
                    WcSuffixIconTextField(
                      errorText: _controller.nickNameErrorText.value,
                      labelText: '아이디 (이메일)',
                      hintText: '아이디',
                      readOnly: true,
                      textController: _controller.emailTextController,
                      keyboardType: TextInputType.emailAddress,
                      suffixIcon: Image.asset(
                        'assets/icons/${_controller.userProvider}.png',
                        width: 40,
                      ),
                    ),
                    const SizedBox(
                      height: 60,
                    ),
                    Obx(() {
                      return WcWideButtonWidget(
                        active: _controller.validateButton(),
                        activeButtonColor: WcColors.blue100,
                        activeTextColor: WcColors.white,
                        buttonText: '수정완료',
                        buttonWidth: WcWidth - 40,
                        onTap: (_controller.isButtonValid.value)
                            ? _controller.editUserInfo
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
      ),
    );
  }
}
