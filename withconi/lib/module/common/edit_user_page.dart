import 'package:flutter_svg/svg.dart';
import 'package:withconi/module/common/controllers/edit_user_controller.dart';
import 'package:withconi/import_basic.dart';
import 'package:withconi/module/home/home_page.dart';
import 'package:withconi/global_widgets/appbar/appbar.dart';
import 'package:withconi/global_widgets/button/profile_picker_button.dart';
import 'package:withconi/global_widgets/button/wide_button.dart';
import 'package:withconi/global_widgets/text_field/suffix_button_textfield.dart';
import 'package:withconi/module/theme/text_theme.dart';
import '../../global_widgets/text_field/textfield.dart';

class EditUserPage extends StatelessWidget {
  const EditUserPage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    EditUserController _controller = Get.find();

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
                style: TextStyle(
                    fontFamily: WcFontFamily.notoSans,
                    fontSize: 16,
                    color: (_controller.validateButton())
                        ? WcColors.blue100
                        : WcColors.grey120,
                    fontWeight: FontWeight.w600,
                    letterSpacing: 0.6),
              ),
            )),
        body: SingleChildScrollView(
          child: SafeArea(
            child: SizedBox(
              width: WcWidth(context),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: <Widget>[
                        const SizedBox(
                          height: 25,
                        ),
                        Obx(
                          () => Center(
                            child: ProfileImagePickerButton(
                              onTap: _controller.onTapProfileButton,
                              imageItem: _controller.profileImage.value,
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 20,
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
                        WcTextField(
                          fontColor: WcColors.grey140,
                          readOnly: true,
                          labelText: '이름',
                          hintText: '이름',
                          textController: _controller.nameTextController,
                          keyboardType: TextInputType.name,
                        ),
                        const SizedBox(
                          height: 24,
                        ),
                        WcSuffixIconTextField(
                          readOnly: true,
                          labelText: '비밀번호',
                          hintText: '비밀번호',
                          keyboardType: TextInputType.name,
                          textObscure: true,
                          fontColor: (!_controller.passwordChangable)
                              ? WcColors.grey140.withOpacity(0.9)
                              : null,
                          textController:
                              TextEditingController(text: '********'),
                          suffixIcon: WcTextButton(
                            onTap: _controller.onChangePasswordTap,
                            activeButtonColor: WcColors.blue100,
                            inactiveButtonColor: WcColors.grey80,
                            active: _controller.passwordChangable,
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
                          width: WcWidth(context) - 40,
                          errorText: _controller.nickNameErrorText.value,
                          labelText: '아이디 (이메일)',
                          hintText: '아이디',
                          readOnly: true,
                          textController: _controller.emailTextController,
                          keyboardType: TextInputType.emailAddress,
                          suffixIcon: _controller.providerIcon,
                          fontColor: WcColors.grey140,
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Obx(
                          () => Visibility(
                            visible: _controller.passwordChangable,
                            child: EmailVerificationButton(
                              isEmailVerified:
                                  _controller.isEmailVerified.value,
                              onTap: _controller.onEmailVerificationTap,
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 120,
                    ),
                    Column(
                      children: [
                        Center(
                          child: GestureDetector(
                            onTap: _controller.signOut,
                            child: Container(
                              width: 60,
                              height: 30,
                              color: WcColors.white,
                              child: Column(
                                children: [
                                  const Text(
                                    '로그아웃',
                                    style: TextStyle(
                                        fontFamily: WcFontFamily.notoSans,
                                        fontSize: 14,
                                        height: 1,
                                        color: WcColors.grey120),
                                  ),
                                  Divider(
                                    thickness: 1,
                                    height: 5,
                                    color: WcColors.grey100,
                                  )
                                ],
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Center(
                          child: GestureDetector(
                            onTap: _controller.unregister,
                            child: Container(
                              width: 65,
                              height: 30,
                              color: WcColors.white,
                              child: Column(
                                children: [
                                  const Text(
                                    '탈퇴하기',
                                    style: TextStyle(
                                        fontFamily: WcFontFamily.notoSans,
                                        fontSize: 14,
                                        height: 1,
                                        color: WcColors.grey120),
                                  ),
                                  Divider(
                                    thickness: 1,
                                    height: 5,
                                    color: WcColors.grey100,
                                  )
                                ],
                              ),
                            ),
                          ),
                        ),
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
    this.onTap,
  }) : super(key: key);

  bool isEmailVerified;
  void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (!isEmailVerified) ? onTap : null,
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 3),
        height: 40,
        width: 150,
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
              width: 7,
            ),
            Text(
              (isEmailVerified) ? '이메일 인증 완료' : '이메일 인증하기',
              style: TextStyle(
                  fontFamily: WcFontFamily.notoSans,
                  fontWeight: FontWeight.w600,
                  fontSize: 14,
                  height: 1.2,
                  color:
                      (isEmailVerified) ? WcColors.blue100 : WcColors.red100),
            ),
          ],
        ),
      ),
    );
  }
}
