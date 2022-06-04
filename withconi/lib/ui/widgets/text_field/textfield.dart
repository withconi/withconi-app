import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:withconi/ui/theme/colors.dart';

class WcTextField extends StatelessWidget {
  WcTextField({
    Key? key,
    required this.hintText,
    required this.onChanged,
    required this.textController,
    required this.keyboardType,
    this.obscureText = false,
  }) : super(key: key);

  String hintText;
  void Function(String)? onChanged;
  TextEditingController textController;
  TextInputType keyboardType;
  bool obscureText;

  @override
  Widget build(BuildContext context) {
    return TextField(
      obscureText: obscureText,
      controller: textController,
      keyboardType: keyboardType,
      style: GoogleFonts.notoSans(
          color: WcColors.black, fontSize: 18, fontWeight: FontWeight.w500),
      onChanged: onChanged,
      cursorColor: WcColors.blue100,
      decoration: InputDecoration(
        floatingLabelStyle: GoogleFonts.notoSans(
            color: WcColors.black, fontSize: 17, fontWeight: FontWeight.w500),
        alignLabelWithHint: true,
        enabledBorder: const UnderlineInputBorder(
          borderSide: BorderSide(color: WcColors.grey100, width: 1),
        ),
        focusedBorder: const UnderlineInputBorder(
          borderSide: BorderSide(color: WcColors.blue100, width: 1.5),
        ),
        hintText: hintText,
        hintStyle: GoogleFonts.notoSans(
            color: WcColors.grey100, fontSize: 17, fontWeight: FontWeight.w300),
      ),
    );
  }
}
