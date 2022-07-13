import '../../../import_basic.dart';

class WcAppBar extends StatelessWidget with PreferredSizeWidget {
  WcAppBar({
    Key? key,
    required this.title,
    required this.action,
    required this.leading,
    required this.onActionTap,
    required this.onLeadingTap,
  }) : super(key: key);

  String title;
  Widget leading;
  Widget action;
  void Function()? onActionTap;
  void Function()? onLeadingTap;
  @override
  Widget build(BuildContext context) {
    return AppBar(
        scrolledUnderElevation: 5,
        shadowColor: Color.fromARGB(34, 0, 0, 0),
        elevation: 0,
        foregroundColor: WcColors.grey200,
        backgroundColor: WcColors.white,
        title: Text(
          title,
          style:
              GoogleFonts.notoSans(fontSize: 15, fontWeight: FontWeight.w600),
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
          onTap: onLeadingTap,
          child: Transform.scale(
            scale: 1.12,
            child: Container(
                color: WcColors.white,
                alignment: Alignment.centerRight,
                padding:
                    EdgeInsets.only(left: 20, right: 20, bottom: 10, top: 10),
                child: leading),
          ),
        ));
  }

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight - 8);
}
