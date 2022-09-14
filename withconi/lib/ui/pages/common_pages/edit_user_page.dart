import 'package:flutter_svg/svg.dart';
import 'package:withconi/controller/common_controller/edit_user_controller.dart';
import 'package:withconi/import_basic.dart';
import 'package:withconi/ui/pages/home/home_page.dart';
import 'package:withconi/ui/widgets/appbar/appbar.dart';
import 'package:withconi/ui/widgets/button/profile_picker_button.dart';
import 'package:withconi/ui/widgets/button/wide_button.dart';
import 'package:withconi/ui/widgets/text_field/suffix_button_textfield.dart';
import '../../widgets/text_field/textfield.dart';

class EditUserPage extends StatelessWidget {
  const EditUserPage({Key? key}) : super(key: key);
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
                        Obx(
                          () => Center(
                            child: ProfileImagePickerButton(
                              onTap: _controller.pickImage,
                              imageFile: _controller.profileImg.value,
                              profileSeleted: _controller.profileSelected.value,
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
                            active: _controller.isProviderEmail,
                            width: 72,
                            height: 33,
                            text: '변경하기',
                            textSize: 14,
                          ),
                        ),
                        const SizedBox(
                          height: 24,
                        ),
                        Column(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              WcSuffixIconTextField(
                                width: WcWidth - 40,
                                errorText: _controller.nickNameErrorText.value,
                                labelText: '아이디 (이메일)',
                                hintText: '아이디',
                                readOnly: true,
                                textController: _controller.emailTextController,
                                keyboardType: TextInputType.emailAddress,
                                suffixIcon: _controller.providerIcon,
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              Visibility(
                                visible: _controller.isProviderEmail,
                                child: EmailVerificationButton(
                                  isEmailVerified: _controller.isEmailVerified,
                                ),
                              )
                            ]),
                      ],
                    ),
                    const SizedBox(
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
                        const SizedBox(
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
                    const SizedBox(
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

class EmailVerificationButton extends StatelessWidget {
  EmailVerificationButton({
    Key? key,
    required this.isEmailVerified,
  }) : super(key: key);

  bool isEmailVerified;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: Container(
        height: 40,
        width: 140,
        decoration: BoxDecoration(
            color: (isEmailVerified) ? WcColors.blue20 : WcColors.red20,
            borderRadius: BorderRadius.circular(5)),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            (isEmailVerified)
                ? SvgPicture.asset(
                    'assets/icons/email_verified.svg',
                  )
                : SvgPicture.asset(
                    'assets/icons/email_unverified.svg',
                  ),
            const SizedBox(
              width: 10,
            ),
            Text(
              (isEmailVerified) ? '이메일 인증 완료' : '이메일 인증 미완료',
              style: GoogleFonts.notoSans(
                  fontWeight: FontWeight.w600,
                  fontSize: 14,
                  color:
                      (isEmailVerified) ? WcColors.blue100 : WcColors.red100),
            ),
          ],
        ),
      ),
    );
  }
}
