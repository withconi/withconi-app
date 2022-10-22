import 'package:flutter_svg/svg.dart';
import 'package:withconi/ui/theme/text_theme.dart';

import '../../../import_basic.dart';
import '../searchbar/search_bar.dart';

class WcSearchAppBar extends StatelessWidget with PreferredSizeWidget {
  WcSearchAppBar({
    Key? key,
    this.action,
    this.leading,
    this.onActionTap,
    this.onLeadingTap,
    required this.onClearTap,
    required this.onTextChanged,
    required this.textEditingController,
    required this.hintText,
  }) : super(key: key);

  Widget? leading;
  Widget? action;
  void Function()? onActionTap;
  void Function()? onLeadingTap;
  void Function(String) onTextChanged;
  void Function()? onClearTap;
  TextEditingController textEditingController;
  String hintText;
  @override
  Widget build(BuildContext context) {
    return AppBar(
        leadingWidth: 40,
        centerTitle: true,
        scrolledUnderElevation: 5,
        shadowColor: Color.fromARGB(34, 0, 0, 0),
        elevation: 0,
        foregroundColor: WcColors.grey200,
        backgroundColor: WcColors.white,
        title: Column(
          children: [
            SizedBox(
              height: 5,
            ),
            Container(
              height: 45,
              width: double.infinity,
              decoration: BoxDecoration(
                color: WcColors.white,
                boxShadow: const [
                  BoxShadow(
                    color: Color.fromARGB(50, 0, 0, 0),
                    spreadRadius: -2,
                    blurRadius: 5,
                    offset: Offset(0, 1),
                  ),
                ],
                borderRadius: BorderRadius.circular(30),
              ),
              child: Row(
                children: [
                  SizedBox(
                    width: 20,
                  ),
                  Expanded(
                      child: TextField(
                    // onTap: _onTextFieldTapped,
                    enabled: true,
                    controller: textEditingController,
                    onChanged: onTextChanged,
                    style: GoogleFonts.notoSans(
                        color: WcColors.black,
                        fontSize: 16,
                        fontWeight: FontWeight.w500),
                    decoration: InputDecoration(
                      hintText: hintText,
                      hintStyle: GoogleFonts.notoSans(
                          color: WcColors.grey120,
                          fontSize: 16,
                          fontWeight: FontWeight.w400),
                      border: InputBorder.none,
                    ),
                  )),
                  Container(
                    height: 45,
                    width: 1.2,
                    color: WcColors.grey80,
                  ),
                  GestureDetector(
                    onTap: onClearTap,
                    child: Padding(
                      padding: const EdgeInsets.only(
                          left: 12, right: 14, top: 12, bottom: 12),
                      child: SvgPicture.asset(
                        'assets/icons/cancle.svg',
                        color: WcColors.grey120,
                        height: 15,
                      ),
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
        // SearchBarWidget(
        //   textController: textEditingController,
        //   onTextChanged: onTextChanged,
        //   onTapAction: onClearTap,
        //   hintText: '게시글 검색',
        //   boxShadow: const [
        //     BoxShadow(
        //       color: Color.fromARGB(50, 0, 0, 0),
        //       spreadRadius: -2,
        //       blurRadius: 5,
        //       offset: Offset(0, 1),
        //     ),
        //   ],
        //   // margin: EdgeInsets.(bottom: 30),
        // ),
        // actions: [
        //   GestureDetector(
        //     onTap: onActionTap,
        //     child: Transform.scale(
        //       scale: 0.98,
        //       child: Container(
        //           color: WcColors.white,
        //           alignment: Alignment.centerRight,
        //           padding: EdgeInsets.only(left: 20, right: 20),
        //           child: action),
        //     ),
        //   )
        // ],
        leading: GestureDetector(
          onTap: onLeadingTap ??
              () {
                Get.back();
              },
          child: Transform.scale(
            scale: 1,
            child: Container(
                color: WcColors.white,
                alignment: Alignment.centerRight,
                padding: EdgeInsets.only(left: 20, bottom: 10, top: 12),
                child: leading ??
                    SvgPicture.asset(
                      'assets/icons/arrow_back.svg',
                      color: WcColors.grey200,
                    )),
          ),
        ));
  }

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight + 20);
}
