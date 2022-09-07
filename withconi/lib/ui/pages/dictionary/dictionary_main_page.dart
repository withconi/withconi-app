import 'package:withconi/import_basic.dart';

import '../../../controller/navigation_controller.dart';

import '../../widgets/navbar/bottom_navbar.dart';

class DictionaryMainPage extends StatelessWidget {
  const DictionaryMainPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => false,
      child: Scaffold(
        backgroundColor: WcColors.white,
        body: SingleChildScrollView(
          child: SafeArea(
            bottom: false,
            child: Center(
              child: SizedBox(
                width: WcWidth,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const SizedBox(
                      height: 35,
                    ),
                    SizedBox(
                      width: WcWidth - 40,
                      child: Text('질병백과',
                          style: GoogleFonts.notoSans(
                              fontWeight: FontWeight.w600, fontSize: 24)),
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
