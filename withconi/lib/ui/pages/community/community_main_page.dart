import 'package:flutter_svg/svg.dart';
import 'package:withconi/controller/community/community_main_controller.dart';
import 'package:withconi/import_basic.dart';
import 'package:withconi/ui/pages/community/community_setting_page.dart';
import '../../widgets/button/icon_button.dart';

class CommunityMainPage extends StatelessWidget {
  const CommunityMainPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    CommunityMainController _controller = Get.put(CommunityMainController());

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
                      height: 20,
                    ),
                    SizedBox(
                      width: WcWidth - 40,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text('커뮤니티',
                              style: GoogleFonts.notoSans(
                                  fontWeight: FontWeight.w600, fontSize: 25)),
                          WcIconButton(
                              iconHeight: 23,
                              active: true,
                              onTap: _controller.toSettingPage,
                              iconSrc: 'assets/icons/settings.svg',
                              activeIconColor: WcColors.grey160,
                              inactiveIconColor: WcColors.grey160)
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Container(
                      height: 45,
                      width: WcWidth - 40,
                      decoration: BoxDecoration(
                        color: WcColors.white,
                        boxShadow: const [
                          BoxShadow(
                            color: Color.fromARGB(35, 0, 0, 0),
                            spreadRadius: -2,
                            blurRadius: 8,
                            offset: Offset(0, 1),
                          ),
                        ],
                        borderRadius: BorderRadius.circular(30),
                      ),
                      child: Row(
                        children: [
                          GestureDetector(
                            onTap: () {},
                            child: Padding(
                              padding:
                                  const EdgeInsets.only(left: 13, right: 12),
                              child: SvgPicture.asset(
                                'assets/icons/search.svg',
                                color: WcColors.grey100,
                              ),
                            ),
                          ),
                          Expanded(
                              child: TextField(
                            controller: null,
                            onChanged: (text) {},
                            style: GoogleFonts.notoSans(
                                color: WcColors.black,
                                fontSize: 16,
                                fontWeight: FontWeight.w500),
                            decoration: InputDecoration(
                              hintText: '게시판을 검색해보세요',
                              hintStyle: GoogleFonts.notoSans(
                                  color: WcColors.grey100,
                                  fontSize: 16,
                                  fontWeight: FontWeight.w400),
                              border: InputBorder.none,
                            ),
                          )),
                          Container(
                            height: 45,
                            width: 1.2,
                            color: WcColors.grey80,
                          ),
                          GestureDetector(
                            onTap: () {},
                            child: Padding(
                              padding:
                                  const EdgeInsets.only(left: 12, right: 14),
                              child: SvgPicture.asset(
                                'assets/icons/cancle.svg',
                                color: WcColors.grey100,
                                height: 16,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 40,
                    ),
                    SizedBox(
                      width: WcWidth - 40,
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text('인기 게시판',
                              style: GoogleFonts.notoSans(
                                  fontWeight: FontWeight.w600, fontSize: 20)),
                          const SizedBox(
                            width: 8,
                          ),
                          SvgPicture.asset(
                            'assets/icons/hot.svg',
                            height: 21,
                          )
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Obx(
                      () => Column(
                        children: _controller.boardList
                            .map((board) => InkWell(
                                  onTap: () {
                                    _controller.toBoardDetailPage(
                                        boardId: board.boardId.toString());
                                  },
                                  child: Container(
                                    alignment: Alignment.centerLeft,
                                    height: 50,
                                    width: WcWidth,
                                    padding:
                                        EdgeInsets.symmetric(horizontal: 30),
                                    child: Text(
                                      board.title,
                                      style: GoogleFonts.notoSans(fontSize: 16),
                                    ),
                                  ),
                                ))
                            .toList(),
                      ),
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    SizedBox(
                      width: WcWidth - 40,
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text('전체 게시판',
                              style: GoogleFonts.notoSans(
                                  fontWeight: FontWeight.w600, fontSize: 20)),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Obx(
                      () => Column(
                        children: _controller.boardList
                            .map((board) => InkWell(
                                  onTap: () {
                                    _controller.toBoardDetailPage(
                                        boardId: board.boardId.toString());
                                  },
                                  child: Container(
                                    alignment: Alignment.centerLeft,
                                    height: 50,
                                    width: WcWidth,
                                    padding:
                                        EdgeInsets.symmetric(horizontal: 30),
                                    child: Text(
                                      board.title,
                                      style: GoogleFonts.notoSans(fontSize: 16),
                                    ),
                                  ),
                                ))
                            .toList(),
                      ),
                    ),
                    const SizedBox(
                      height: 30,
                    )
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
