import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import 'package:withconi/module/start/start_controller.dart';
import '../../module/theme/colors.dart';
import '../../module/theme/sizes.dart';

class WcStateButtonWidget extends StatelessWidget {
  WcStateButtonWidget(
      {Key? key,
      required this.buttonText,
      required this.onTap,
      required this.buttonState,
      this.inactiveButtonColor = WcColors.grey80,
      required this.activeButtonColor,
      required this.buttonWidth,
      this.buttonHeight = 50,
      required this.activeTextColor,
      this.inactiveTextColor = WcColors.grey120})
      : super(key: key);
  String buttonText;
  double buttonHeight;
  double buttonWidth;
  Color inactiveButtonColor;
  Color activeButtonColor;
  Color inactiveTextColor;
  Color activeTextColor;
  ButtonState buttonState;
  void Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50,
      width: WcWidth - 40,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(10),
        child: Material(
          child: Ink(
            height: 50,
            width: WcWidth - 40,
            decoration: BoxDecoration(
                color: (buttonState == ButtonState.success)
                    ? activeButtonColor
                    : inactiveButtonColor),
            child: InkWell(
              onTap: (buttonState == ButtonState.success) ? onTap : () {},
              child: Center(
                  child: (buttonState == ButtonState.loading)
                      ? SizedBox(
                          child: OverflowBox(
                            minHeight: 110,
                            maxHeight: 110,
                            child: Lottie.asset('assets/json/loading.json'),
                          ),
                        )
                      : Text(
                          buttonText,
                          style: GoogleFonts.notoSans(
                              color: (buttonState == ButtonState.success)
                                  ? activeTextColor
                                  : inactiveTextColor,
                              fontSize: 15,
                              fontWeight: FontWeight.w500),
                        )),
            ),
          ),
        ),
      ),
    );
  }
}
