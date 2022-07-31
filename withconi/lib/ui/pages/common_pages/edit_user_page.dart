import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:withconi/controller/common_controller/edit_user_controller.dart';
import 'package:withconi/import_basic.dart';
import 'package:withconi/ui/pages/home/home_page.dart';
import 'package:withconi/ui/theme/colors.dart';
import 'package:withconi/ui/theme/sizes.dart';
import 'package:withconi/ui/widgets/appbar/appbar.dart';
import 'package:withconi/ui/widgets/button/wide_button.dart';
import 'package:withconi/ui/widgets/text_field/suffix_button_textfield.dart';
import '../../widgets/text_field/textfield.dart';

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
        appBar: WcAppBar(
            title: '내 정보 수정',
            onLeadingTap: _controller.getBack,
            onActionTap: _controller.onFinishButtonTap,
            action: Obx(
              () => Text(
                '완료',
                style: GoogleFonts.notoSans(
                    fontSize: 17,
                    color: (_controller.validateButton())
                        ? WcColors.blue100
                        : WcColors.grey120,
                    fontWeight: FontWeight.bold,
                    letterSpacing: 0.6),
              ),
            )),
        body: SingleChildScrollView(
          child: SafeArea(
            child: SizedBox(
              width: WcWidth,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        const SizedBox(
                          height: 25,
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
                                        child:
                                            (_controller.profileSelected.value)
                                                ? ClipOval(
                                                    child: Image.file(
                                                      File(_controller
                                                          .profileImg
                                                          .value!
                                                          .path),
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
                                        color:
                                            WcColors.grey100.withOpacity(0.5),
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
                        SizedBox(
                          height: 10,
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
                        WcSuffixIconTextField(
                          readOnly: true,
                          labelText: '비밀번호',
                          hintText: '비밀번호',
                          keyboardType: TextInputType.name,
                          textObscure: true,
                          textController:
                              TextEditingController(text: '********'),
                          suffixIcon: WcTextButton(
                            onTap: _controller.changePassword,
                            activeButtonColor: WcColors.blue100,
                            inactiveButtonColor: WcColors.grey80,
                            active: _controller.passwordEditable,
                            width: 72,
                            height: 33,
                            text: '변경하기',
                            textSize: 14,
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
                          suffixIcon: _controller.providerIcon,
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 110,
                    ),
                    Column(
                      children: [
                        WcWideButtonWidget(
                            buttonText: '로그아웃',
                            onTap: _controller.signOut,
                            activeButtonColor: WcColors.grey100,
                            buttonWidth: WcWidth - 40,
                            active: true,
                            activeTextColor: WcColors.grey200),
                        SizedBox(
                          height: 20,
                        ),
                        WcWideButtonWidget(
                            buttonText: '탈퇴하기',
                            onTap: _controller.unregister,
                            activeButtonColor: WcColors.grey80,
                            buttonWidth: WcWidth - 40,
                            active: true,
                            activeTextColor: WcColors.grey160),
                      ],
                    ),
                    SizedBox(
                      height: 20,
                    )
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
