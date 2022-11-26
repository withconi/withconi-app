import 'package:flutter/src/foundation/diagnostics.dart';
import 'package:lottie/lottie.dart';

import '../../import_basic.dart';

class LoadingPage extends StatelessWidget {
  LoadingPage({
    Key? key,
    this.height,
  }) : super(key: key);
  double? height;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: WcColors.white,
      height: height ?? WcHeight - 150,
      child: SizedBox(
        height: WcHeight - 100,
        child: OverflowBox(
          minHeight: 130,
          maxHeight: 130,
          child: Lottie.asset('assets/json/loading.json'),
        ),
      ),
    );
  }
}
