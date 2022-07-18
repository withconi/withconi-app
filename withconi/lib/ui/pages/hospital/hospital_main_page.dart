import 'package:withconi/import_basic.dart';

import '../../../controller/nav_controller.dart';

import '../../widgets/navbar/bottom_navbar.dart';

class HospitalMainPage extends StatelessWidget {
  const HospitalMainPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => false,
      child: Scaffold(
        bottomNavigationBar: Obx(
          () => WcBottomNavBar(
            navIndex: NavController.to.navBarIndex.value,
            onTap: (index) {
              NavController.to.onNavChanged(navIndex: index);
            },
          ),
        ),
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
                      child: Text('병원/약국찾기',
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
