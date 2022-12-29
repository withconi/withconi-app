import 'package:withconi/module/community/controllers/community_setting_controller.dart';
import 'package:withconi/module/setting/setting_controller.dart';
import 'package:withconi/import_basic.dart';
import 'package:withconi/global_widgets/appbar/appbar.dart';
import '../../../global_widgets/button/tile_button.dart';

class CommunitySettingPage extends StatelessWidget {
  const CommunitySettingPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    CommunitySettingPageController _controller = Get.find();

    return Scaffold(
      appBar: WcAppBar(
        title: '커뮤니티 설정',
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
                    height: 20,
                  ),
                  // Container(
                  //   alignment: Alignment.centerLeft,
                  //   height: 55,
                  //   width: WcWidth - 40,
                  //   child: Text('내 정보',
                  //       style: GoogleFonts.notoSans(
                  //           fontWeight: FontWeight.w600, fontSize: 22)),
                  // ),
                  WcTileButton(
                    text: '내 정보 / 닉네임 수정',
                    onTap: _controller.goToEditUserInfoPage,
                  ),

                  WcTileButton(
                    text: '내가 쓴 글',
                    onTap: _controller.goToMyPostPage,
                  ),
                  WcTileButton(
                    text: '내가 좋아한 글',
                    onTap: _controller.goToLikedPostPage,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Container(
                    height: 18,
                    color: WcColors.grey40,
                    width: WcWidth,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  // Container(
                  //   alignment: Alignment.centerLeft,
                  //   height: 55,
                  //   width: WcWidth - 40,
                  //   child: Text('앱 관련',
                  //       style: GoogleFonts.notoSans(
                  //           fontWeight: FontWeight.w600, fontSize: 22)),
                  // ),
                  // WcTileButton(
                  //   text: '문의하기',
                  // ),
                  // WcTileButton(text: '개발자 정보  ⛅️')
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
