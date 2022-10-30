import 'package:flutter_svg/svg.dart';
import 'package:withconi/module/theme/text_theme.dart';

import '../../../data/enums/enum.dart';
import '../../../import_basic.dart';

class GenderToggleButton extends StatelessWidget {
  GenderToggleButton({
    Key? key,
    this.onPressed,
    required this.selectionList,
    required this.selectedValue,
    required this.backgroundColorList,
    required this.mainColorList,
    required this.svgIconSrcList,
    required this.textList,
  }) : super(key: key);

  Function(Gender)? onPressed;
  List<Gender> selectionList;
  Gender? selectedValue;
  List<Color> backgroundColorList;
  List<Color> mainColorList;
  List<String> textList;
  List<String> svgIconSrcList;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 46,
      margin: EdgeInsets.only(top: 14),
      child: ToggleButtons(
        onPressed: (index) {
          onPressed!.call(selectionList[index]);
        },
        borderRadius: BorderRadius.circular(10),
        children: selectionList.map((e) {
          return Padding(
            padding: const EdgeInsets.all(10),
            child: Row(
              children: [
                SvgPicture.asset(svgIconSrcList[selectionList.indexOf(e)],
                    width: 19,
                    color: (selectedValue == null || selectedValue != e)
                        ? WcColors.grey100
                        : mainColorList[selectionList.indexOf(selectedValue!)]),
                SizedBox(
                  width: 7,
                ),
                Text(textList[selectionList.indexOf(e)],
                    style: TextStyle(
                        fontFamily: WcFontFamily.notoSans,
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                        color: (selectedValue == null || selectedValue != e)
                            ? WcColors.grey100
                            : mainColorList[
                                selectionList.indexOf(selectedValue!)])),
              ],
            ),
          );
        }).toList(),
        //   Padding(
        //     padding: const EdgeInsets.all(10),
        //     child: Row(
        //       children: [
        //         SvgPicture.asset('assets/icons/gender_female.svg',
        //             height: 20,
        //             color: (selectedValue == selectionList[0])
        //                 ? WcColors.red100
        //                 : WcColors.grey100),
        //         SizedBox(
        //           width: 7,
        //         ),
        //         Text('암컷',
        //             style: TextStyle(
        //                 fontFamily: WcFontFamily.notoSans,
        //                 fontSize: 14,
        //                 fontWeight: FontWeight.w500,
        //                 color: (selectedValue == selectionList[0])
        //                     ? WcColors.red100
        //                     : WcColors.grey100)),
        //       ],
        //     ),
        //   ),
        //   Padding(
        //     padding: const EdgeInsets.all(10),
        //     child: Row(
        //       mainAxisAlignment: MainAxisAlignment.center,
        //       crossAxisAlignment: CrossAxisAlignment.center,
        //       children: [
        //         SvgPicture.asset('assets/icons/gender_male.svg',
        //             width: 18,
        //             color: (selectedValue == selectionList[1])
        //                 ? WcColors.blue100
        //                 : WcColors.grey100),
        //         SizedBox(
        //           width: 7,
        //         ),
        //         Text('수컷',
        //             style: TextStyle(
        //                 fontFamily: WcFontFamily.notoSans,
        //                 fontSize: 14,
        //                 fontWeight: FontWeight.w500,
        //                 color: (selectedValue == selectionList[1])
        //                     ? WcColors.blue100
        //                     : WcColors.grey100)),
        //       ],
        //     ),
        //   ),
        // ],
        isSelected: selectionList.map((e) => e == selectedValue).toList(),
        selectedBorderColor: (selectedValue == null)
            ? null
            : mainColorList[selectionList.indexOf(selectedValue!)],
        selectedColor: (selectedValue == null)
            ? null
            : mainColorList[selectionList.indexOf(selectedValue!)],
        disabledColor: WcColors.grey120,
        disabledBorderColor: WcColors.grey80,
        fillColor: (selectedValue == null)
            ? null
            : backgroundColorList[selectionList.indexOf(selectedValue!)],

        borderWidth: 1.2,
      ),
    );
  }
}
