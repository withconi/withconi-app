import 'package:flutter_svg/svg.dart';
import 'package:withconi/ui/theme/text_theme.dart';

import '../../../import_basic.dart';

class WcAppBar extends StatelessWidget with PreferredSizeWidget {
  WcAppBar({
    Key? key,
    required this.title,
    this.action,
    this.leading,
    this.onActionTap,
    this.onLeadingTap,
  }) : super(key: key);

  String title;
  Widget? leading;
  Widget? action;
  void Function()? onActionTap;
  void Function()? onLeadingTap;
  @override
  Widget build(BuildContext context) {
    return AppBar(
        centerTitle: true,
        scrolledUnderElevation: 5,
        shadowColor: Color.fromARGB(34, 0, 0, 0),
        elevation: 0,
        foregroundColor: WcColors.grey200,
        backgroundColor: WcColors.white,
        title: Text(
          title,
          style: TextStyle(
              fontFamily: WcFontFamily.notoSans,
              fontSize: 15,
              fontWeight: FontWeight.w500),
        ),
        actions: [
          GestureDetector(
            onTap: onActionTap,
            child: Transform.scale(
              scale: 0.98,
              child: Container(
                  color: WcColors.white,
                  alignment: Alignment.centerRight,
                  padding: EdgeInsets.only(left: 20, right: 20),
                  child: action),
            ),
          )
        ],
        leading: GestureDetector(
          onTap: onLeadingTap ??
              () {
                Get.back();
              },
          child: Transform.scale(
            scale: 1.12,
            child: Container(
                color: WcColors.white,
                alignment: Alignment.centerRight,
                padding:
                    EdgeInsets.only(left: 20, right: 20, bottom: 10, top: 10),
                child: leading ??
                    SvgPicture.asset(
                      'assets/icons/arrow_back.svg',
                      color: WcColors.grey200,
                    )),
          ),
        ));
  }

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight - 8);
}
