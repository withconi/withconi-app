import 'dart:ui';

import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'package:withconi/ui/entities/place_verfication.dart';
import 'package:withconi/ui/theme/text_theme.dart';
import 'package:withconi/ui/widgets/snackbar.dart';
import '../../../import_basic.dart';

Future<VerificationGroup> showPlaceVerificationDialog(
    {required String title,
    String? subtitle,
    required VerificationGroup previousVerification,
    required BuildContext context}) async {
  VerificationGroup newVerification = previousVerification;
  int chanceLeft = previousVerification.chanceLeft;

  print(
      '정답 이미지 index : ${newVerification.list.indexOf(newVerification.list.firstWhere((element) => element.isAnswer == true))}');

  VerificationGroup? result = await showDialog(
      context: context,
      builder: (context) {
        bool isChecked = false;
        return StatefulBuilder(builder: (context, setState) {
          return AlertDialog(
            insetPadding: EdgeInsets.zero,
            backgroundColor: Colors.transparent,
            content: ClipRRect(
              borderRadius: BorderRadius.circular(15),
              child: Container(
                height: 425,
                width: WcWidth,
                color: WcColors.white,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      padding: const EdgeInsets.fromLTRB(20, 23, 20, 0),
                      height: 82,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          SizedBox(
                            child: Text(title,
                                style: TextStyle(
                                    fontFamily: WcFontFamily.notoSans,
                                    fontSize: 19,
                                    fontWeight: FontWeight.w500)),
                          ),
                          (previousVerification.verified)
                              ? Row(
                                  children: [
                                    SvgPicture.asset(
                                      'assets/icons/check_circle_filled.svg',
                                      width: 20,
                                    ),
                                    SizedBox(
                                      width: 5,
                                    ),
                                    Text(
                                      '방문인증이 완료되었습니다!',
                                      textAlign: TextAlign.center,
                                      style: GoogleFonts.notoSans(
                                          color: WcColors.blue100,
                                          fontSize: 16,
                                          fontWeight: FontWeight.w600),
                                    ),
                                  ],
                                )
                              : (previousVerification.chanceLeft == 0)
                                  ? Row(
                                      children: [
                                        SvgPicture.asset(
                                          'assets/icons/circle_filled_close.svg',
                                          width: 20,
                                          // color: WcColors.red100,
                                        ),
                                        SizedBox(
                                          width: 5,
                                        ),
                                        Text(
                                          '방문인증에 실패하였습니다',
                                          textAlign: TextAlign.center,
                                          style: GoogleFonts.notoSans(
                                              color: WcColors.red100,
                                              fontSize: 16,
                                              fontWeight: FontWeight.w600),
                                        ),
                                      ],
                                    )
                                  : Row(
                                      children: [
                                        Text(
                                          '총 ',
                                          textAlign: TextAlign.center,
                                          style: GoogleFonts.notoSans(
                                              color: WcColors.grey200,
                                              fontSize: 16,
                                              fontWeight: FontWeight.w500),
                                        ),
                                        Text(
                                          '${newVerification.chanceLeft}',
                                          textAlign: TextAlign.center,
                                          style: GoogleFonts.notoSans(
                                              color: WcColors.black,
                                              fontSize: 16,
                                              fontWeight: FontWeight.w700),
                                        ),
                                        Text(
                                          '번의 기회가 남았어요',
                                          textAlign: TextAlign.center,
                                          style: GoogleFonts.notoSans(
                                              color: WcColors.grey200,
                                              fontSize: 16,
                                              fontWeight: FontWeight.w500),
                                        ),
                                      ],
                                    ),
                        ],
                      ),
                    ),
                    Stack(
                      alignment: Alignment.center,
                      children: [
                        GridView.builder(
                          shrinkWrap: true,
                          itemCount: previousVerification.list.length,
                          gridDelegate:
                              SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: 2),
                          itemBuilder: (BuildContext context, int index) {
                            return GestureDetector(
                              onTap: () async {
                                if ((previousVerification.verified == false &&
                                    previousVerification.chanceLeft > 0)) {
                                  var result = await verifySelectedImage(
                                      index, newVerification);
                                  setState(() {
                                    newVerification = result;
                                  });

                                  if (newVerification.verified ||
                                      newVerification.chanceLeft == 0) {
                                    Get.back(result: newVerification);
                                  } else {
                                    showCustomSnackbar(
                                        text: '해당 장소가 아니에요',
                                        animationDuration:
                                            Duration(milliseconds: 300),
                                        totalDuration:
                                            Duration(milliseconds: 800));
                                    HapticFeedback.vibrate();
                                    setState(() {
                                      newVerification.list.shuffle();
                                    });
                                    print(
                                        '정답 이미지 index : ${newVerification.list.indexOf(newVerification.list.firstWhere((element) => element.isAnswer == true))}');
                                  }
                                }
                              },
                              child: Container(
                                decoration: BoxDecoration(
                                    image: DecorationImage(
                                  image: NetworkImage(
                                    previousVerification.list[index].imageSrc,
                                  ),
                                  fit: BoxFit.cover,
                                )),
                              ),
                            );
                          },
                        ),
                        (previousVerification.verified == false &&
                                previousVerification.chanceLeft == 0)
                            ? Positioned.fill(
                                child: Container(
                                decoration: BoxDecoration(
                                    color: Color.fromARGB(57, 0, 0, 0)),
                                child: ClipRRect(
                                  child: BackdropFilter(
                                    filter: ImageFilter.blur(
                                      sigmaX: 25,
                                      sigmaY: 30,
                                    ),
                                    child: Container(
                                      alignment: Alignment.center,
                                      // color: WcColors.black.withOpacity(0.3),
                                      child: Text(
                                        '방문인증에 실패하였어도\n리뷰작성이 가능합니다. \n인증은 3일 뒤에 재시도할 수 있습니다 :)',
                                        style: TextStyle(
                                            fontFamily: WcFontFamily.notoSans,
                                            fontSize: 16.5,
                                            color: WcColors.white,
                                            height: 1.7,
                                            fontWeight: FontWeight.w400),
                                        textAlign: TextAlign.center,
                                      ),
                                    ),
                                  ),
                                ),
                              ))
                            : SizedBox.shrink(),
                      ],
                    )
                  ],
                ),
              ),
            ),
          );
        });
      });
  return result ?? previousVerification;
}

verifySelectedImage(int selectedIndex, VerificationGroup verification) async {
  if (verification.list[selectedIndex].isAnswer) {
    verification.verified = true;
  } else {
    if (verification.chanceLeft >= 1) {
      verification.chanceLeft--;
      verification.verified = false;
    }
  }

  return verification;
}
