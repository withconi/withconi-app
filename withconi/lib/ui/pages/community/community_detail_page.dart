import 'package:flutter_svg/svg.dart';
import 'package:lottie/lottie.dart';
import 'package:withconi/controller/community/community_main_controller.dart';
import 'package:withconi/controller/signup/disease_search_controller.dart';
import 'package:withconi/import_basic.dart';
import 'package:withconi/ui/pages/signup/signup_widgets/disease_selection_list_button.dart';
import '../../widgets/button/wide_button.dart';

class CommunityDetailPage extends StatelessWidget {
  CommunityDetailPage({Key? key}) : super(key: key);

  List<String> postUser = [
    'a',
    'b',
    'c',
    'd',
    'e',
    'f',
    'g',
    'H',
    'I',
    'b',
    // 'a',
    // 'b',
    // 'a',
    // 'b'
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      persistentFooterButtons: [
        Container(
          padding: EdgeInsets.symmetric(horizontal: 10),
          height: 53,
          width: WcWidth,
          child: Row(
            children: [
              CircleAvatar(
                radius: 22,
              ),
              SizedBox(
                width: 15,
              ),
              Text(
                '새로운 글을 남겨보세요',
                style:
                    GoogleFonts.notoSans(fontSize: 16, color: WcColors.grey120),
              )
            ],
          ),
        )
      ],
      appBar: AppBar(
          scrolledUnderElevation: 5,
          // surfaceTintColor: WcColors.blue80,
          shadowColor: Colors.black12,
          elevation: 0,
          foregroundColor: WcColors.grey200,
          backgroundColor: WcColors.white,
          title: Text(
            '커뮤니티',
            style:
                GoogleFonts.notoSans(fontSize: 15, fontWeight: FontWeight.w600),
          ),
          actions: [
            Container(
                height: 20,
                alignment: Alignment.centerRight,
                padding: EdgeInsets.only(left: 20, right: 20),
                child: SvgPicture.asset(
                  'assets/icons/search.svg',
                  color: WcColors.grey200,
                ))
          ],
          leading: Container(
              alignment: Alignment.centerRight,
              padding:
                  EdgeInsets.only(left: 20, right: 20, bottom: 10, top: 10),
              child: SvgPicture.asset(
                'assets/icons/arrow_back.svg',
                color: WcColors.grey200,
              ))

          // Padding(
          //     padding: EdgeInsets.symmetric(horizontal: 20, vertical: 0),
          //     child: SvgPicture.asset('assets/icons/arrow_back.svg')),
          ),
      backgroundColor: WcColors.white,
      body: SingleChildScrollView(
        child: SafeArea(
          bottom: false,
          child: Column(
            children: [
              Container(
                width: WcWidth,
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
                child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        '갑상선 기능 항진증\n게시판',
                        style: GoogleFonts.notoSans(
                            color: WcColors.black,
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                            height: 1.4),
                      ),
                      GestureDetector(
                        child: Container(
                            alignment: Alignment.topLeft,
                            // color: WcColors.blue100,
                            height: 40,
                            width: 40,
                            child: Padding(
                              padding: EdgeInsets.only(left: 5, top: 6),
                              child: SvgPicture.asset(
                                'assets/icons/info.svg',
                              ),
                            )),
                      )
                    ]),
              ),
              Column(
                children: postUser
                    .map((e) => Container(
                          decoration: BoxDecoration(
                              // color: WcColors.grey100,
                              border: Border(
                                  bottom: BorderSide(
                                      width: 1, color: WcColors.grey80))),
                          height: 208,
                          width: WcWidth,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              SizedBox(
                                width: WcWidth - 40,
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    CircleAvatar(
                                      radius: 18,
                                    ),
                                    SizedBox(
                                      width: 10,
                                    ),
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Container(
                                          alignment: Alignment.topLeft,
                                          height: 33,
                                          child: Row(
                                            children: [
                                              Text('먼지 * 1시간 전'),
                                              Container(
                                                alignment: Alignment.center,
                                                margin:
                                                    EdgeInsets.only(left: 8),
                                                height: 22,
                                                width: 50,
                                                decoration: BoxDecoration(
                                                    color: WcColors.blue40,
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            5)),
                                                child: Text(
                                                  '고양이',
                                                  style: GoogleFonts.notoSans(
                                                      color: WcColors.blue100,
                                                      fontSize: 12,
                                                      fontWeight:
                                                          FontWeight.w600),
                                                ),
                                              )
                                            ],
                                          ),
                                        ),
                                        SizedBox(
                                          width: WcWidth - 100,
                                          child: Text(
                                            '한국어로 합니다 어ㅓㅉ구 한국어로 합니다 어ㅓㅉ구 한국어로 합니다 어ㅓㅉ구 한국어로 합니다 어ㅓㅉ구 한국어로 합니다 어ㅓㅉ구 한국어로 합니다 어ㅓㅉ구 ',
                                            overflow: TextOverflow.fade,
                                            style: GoogleFonts.notoSans(
                                                fontSize: 14,
                                                fontWeight: FontWeight.w500,
                                                height: 1.5),
                                          ),
                                        ),
                                        SizedBox(
                                          height: 38,
                                          child: Row(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.end,
                                            children: [
                                              Row(
                                                children: [
                                                  SvgPicture.asset(
                                                    'assets/icons/heart.svg',
                                                    height: 20,
                                                  ),
                                                  SizedBox(
                                                    width: 5,
                                                  ),
                                                  Text(
                                                    '34',
                                                    style:
                                                        GoogleFonts.montserrat(
                                                            fontSize: 14),
                                                  ),
                                                ],
                                              ),
                                              SizedBox(
                                                width: 25,
                                              ),
                                              Row(
                                                children: [
                                                  SvgPicture.asset(
                                                    'assets/icons/comment.svg',
                                                    height: 20,
                                                  ),
                                                  SizedBox(
                                                    width: 5,
                                                  ),
                                                  Text(
                                                    '34',
                                                    style:
                                                        GoogleFonts.montserrat(
                                                            fontSize: 14),
                                                  ),
                                                ],
                                              )
                                            ],
                                          ),
                                        )
                                      ],
                                    )
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ))
                    .toList(),
              )
            ],
          ),
        ),
      ),
    );
  }
}
