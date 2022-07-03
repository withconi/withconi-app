import 'package:flutter_svg/svg.dart';
import 'package:withconi/configs/constants/auth_variables.dart';
import 'package:withconi/configs/constants/enum.dart';
import 'package:withconi/controller/auth_controller.dart';
import 'package:withconi/controller/home/home_controller.dart';
import 'package:withconi/import_basic.dart';

class HomePage extends StatelessWidget {
  HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    HomeController _controller = Get.put(HomeController());

    double heightSection1 = (WcHeight / 7) * 2.7;
    double heightSection3 = (WcHeight / 7) * 3.2;
    double maxSection1Height = 285;

    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          firebaseAuth.signOut();
          AuthController.to.setUserState(firebaseAuth.currentUser);
        },
      ),
      body: SafeArea(
        top: true,
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                height: (heightSection1 > maxSection1Height)
                    ? maxSection1Height
                    : heightSection1,
                child: Stack(children: [
                  Container(
                      height: (heightSection1 > maxSection1Height)
                          ? maxSection1Height - 35
                          : heightSection1 - 35,
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
                      child: Column(
                        children: [
                          Padding(
                            padding: EdgeInsets.symmetric(
                                horizontal: 20, vertical: 15),
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
                          Expanded(
                            child: Container(
                              padding: EdgeInsets.symmetric(
                                  horizontal: 40, vertical: 8),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Obx(
                                            () => Text.rich(
                                              TextSpan(
                                                children: <TextSpan>[
                                                  TextSpan(
                                                      text: _controller
                                                          .selectedConimal
                                                          .value!
                                                          .name,
                                                      style:
                                                          GoogleFonts.notoSans(
                                                              fontSize: 23,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w900,
                                                              height: 1.3)),
                                                  TextSpan(
                                                      text: '와\n함께한지',
                                                      style:
                                                          GoogleFonts.notoSans(
                                                              fontSize: 22,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w200,
                                                              height: 1.4)),
                                                ],
                                              ),
                                            ),
                                          ),
                                          SizedBox(
                                            height: 12,
                                          ),
                                          Obx(
                                            () => Text.rich(
                                              TextSpan(
                                                children: <TextSpan>[
                                                  TextSpan(
                                                      text:
                                                          '+${_controller.daysAfterAdoption.value}',
                                                      style: GoogleFonts
                                                          .montserrat(
                                                              fontSize: 17,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w500,
                                                              height: 1.3)),
                                                  TextSpan(
                                                      text: '일째',
                                                      style:
                                                          GoogleFonts.notoSans(
                                                              fontSize: 16,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w200,
                                                              height: 1.3)),
                                                ],
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                      Obx(
                                        () => Image.asset(
                                          (_controller.selectedConimal.value!
                                                      .species ==
                                                  Species.cat)
                                              ? 'assets/icons/cat_black.png'
                                              : 'assets/icons/dog.png',
                                          height: 90,
                                        ),
                                      ),
                                    ],
                                  ),
                                  SizedBox(
                                    height: 33,
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      )),
                  Positioned(
                    bottom: 10,
                    right: 20,
                    child: Obx(
                      () => Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: _controller.conimalList
                            .map(
                              (element) => Row(
                                children: [
                                  ConimalToggleButton(
                                    backgroundColor: WcColors.grey60,
                                    index: _controller.conimalList
                                        .indexOf(element),
                                    selectedIndex:
                                        _controller.selectedConimalIndex.value,
                                    species: element.species,
                                    onTap: () {
                                      _controller.onSelectedConimalChanged(
                                          _controller.conimalList
                                              .indexOf(element));
                                    },
                                  ),
                                  (_controller.conimalList.last == element &&
                                          _controller.conimalList.length < 3)
                                      ? Row(
                                          children: [
                                            SizedBox(
                                              width: 10,
                                            ),
                                            CircularAddButton(
                                              onTap: () {
                                                Get.toNamed(Routes
                                                    .SIGNUP_CONIMAL_STEP1);
                                              },
                                            ),
                                          ],
                                        )
                                      : SizedBox(
                                          width: 10,
                                        )
                                ],
                              ),
                            )
                            .toList(),
                      ),
                    ),
                  )
                ]),
              ),

              // SizedBox(
              //             width: 11,
              //           ),
              //           Container(
              //             decoration: BoxDecoration(
              //                 shape: BoxShape.circle,
              //                 // borderRadius: BorderRadius.circular(100),
              //                 border: Border.all(
              //                     color: Colors.transparent, width: 3),
              //                 boxShadow: [
              //                   BoxShadow(
              //                       color: Color.fromARGB(58, 49, 49, 49),
              //                       blurRadius: 9,
              //                       spreadRadius: -3,
              //                       offset: Offset(-1, 3)),
              //                 ]),
              //             child: ClipOval(
              //               child: Material(
              //                 color: WcColors.green20, // Button color
              //                 child: InkWell(
              //                   splashColor: WcColors.grey100, // Splash color
              //                   onTap: () {},
              //                   child: SizedBox(
              //                       width: 40,
              //                       height: 40,
              //                       child: Padding(
              //                         padding: EdgeInsets.all(9),
              //                         child: Image.asset(
              //                           'assets/icons/dog.png',
              //                           fit: BoxFit.cover,
              //                         ),
              //                       )),
              //                 ),
              //               ),
              //             ),
              //           ),
              //           SizedBox(
              //             width: 11,
              //           ),
              //           CircularAddButton(),
              Container(
                width: WcWidth - 40,
                margin: EdgeInsets.fromLTRB(20, 7, 20, 3),
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
                        data: ThemeData().copyWith(
                          dividerColor: Colors.transparent,
                        ),
                        child: Obx(
                          () => ExpansionTile(
                              textColor: WcColors.black,
                              iconColor: WcColors.black,
                              tilePadding: EdgeInsets.symmetric(
                                  vertical: 0, horizontal: 16),
                              backgroundColor: Colors.transparent,
                              title: Text(
                                '${_controller.selectedConimal.value!.name}의 관리중인 질병',
                                style: GoogleFonts.notoSans(
                                    fontSize: 16, fontWeight: FontWeight.w500),
                              ),
                              children: _controller
                                  .selectedConimal.value!.diseases
                                  .map(
                                    (disease) => ListTile(
                                      title: Expanded(
                                        flex: 1,
                                        child: Text(
                                          disease.name,
                                          overflow: TextOverflow.ellipsis,
                                        ),
                                      ),
                                      trailing: SizedBox(
                                        width: 135,
                                        height: 25,
                                        child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.end,
                                            children: [
                                              InkWell(
                                                child: Container(
                                                  alignment: Alignment.center,
                                                  height: 25,
                                                  width: 60,
                                                  decoration: BoxDecoration(
                                                    color: WcColors.grey180,
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                      5,
                                                    ),
                                                  ),
                                                  child: Text(
                                                    '질병백과',
                                                    style: GoogleFonts.notoSans(
                                                        color: WcColors.white,
                                                        fontSize: 12),
                                                  ),
                                                ),
                                              ),
                                              SizedBox(
                                                width: 10,
                                              ),
                                              InkWell(
                                                child: Container(
                                                  alignment: Alignment.center,
                                                  height: 25,
                                                  width: 60,
                                                  decoration: BoxDecoration(
                                                    color: WcColors.grey180,
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                      5,
                                                    ),
                                                  ),
                                                  child: Text(
                                                    '커뮤니티',
                                                    style: GoogleFonts.notoSans(
                                                        color: WcColors.white,
                                                        fontSize: 12),
                                                  ),
                                                ),
                                              ),
                                            ]),
                                      ),
                                    ),
                                  )
                                  .toList()),
                        ),
                      ),
                      Theme(
                        data: ThemeData()
                            .copyWith(dividerColor: Colors.transparent),
                        child: Obx(
                          () => ExpansionTile(
                              textColor: WcColors.black,
                              iconColor: WcColors.black,
                              tilePadding: EdgeInsets.symmetric(
                                  vertical: 0, horizontal: 16),
                              backgroundColor: Colors.transparent,
                              title: Text(
                                '관리중인 질병 전체',
                                style: GoogleFonts.notoSans(
                                    fontSize: 16, fontWeight: FontWeight.w500),
                              ),
                              children: _controller.caredDiseasesList
                                  .map(
                                    (disease) => ListTile(
                                      title: SizedBox(
                                          width: 150,
                                          child: Text(
                                            disease.name,
                                            overflow: TextOverflow.ellipsis,
                                          )),
                                      trailing: SizedBox(
                                        width: 150,
                                        height: 25,
                                        child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.end,
                                            children: [
                                              InkWell(
                                                child: Container(
                                                  alignment: Alignment.center,
                                                  height: 25,
                                                  width: 60,
                                                  decoration: BoxDecoration(
                                                    color: WcColors.grey180,
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                      5,
                                                    ),
                                                  ),
                                                  child: Text(
                                                    '질병백과',
                                                    style: GoogleFonts.notoSans(
                                                        color: WcColors.white,
                                                        fontSize: 12),
                                                  ),
                                                ),
                                              ),
                                              SizedBox(
                                                width: 10,
                                              ),
                                              InkWell(
                                                child: Container(
                                                  alignment: Alignment.center,
                                                  height: 25,
                                                  width: 60,
                                                  decoration: BoxDecoration(
                                                    color: WcColors.grey180,
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                      5,
                                                    ),
                                                  ),
                                                  child: Text(
                                                    '커뮤니티',
                                                    style: GoogleFonts.notoSans(
                                                        color: WcColors.white,
                                                        fontSize: 12),
                                                  ),
                                                ),
                                              ),
                                            ]),
                                      ),
                                    ),
                                  )
                                  .toList()),
                        ),
                      )
                    ],
                  ),
                ),
              ),
              Container(
                width: WcWidth,
                height: heightSection3,
                // color: WcColors.blue100,
                padding: EdgeInsets.fromLTRB(20, 25, 20, 20),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Column(
                      children: [
                        SizedBox(
                          child: Row(
                            children: [
                              Expanded(
                                flex: 1,
                                child: Container(
                                  padding: EdgeInsets.all(20),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Image.asset(
                                        'assets/icons/diagnosis.png',
                                        height: 45,
                                      ),
                                      SizedBox(
                                        height: 13,
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
                                      borderRadius: BorderRadius.circular(10)),
                                ),
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              Expanded(
                                flex: 1,
                                child: Container(
                                  padding: EdgeInsets.all(20),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Image.asset(
                                        'assets/icons/dictionary.png',
                                        height: 45,
                                      ),
                                      SizedBox(
                                        height: 13,
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
                                      borderRadius: BorderRadius.circular(10)),
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Row(
                          children: [
                            Expanded(
                              flex: 1,
                              child: Container(
                                padding: EdgeInsets.all(20),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Image.asset(
                                      'assets/icons/location.png',
                                      height: 45,
                                    ),
                                    SizedBox(
                                      height: 13,
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
                                    borderRadius: BorderRadius.circular(10)),
                              ),
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Expanded(
                              flex: 1,
                              child: Container(
                                padding: EdgeInsets.all(20),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Image.asset(
                                      'assets/icons/community.png',
                                      height: 45,
                                    ),
                                    SizedBox(
                                      height: 13,
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
                                    borderRadius: BorderRadius.circular(10)),
                              ),
                            ),
                          ],
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class ConimalToggleButton extends StatelessWidget {
  ConimalToggleButton({
    Key? key,
    required this.onTap,
    required this.backgroundColor,
    required this.species,
    required this.index,
    required this.selectedIndex,
  }) : super(key: key);

  void Function() onTap;
  Color backgroundColor;
  Species species;
  int index;
  int selectedIndex;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          shape: BoxShape.circle,
          border: Border.all(
              color: (index == selectedIndex)
                  ? WcColors.white
                  : Colors.transparent,
              width: 3),
          boxShadow: [
            BoxShadow(
                color: Color.fromARGB(58, 49, 49, 49),
                blurRadius: 10,
                spreadRadius: -2,
                offset: Offset(-1, 3)),
          ]),
      child: ClipOval(
        child: Material(
          color: (species == Species.cat)
              ? WcColors.grey110
              : WcColors.green20, // Button color
          child: InkWell(
            splashColor: WcColors.grey100, // Splash color
            onTap: onTap,
            child: SizedBox(
                width: (index == selectedIndex) ? 45 : 40,
                height: (index == selectedIndex) ? 45 : 40,
                child: Padding(
                  padding: EdgeInsets.all(8),
                  child: Image.asset(
                    (species == Species.cat)
                        ? 'assets/icons/cat_black.png'
                        : 'assets/icons/dog.png',
                    fit: BoxFit.cover,
                  ),
                )),
          ),
        ),
      ),
    );
  }
}

class CircularAddButton extends StatelessWidget {
  CircularAddButton({
    Key? key,
    this.onTap,
  }) : super(key: key);

  void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          shape: BoxShape.circle,
          border: Border.all(color: Colors.transparent, width: 3),
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
            onTap: onTap,
            child: SvgPicture.asset(
              'assets/icons/add.svg',
              fit: BoxFit.cover,
              height: 40,
            ),
          ),
        ),
      ),
    );
  }
}
