import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:withconi/ui/theme/colors.dart';

class WcLabelTextFieldWidget extends StatelessWidget {
  WcLabelTextFieldWidget({
    Key? key,
    required this.hintText,
    required this.onChanged,
    required this.textController,
    required this.labelText,
    required this.keyboardType,
    this.textObscure = false,
  }) : super(key: key);

  String hintText;
  void Function(String)? onChanged;
  TextEditingController textController;
  String labelText;
  TextInputType keyboardType;
  bool textObscure;

  @override
  Widget build(BuildContext context) {
    return TextField(
      obscuringCharacter: '●',
      obscureText: textObscure,
      controller: textController,
      keyboardType: keyboardType,
      style: GoogleFonts.notoSans(
          color: black, fontSize: 17, fontWeight: FontWeight.w500),
      onChanged: onChanged,
      cursorColor: blue100,
      decoration: InputDecoration(
        labelText: labelText,
        labelStyle: GoogleFonts.notoSans(
            color: grey100, fontSize: 17, fontWeight: FontWeight.w300),
        floatingLabelStyle: GoogleFonts.notoSans(
            color: black, fontSize: 17, fontWeight: FontWeight.w500),
        alignLabelWithHint: true,
        enabledBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: grey100, width: 1),
        ),
        focusedBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: blue100, width: 1.5),
        ),
        hintText: hintText,
        hintStyle: GoogleFonts.notoSans(
            color: grey100, fontSize: 17, fontWeight: FontWeight.w300),
      ),
    );
  }
}
