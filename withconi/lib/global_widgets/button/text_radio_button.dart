import 'package:withconi/module/theme/text_theme.dart';

import '../../import_basic.dart';

class WcTextRadioButton extends StatelessWidget {
  WcTextRadioButton(
      {Key? key,
      required this.selectedValue,
      required this.value,
      required this.onTap,
      required this.text,
      this.height = 29,
      this.width = 65})
      : super(key: key);

  dynamic selectedValue;
  dynamic value;
  void Function(dynamic) onTap;
  double? height;
  double? width;
  String text;

  @override
  Widget build(BuildContext context) {
    return Row(children: [
      Material(
        child: Ink(
          height: height,
          width: width,
          decoration: BoxDecoration(
              color: (selectedValue == null)
                  ? WcColors.grey80
                  : (selectedValue == value)
                      ? WcColors.blue100
                      : WcColors.grey80,
              borderRadius: BorderRadius.circular(5)),
          child: InkWell(
            onTap: () {
              onTap.call(value);
            },
            customBorder: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(5),
            ),
            child: Container(
              alignment: Alignment.center,
              child: Text(
                text,
                style: TextStyle(
                    fontFamily: WcFontFamily.notoSans,
                    color: (selectedValue == null)
                        ? WcColors.grey200
                        : (selectedValue == value)
                            ? WcColors.white
                            : WcColors.grey200,
                    fontSize: 14,
                    fontWeight: FontWeight.normal,
                    height: 1.2),
              ),
            ),
          ),
        ),
      ),
      SizedBox(
        width: 8,
      )
    ]);
  }
}
