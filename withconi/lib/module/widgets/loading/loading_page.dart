import 'package:flutter/src/foundation/diagnostics.dart';
import 'package:lottie/lottie.dart';

import '../../../import_basic.dart';

class LoadingPage extends StatelessWidget {
  const LoadingPage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: WcColors.white,
      height: WcHeight - 150,
      child: SizedBox(
        height: WcHeight - 100,
        child: OverflowBox(
          minHeight: 140,
          maxHeight: 140,
          child: Lottie.asset('assets/json/loading.json'),
        ),
      ),
    );
  }
}
