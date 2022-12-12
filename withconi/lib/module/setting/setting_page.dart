import 'package:withconi/module/setting/setting_controller.dart';
import 'package:withconi/import_basic.dart';
import 'package:withconi/global_widgets/appbar/appbar.dart';
import 'package:withconi/module/theme/text_theme.dart';
import '../../global_widgets/button/tile_button.dart';

class SettingPage extends StatelessWidget {
  const SettingPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final SettingPageController _controller = Get.find();
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
                        style: TextStyle(
                            fontFamily: WcFontFamily.notoSans,
                            fontWeight: FontWeight.w600,
                            fontSize: 22)),
                  ),
                  WcTileButton(
                    text: '내 정보 수정',
                    onTap: _controller.goToManageUserInfoPage,
                  ),
                  WcTileButton(
                    text: '내 코니멀 관리',
                    onTap: _controller.goToManageConimalPage,
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
                        style: TextStyle(
                            fontFamily: WcFontFamily.notoSans,
                            fontWeight: FontWeight.w600,
                            fontSize: 22)),
                  ),
                  WcTileButton(
                    text: '내가 쓴 글',
                    onTap: _controller.goToMyPostPage,
                  ),
                  WcTileButton(
                    text: '내가 좋아한 글',
                    onTap: _controller.goToMyLikedPostsPage,
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
                        style: TextStyle(
                            fontFamily: WcFontFamily.notoSans,
                            fontWeight: FontWeight.w600,
                            fontSize: 22)),
                  ),
                  WcTileButton(
                    onTap: _controller.goToRequestPage,
                    text: '건의하기',
                  ),
                  WcTileButton(
                    text: '개발자 정보  ⛅️',
                    onTap: _controller.goToDeveloperInfoPage,
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
