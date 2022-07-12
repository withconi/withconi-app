import 'package:flutter_svg/svg.dart';

import '../../../../import_basic.dart';

class GenderToggleButton extends StatelessWidget {
  GenderToggleButton({Key? key, this.onPressed, required this.selectionList})
      : super(key: key);

  Function(int)? onPressed;
  List<bool> selectionList;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 46,
      margin: EdgeInsets.only(top: 14),
      child: ToggleButtons(
        onPressed: onPressed,
        borderRadius: BorderRadius.circular(10),
        children: [
          // Icon(SvgPicture.asset('assets/icons/gender_female.svg')),
          SvgPicture.asset('assets/icons/gender_female.svg',
              height: 20,
              color: (selectionList[0]) ? WcColors.red100 : WcColors.grey100),
          SvgPicture.asset('assets/icons/gender_male.svg',
              width: 18,
              color: (selectionList[1]) ? WcColors.blue100 : WcColors.grey100),
        ],
        isSelected: selectionList,
        selectedBorderColor:
            (selectionList[0]) ? WcColors.red100 : WcColors.blue100,
        selectedColor: (selectionList[0]) ? WcColors.blue100 : WcColors.black,
        disabledColor: WcColors.grey120,
        disabledBorderColor: WcColors.grey80,
        fillColor: (selectionList[0]) ? WcColors.red20 : WcColors.blue40,
        borderWidth: 1.2,
      ),
    );
  }
}
