import 'package:withconi/controller/setting/setting_controller.dart';
import 'package:withconi/import_basic.dart';
import 'package:withconi/module/widgets/appbar/appbar.dart';
import '../../widgets/button/tile_button.dart';

class SettingPage extends StatelessWidget {
  SettingPage({Key? key}) : super(key: key);
  SettingPageController _controller = Get.put(SettingPageController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: WcAppBar(
        title: '사용자 설정',
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
                    height: 10,
                  ),
                  Container(
                    alignment: Alignment.centerLeft,
                    height: 55,
                    width: WcWidth - 40,
                    child: Text('내 정보',
                        style: GoogleFonts.notoSans(
                            fontWeight: FontWeight.w600, fontSize: 22)),
                  ),
                  WcTileButton(
                    text: '내 정보 수정',
                    onTap: _controller.manageUserInfo,
                  ),
                  WcTileButton(
                    text: '내 코니멀 관리',
                    onTap: _controller.manageConimals,
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
                  Container(
                    alignment: Alignment.centerLeft,
                    height: 55,
                    width: WcWidth - 40,
                    child: Text('커뮤니티',
                        style: GoogleFonts.notoSans(
                            fontWeight: FontWeight.w600, fontSize: 22)),
                  ),
                  WcTileButton(
                    text: '내가 쓴 글',
                    onTap: _controller.myPostPage,
                  ),
                  WcTileButton(
                    text: '내가 좋아한 글',
                    onTap: _controller.myLikedPosts,
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
                  Container(
                    alignment: Alignment.centerLeft,
                    height: 55,
                    width: WcWidth - 40,
                    child: Text('앱',
                        style: GoogleFonts.notoSans(
                            fontWeight: FontWeight.w600, fontSize: 22)),
                  ),
                  WcTileButton(
                    text: '문의하기',
                  ),
                  WcTileButton(text: '개발자 정보  ⛅️')
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
