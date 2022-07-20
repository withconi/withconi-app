import 'package:flutter_svg/svg.dart';
import 'package:lottie/lottie.dart';
import 'package:withconi/controller/community/community_main_controller.dart';
import 'package:withconi/controller/signup/disease_search_controller.dart';
import 'package:withconi/import_basic.dart';
import 'package:withconi/ui/pages/signup/signup_widgets/disease_selection_list_button.dart';
import '../../../controller/nav_controller.dart';
import '../../widgets/button/wide_button.dart';
import '../../widgets/navbar/bottom_navbar.dart';

class CommunityMainPage extends StatelessWidget {
  const CommunityMainPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    CommunityMainController _controller = Get.find();

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
                      child: Text('커뮤니티',
                          style: GoogleFonts.notoSans(
                              fontWeight: FontWeight.w600, fontSize: 24)),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Container(
                      height: 45,
                      width: WcWidth - 40,
                      decoration: BoxDecoration(
                        color: WcColors.white,
                        boxShadow: [
                          BoxShadow(
                            color: Color.fromARGB(28, 0, 0, 0),
                            spreadRadius: -2,
                            blurRadius: 7,
                            offset: const Offset(0, 1),
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
                            onChanged: (index) {},
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
                      height: 35,
                    ),
                    SizedBox(
                      width: WcWidth - 40,
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text('인기 게시판',
                              style: GoogleFonts.notoSans(
                                  fontWeight: FontWeight.w600, fontSize: 20)),
                          SizedBox(
                            width: 8,
                          ),
                          SvgPicture.asset(
                            'assets/icons/hot.svg',
                            height: 21,
                          )
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Obx(
                      () => Column(
                        children: _controller.boardList
                            .map((board) => InkWell(
                                  onTap: () {
                                    _controller.toBoard(
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
                                      style: GoogleFonts.notoSans(fontSize: 15),
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
                    SizedBox(
                      height: 10,
                    ),
                    Obx(
                      () => Column(
                        children: _controller.boardList
                            .map((board) => InkWell(
                                  onTap: () {
                                    _controller.toBoard(
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
                                      style: GoogleFonts.notoSans(fontSize: 15),
                                    ),
                                  ),
                                ))
                            .toList(),
                      ),
                    ),
                    SizedBox(
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
