import 'package:lottie/lottie.dart';

import '../../../import_basic.dart';
import '../loading/loading_page.dart';

class LoadingScaffold extends StatelessWidget {
  LoadingScaffold(
      {Key? key,
      required this.body,
      required this.isLoading,
      this.appBar,
      this.backgroundColor = WcColors.white,
      this.persistentFooterButtons})
      : super(key: key);
  Widget? body;
  bool isLoading;
  PreferredSizeWidget? appBar;
  Color? backgroundColor;
  List<Widget>? persistentFooterButtons;

  @override
  Widget build(BuildContext context) {
    if ((isLoading)) {
      return const LoadingPage();
    } else {
      return Scaffold(
        persistentFooterButtons: (isLoading) ? null : persistentFooterButtons,
        backgroundColor: backgroundColor,
        appBar: (isLoading) ? null : appBar,
        body: (isLoading) ? null : body,
      );
    }
  }
}
