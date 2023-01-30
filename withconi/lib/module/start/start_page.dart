// ignore_for_file: prefer_const_constructors_in_immutables

import 'dart:io';
import 'package:withconi/data/enums/enum.dart';
import 'package:withconi/import_basic.dart';
import 'package:withconi/module/start/start_controller.dart';
import 'package:withconi/module/start/start_widgets/sns_button.dart';
import 'package:withconi/module/theme/text_theme.dart';
import '../../global_widgets/button/state_button.dart';
import '../../global_widgets/text_field/textfield.dart';

class StartPage extends StatelessWidget {
  StartPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    StartPageController _controller = Get.find();

    return GestureDetector(
      onTap: () {
        FocusScopeNode currentFocus = FocusScope.of(context);

        if (!currentFocus.hasPrimaryFocus) {
          currentFocus.unfocus();
        }
      },
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        body: Obx(
          () => Stack(
            children: [
              SafeArea(
                child: SizedBox(
                  height: WcHeight(context),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        const SizedBox(
                          height: 75,
                        ),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Image.asset(
                                'assets/icons/withconi.png',
                                height: 51,
                              ),
                              const SizedBox(
                                height: 16,
                              ),
                              const Text(
                                '함께 코니멀의\n질병관리를 시작해볼까요?',
                                style: TextStyle(
                                    fontFamily: WcFontFamily.notoSans,
                                    fontSize: 26,
                                    fontWeight: FontWeight.w600),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(
                          height: 70,
                        ),
                        Expanded(
                          child: Column(
                            children: [
                              Obx(() => WcTextField(
                                    isEng: true,
                                    hintText: '이메일을 입력하여 진행해보세요',
                                    onChanged:
                                        _controller.onEmailTextFieldChanged,
                                    textController:
                                        _controller.emailTextController,
                                    keyboardType: TextInputType.emailAddress,
                                    errorText: _controller.emailErrorText.value,
                                  )),
                              const SizedBox(
                                height: 40,
                              ),
                              Obx(
                                () => WcStateButtonWidget(
                                  activeButtonColor: WcColors.blue100,
                                  activeTextColor: WcColors.white,
                                  buttonText: _controller
                                      .signingState.value.displayName,
                                  buttonWidth: WcWidth(context) - 40,
                                  onTap: _controller.onNextButtonTap,
                                  buttonState: _controller.buttonState.value,
                                ),
                              ),
                            ],
                          ),
                        ),
                        Expanded(
                          child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: Provider.values
                                  .where((element) => (element.signMethod ==
                                          SignMethod.sns &&
                                      element.platform
                                          .contains(Platform.operatingSystem)))
                                  .map(
                                    (provider) => SnsButtonWidget(
                                      provider: provider,
                                      onTap: _controller.onSnsButtonTap,
                                    ),
                                  )
                                  .toList()),
                        ),
                        const SizedBox(
                          height: 20,
                        )
                      ],
                    ),
                  ),
                ),
              ),
              if (_controller.pageLoading.value)
                const Opacity(
                  opacity: 0.8,
                  child: ModalBarrier(dismissible: false, color: Colors.white),
                ),
              if (_controller.pageLoading.value)
                const Center(
                  child: CircularProgressIndicator(),
                ),
            ],
          ),
        ),
      ),
    );
  }
}
