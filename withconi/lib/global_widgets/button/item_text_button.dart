// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:withconi/module/theme/colors.dart';
import 'package:withconi/module/theme/sizes.dart';

import '../../module/theme/text_theme.dart';

class ItemListValueButton extends StatelessWidget {
  ItemListValueButton({
    Key? key,
    // required this.active,
    required this.hintText,
    this.suffixIcon,
    required this.itemTextList,
    this.onTapButton,
    required this.onItemDelete,
  }) : super(key: key);

  String hintText;
  TextStyle? hintTextStyle;
  List<String> itemTextList;
  Widget? suffixIcon;
  // bool active;
  void Function()? onTapButton;
  void Function(int) onItemDelete;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: WcWidth - 40,
      height: 45,
      padding: EdgeInsets.only(bottom: 5),
      decoration: BoxDecoration(
          color: Colors.transparent,
          border:
              Border(bottom: BorderSide(color: WcColors.grey110, width: 1.3))),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          GestureDetector(
            onTap: onTapButton,
            child: Container(
              color: Colors.transparent,
              width: WcWidth - 40,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Visibility(
                    visible: itemTextList.isNotEmpty,
                    replacement: Text(
                      hintText,
                      style: TextStyle(
                          color: WcColors.grey100,
                          fontFamily: WcFontFamily.notoSans,
                          fontWeight: FontWeight.w400,
                          fontSize: 16),
                    ),
                    child: GestureDetector(
                      onTap: () {},
                      child: Container(
                        color: Colors.transparent,
                        child: Wrap(
                          children: itemTextList
                              .map((e) => Container(
                                    margin: EdgeInsets.only(right: 5),
                                    alignment: Alignment.center,
                                    padding: EdgeInsets.only(left: 10),
                                    constraints: BoxConstraints(
                                        minWidth: 50,
                                        minHeight: 35,
                                        maxHeight: 35,
                                        maxWidth: ((WcWidth - 85) /
                                                    itemTextList.length >
                                                170)
                                            ? 170
                                            : (WcWidth - 85) /
                                                itemTextList.length),
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(8),
                                      color: WcColors.blue100,
                                    ),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Expanded(
                                          child: Text(
                                            e,
                                            softWrap: false,
                                            overflow: TextOverflow.fade,
                                            style: TextStyle(
                                                fontSize: 13,
                                                fontFamily:
                                                    WcFontFamily.notoSans,
                                                color: WcColors.white),
                                          ),
                                        ),
                                        GestureDetector(
                                          onTap: () {
                                            onItemDelete
                                                .call(itemTextList.indexOf(e));
                                          },
                                          child: Container(
                                            color: Colors.transparent,
                                            child: Padding(
                                              padding:
                                                  const EdgeInsets.fromLTRB(
                                                      6, 8, 8, 8),
                                              child: SvgPicture.asset(
                                                'assets/icons/cancle.svg',
                                                width: 12,
                                                height: 12,
                                                color: WcColors.white,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ))
                              .toList(),
                        ),
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: onTapButton,
                    child: Container(
                      width: 30,
                      height: 30,
                      color: Colors.transparent,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 5),
                        child: suffixIcon ??
                            SvgPicture.asset(
                              'assets/icons/search.svg',
                            ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
