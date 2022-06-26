import 'package:lottie/lottie.dart';

import '../../../import_basic.dart';

class WcLoadingButtonWidget extends StatelessWidget {
  WcLoadingButtonWidget({
    Key? key,
    this.inactiveButtonColor = WcColors.grey80,
    this.buttonHeight = 50,
  }) : super(key: key);

  double buttonHeight;

  Color inactiveButtonColor;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 120,
      width: WcWidth - 40,
      child: Stack(
        alignment: AlignmentDirectional.center,
        children: [
          Container(
            height: 50,
            width: WcWidth - 40,
            decoration: BoxDecoration(
                color: inactiveButtonColor,
                borderRadius: BorderRadius.circular(10)),
          ),
          Positioned(
            child: SizedBox(
              child: LottieBuilder.asset(
                'assets/json/loading.json',
                height: 115,
              ),
            ),
          )
        ],
      ),
    );
  }
}
