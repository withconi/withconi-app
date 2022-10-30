import 'package:flutter_svg/svg.dart';

import '../../../data/enums/enum.dart';
import '../../../data/model/conimal.dart';
import '../../../import_basic.dart';
import '../../theme/text_theme.dart';

class CheckIconSelectionButton extends StatelessWidget {
  CheckIconSelectionButton({
    Key? key,
    required this.selected,
    required this.value,
    required this.selectedImageSrc,
    required this.unselectedImageSrc,
    required this.onChanged,
    this.text,
  }) : super(key: key);

  bool selected;
  dynamic value;
  Function(dynamic) onChanged;
  String selectedImageSrc;
  String unselectedImageSrc;
  String? text;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        onChanged.call(value);
      },
      child: Stack(
        alignment: Alignment.bottomLeft,
        children: [
          const SizedBox(
            width: 110,
            height: 135,
          ),
          Positioned(
            left: 8,
            child: Container(
              alignment: Alignment.center,
              height: 130,
              width: 95,
              padding: EdgeInsets.fromLTRB(8, 15, 8, 0),
              decoration: BoxDecoration(
                  border: (selected)
                      ? Border.all(color: WcColors.blue100, width: 1.4)
                      : Border.all(color: WcColors.grey20),
                  color: (selected) ? WcColors.blue20 : WcColors.grey20,
                  borderRadius: BorderRadius.circular(6)),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    (selected) ? selectedImageSrc : unselectedImageSrc,
                    height: 50,
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Container(
                    alignment: Alignment.center,
                    height: 48,
                    child: Text(
                      text ?? value.name,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontFamily: WcFontFamily.notoSans,
                          color: (selected) ? WcColors.black : WcColors.grey160,
                          fontSize: 15,
                          height: 1.3,
                          overflow: TextOverflow.fade,
                          fontWeight: FontWeight.w500),
                    ),
                  ),
                ],
              ),
            ),
          ),
          (selected)
              ? Positioned(
                  left: 0,
                  top: 0,
                  child: SvgPicture.asset(
                    'assets/icons/check_filled_blue.svg',
                    height: 20,
                  ))
              : SizedBox.shrink(),
        ],
      ),
    );
  }
}
