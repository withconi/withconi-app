import 'package:withconi/module/theme/text_theme.dart';

import '../../import_basic.dart';

class WcErrorWidget extends StatelessWidget {
  WcErrorWidget({
    Key? key,
    required this.image,
    required this.title,
    required this.message,
    this.height,
  }) : super(key: key);

  Widget image;
  String title;
  String message;
  double? height;

  @override
  Widget build(BuildContext context) {
    return (height != null)
        ? Container(
            height: height,
            width: WcWidth(context),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                image,
                SizedBox(
                  height: 11,
                ),
                Text(
                  title,
                  style: TextStyle(
                      fontFamily: WcFontFamily.notoSans,
                      fontSize: 17,
                      fontWeight: FontWeight.w500,
                      height: 1.3,
                      color: WcColors.grey200),
                ),
                SizedBox(
                  height: 2,
                ),
                Text(
                  message,
                  style: TextStyle(
                      fontFamily: WcFontFamily.notoSans,
                      fontSize: 15,
                      height: 1.5,
                      fontWeight: FontWeight.w400,
                      color: WcColors.grey180),
                ),
              ],
            ))
        : Expanded(
            // height: WcHeight - 230,
            // width: WcWidth,
            child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              image,
              SizedBox(
                height: 11,
              ),
              Text(
                title,
                style: TextStyle(
                    fontFamily: WcFontFamily.notoSans,
                    fontSize: 17,
                    fontWeight: FontWeight.w500,
                    height: 1.3,
                    color: WcColors.grey200),
              ),
              SizedBox(
                height: 2,
              ),
              Text(
                message,
                style: TextStyle(
                    fontFamily: WcFontFamily.notoSans,
                    fontSize: 15,
                    height: 1.5,
                    fontWeight: FontWeight.w400,
                    color: WcColors.grey180),
              ),
            ],
          ));
  }
}
