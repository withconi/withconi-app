import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_svg/svg.dart';
import 'package:withconi/import_basic.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Stack(children: [
                SizedBox(
                  height: 255,
                ),
                Container(
                    height: 220,
                    width: WcWidth,
                    decoration: BoxDecoration(
                        color: WcColors.white,
                        borderRadius: BorderRadius.vertical(
                          bottom: Radius.circular(23),
                        ),
                        boxShadow: [
                          BoxShadow(
                              color: Color.fromARGB(79, 124, 124, 124),
                              blurRadius: 15,
                              spreadRadius: -6,
                              offset: Offset(2, 2)),
                        ]),
                    child: Column(children: [
                      Padding(
                        padding:
                            EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Image.asset(
                              'assets/icons/withconi.png',
                              width: 37,
                            ),
                            SvgPicture.asset(
                              'assets/icons/user.svg',
                              width: 24,
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding:
                            EdgeInsets.symmetric(horizontal: 40, vertical: 8),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text.rich(
                                  TextSpan(
                                    children: <TextSpan>[
                                      TextSpan(
                                          text: '먼지',
                                          style: GoogleFonts.notoSans(
                                              fontSize: 22,
                                              fontWeight: FontWeight.w900,
                                              height: 1.3)),
                                      TextSpan(
                                          text: '와\n함께한지',
                                          style: GoogleFonts.notoSans(
                                              fontSize: 21,
                                              fontWeight: FontWeight.w200,
                                              height: 1.4)),
                                    ],
                                  ),
                                ),
                                SizedBox(
                                  height: 12,
                                ),
                                Text.rich(
                                  TextSpan(
                                    children: <TextSpan>[
                                      TextSpan(
                                          text: '+1635',
                                          style: GoogleFonts.montserrat(
                                              fontSize: 17,
                                              fontWeight: FontWeight.w500,
                                              height: 1.3)),
                                      TextSpan(
                                          text: '일째',
                                          style: GoogleFonts.notoSans(
                                              fontSize: 16,
                                              fontWeight: FontWeight.w200,
                                              height: 1.3)),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                            Image.asset(
                              'assets/icons/cat_black.png',
                              height: 88,
                            )
                          ],
                        ),
                      )
                    ])),
                Positioned(
                  bottom: 13,
                  right: 20,
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            // borderRadius: BorderRadius.circular(100),
                            border: Border.all(color: WcColors.white, width: 3),
                            boxShadow: [
                              BoxShadow(
                                  color: Color.fromARGB(89, 49, 49, 49),
                                  blurRadius: 9,
                                  spreadRadius: -3,
                                  offset: Offset(-1, 3)),
                            ]),
                        child: ClipOval(
                          child: Material(
                            color: WcColors.grey80, // Button color
                            child: InkWell(
                              splashColor: WcColors.grey100, // Splash color
                              onTap: () {},
                              child: SizedBox(
                                  width: 45,
                                  height: 45,
                                  child: Padding(
                                    padding: EdgeInsets.all(8),
                                    child: Image.asset(
                                      'assets/icons/cat_black.png',
                                      fit: BoxFit.cover,
                                    ),
                                  )),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 11,
                      ),
                      Container(
                        decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            // borderRadius: BorderRadius.circular(100),
                            border:
                                Border.all(color: Colors.transparent, width: 3),
                            boxShadow: [
                              BoxShadow(
                                  color: Color.fromARGB(74, 49, 49, 49),
                                  blurRadius: 7,
                                  spreadRadius: -5,
                                  offset: Offset(0, 2)),
                            ]),
                        child: ClipOval(
                          child: Material(
                            color: WcColors.green20, // Button color
                            child: InkWell(
                              splashColor: WcColors.grey100, // Splash color
                              onTap: () {},
                              child: SizedBox(
                                  width: 40,
                                  height: 40,
                                  child: Padding(
                                    padding: EdgeInsets.all(9),
                                    child: Image.asset(
                                      'assets/icons/dog.png',
                                      fit: BoxFit.cover,
                                    ),
                                  )),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 11,
                      ),
                      Container(
                        decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            border:
                                Border.all(color: Colors.transparent, width: 3),
                            boxShadow: [
                              BoxShadow(
                                  color: Color.fromARGB(54, 49, 49, 49),
                                  blurRadius: 7,
                                  spreadRadius: -5,
                                  offset: Offset(0, 2)),
                            ]),
                        child: ClipOval(
                          child: Material(
                            color: WcColors.white, // Button color
                            child: InkWell(
                              splashColor: WcColors.grey100, // Splash color
                              onTap: () {},
                              child: SvgPicture.asset(
                                'assets/icons/add.svg',
                                fit: BoxFit.cover,
                                height: 40,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                )
              ]),
              SizedBox(
                width: WcWidth,
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  child: Column(
                    children: [
                      Container(
                        decoration: BoxDecoration(
                            color: WcColors.white,
                            borderRadius: BorderRadius.circular(10),
                            boxShadow: [
                              BoxShadow(
                                  color: Color.fromARGB(34, 124, 124, 124),
                                  blurRadius: 18,
                                  spreadRadius: -3,
                                  offset: Offset(0, 0)),
                            ]),
                        child: ListTileTheme(
                          dense: true,
                          child: ListView(
                            padding: EdgeInsets.all(0),
                            shrinkWrap: true,
                            children: <Widget>[
                              Theme(
                                data: ThemeData()
                                    .copyWith(dividerColor: Colors.transparent),
                                child: ExpansionTile(
                                  tilePadding: EdgeInsets.symmetric(
                                      vertical: 0, horizontal: 16),
                                  backgroundColor: Colors.transparent,
                                  title: Text(
                                    '먼지가 관리중인 질병',
                                    style: GoogleFonts.notoSans(
                                        fontSize: 16,
                                        fontWeight: FontWeight.w500),
                                  ),
                                  children: <Widget>[
                                    ListTile(title: Text('Title of the item')),
                                    ListTile(
                                      title: Text('Title of the item2'),
                                    )
                                  ],
                                ),
                              ),
                              Theme(
                                data: ThemeData()
                                    .copyWith(dividerColor: Colors.transparent),
                                child: ExpansionTile(
                                  tilePadding: EdgeInsets.symmetric(
                                      vertical: 0, horizontal: 16),
                                  backgroundColor: Colors.transparent,
                                  title: Text(
                                    '관리중인 질병 전체',
                                    style: GoogleFonts.notoSans(
                                        fontSize: 16,
                                        fontWeight: FontWeight.w500),
                                  ),
                                  children: <Widget>[
                                    ListTile(title: Text('Title of the item')),
                                    ListTile(
                                      title: Text('Title of the item2'),
                                    )
                                  ],
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 25,
                      ),
                      Column(
                        children: [
                          SizedBox(
                            height: 115,
                            width: WcWidth,
                            child: Row(
                              children: [
                                Expanded(
                                  flex: 1,
                                  child: Container(
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Image.asset(
                                          'assets/icons/diagnosis.png',
                                          height: 50,
                                        ),
                                        SizedBox(
                                          height: 15,
                                        ),
                                        Text(
                                          '자가진단',
                                          style: GoogleFonts.notoSans(
                                              fontSize: 16,
                                              fontWeight: FontWeight.w600),
                                        )
                                      ],
                                    ),
                                    decoration: BoxDecoration(
                                        color: WcColors.blue60,
                                        borderRadius:
                                            BorderRadius.circular(10)),
                                  ),
                                ),
                                SizedBox(
                                  width: 10,
                                ),
                                Expanded(
                                  flex: 1,
                                  child: Container(
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Image.asset(
                                          'assets/icons/dictionary.png',
                                          height: 50,
                                        ),
                                        SizedBox(
                                          height: 15,
                                        ),
                                        Text(
                                          '질병백과',
                                          style: GoogleFonts.notoSans(
                                              fontSize: 16,
                                              fontWeight: FontWeight.w600),
                                        )
                                      ],
                                    ),
                                    decoration: BoxDecoration(
                                        color: WcColors.blue60,
                                        borderRadius:
                                            BorderRadius.circular(10)),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          SizedBox(
                            height: 120,
                            width: WcWidth,
                            child: Row(
                              children: [
                                Expanded(
                                  flex: 1,
                                  child: Container(
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Image.asset(
                                          'assets/icons/location.png',
                                          height: 50,
                                        ),
                                        SizedBox(
                                          height: 15,
                                        ),
                                        Text(
                                          '병원/약국찾기',
                                          style: GoogleFonts.notoSans(
                                              fontSize: 16,
                                              fontWeight: FontWeight.w600),
                                        )
                                      ],
                                    ),
                                    decoration: BoxDecoration(
                                        color: WcColors.blue60,
                                        borderRadius:
                                            BorderRadius.circular(10)),
                                  ),
                                ),
                                SizedBox(
                                  width: 10,
                                ),
                                Expanded(
                                  flex: 1,
                                  child: Container(
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Image.asset(
                                          'assets/icons/community.png',
                                          height: 50,
                                        ),
                                        SizedBox(
                                          height: 15,
                                        ),
                                        Text(
                                          '커뮤니티',
                                          style: GoogleFonts.notoSans(
                                              fontSize: 16,
                                              fontWeight: FontWeight.w600),
                                        )
                                      ],
                                    ),
                                    decoration: BoxDecoration(
                                        color: WcColors.blue60,
                                        borderRadius:
                                            BorderRadius.circular(10)),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
