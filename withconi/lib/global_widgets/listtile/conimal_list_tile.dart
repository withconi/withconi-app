import 'dart:ui';

import 'package:flutter_svg/svg.dart';
import 'package:withconi/module/theme/text_theme.dart';
import 'package:withconi/module/ui_model/conimal_ui_model.dart';

import '../../core/tools/helpers/calculator.dart';
import '../../data/enums/enum.dart';
import '../../../import_basic.dart';

class WcConimalListTile extends StatelessWidget {
  WcConimalListTile({
    Key? key,
    // required this.name,
    // required this.age,
    required this.conimal,
    // required this.species,
    // required this.diseaseNum,
    // required this.diseaseName,
  }) : super(key: key);
  // Species species;
  // String name;

  // String diseaseName;
  // int diseaseNum;
  ConimalUIModel conimal;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: EdgeInsets.fromLTRB(20, 0, 0, 0),
          height: 77,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              SizedBox(
                width: 38,
                child: Image.asset(
                  conimal.species!.imageSrc,
                  alignment: Alignment.centerLeft,
                  isAntiAlias: true,
                ),
              ),
              SizedBox(
                width: 16,
              ),
              Expanded(
                flex: 6,
                child: Text(
                  conimal.name,
                  style: TextStyle(
                      fontFamily: WcFontFamily.notoSans,
                      height: 1,
                      fontSize: 17,
                      fontWeight: FontWeight.w500),
                  overflow: TextOverflow.fade,
                  textAlign: TextAlign.left,
                ),
              ),
              SizedBox(
                width: 10,
              ),
              SizedBox(
                width: 55,
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.baseline,
                    textBaseline: TextBaseline.alphabetic,
                    children: [
                      Text(
                        '만 ',
                        style: TextStyle(
                            fontFamily: WcFontFamily.notoSans,
                            height: 1,
                            fontSize: 16,
                            fontWeight: FontWeight.w400),
                      ),
                      Text(
                        '${conimal.age}',
                        style: GoogleFonts.workSans(
                            height: 1.3,
                            fontSize: 16,
                            fontWeight: FontWeight.w400),
                      ),
                      Text(
                        '살',
                        style: TextStyle(
                            fontFamily: WcFontFamily.notoSans,
                            height: 1,
                            fontSize: 16,
                            fontWeight: FontWeight.w400),
                      ),
                    ]),
              ),
              SizedBox(
                width: 10,
              ),
              Expanded(
                flex: 9,
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      (conimal.diseases.isEmpty)
                          ? Text(
                              '질병 없음',
                              style: TextStyle(
                                  fontFamily: WcFontFamily.notoSans,
                                  fontSize: 15,
                                  fontWeight: FontWeight.w400),
                              overflow: TextOverflow.fade,
                              softWrap: false,
                            )
                          : Column(
                              mainAxisAlignment: MainAxisAlignment.end,
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                  // Text(
                                  //   conimal.diseases[0].name,
                                  //   style: TextStyle(
                                  //       fontFamily: WcFontFamily.notoSans,
                                  //       fontSize: 15,
                                  //       fontWeight: FontWeight.w400),
                                  //   overflow: TextOverflow.fade,
                                  //   softWrap: false,
                                  // ),
                                  Text.rich(
                                    TextSpan(
                                      children: [
                                        TextSpan(
                                          text: '총 ',
                                          style: TextStyle(
                                              fontFamily: WcFontFamily.notoSans,
                                              fontSize: 15,
                                              fontWeight: FontWeight.w400),
                                        ),
                                        TextSpan(
                                          text: '${conimal.diseases.length}',
                                          style: GoogleFonts.workSans(
                                              fontSize: 17,
                                              fontWeight: FontWeight.w500),
                                        ),
                                        TextSpan(
                                          text: '개 질병',
                                          style: TextStyle(
                                              fontFamily: WcFontFamily.notoSans,
                                              fontSize: 15,
                                              fontWeight: FontWeight.w400),
                                        ),
                                      ],
                                    ),
                                  )
                                ])
                    ]),
              ),
              Container(
                  padding: EdgeInsets.fromLTRB(11, 0, 11, 0),
                  child: SvgPicture.asset(
                    'assets/icons/two_line_vertical.svg',
                    height: 19,
                  ))
            ],
          ),
        ),
        Container(
          height: 1,
          color: WcColors.grey60,
        )
      ],
    );
  }
}
