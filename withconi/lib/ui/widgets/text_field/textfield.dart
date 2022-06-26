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
    this.textObscure = false,
    this.enabled = true,
    this.errorText,
    this.labelText,
    this.width = double.infinity,
  }) : super(key: key);

  String hintText;
  void Function(String)? onChanged;
  TextEditingController textController;
  String? labelText;
  TextInputType keyboardType;
  bool textObscure;
  bool enabled;
  String? errorText;
  double? width;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      child: TextField(
        autofocus: false,
        enabled: enabled,
        obscuringCharacter: '●',
        obscureText: textObscure,
        controller: textController,
        keyboardType: keyboardType,
        style: GoogleFonts.notoSans(
            color: WcColors.black, fontSize: 18, fontWeight: FontWeight.w600),
        onChanged: onChanged,
        cursorColor: WcColors.blue100,
        decoration: InputDecoration(
          isDense: true,
          contentPadding: EdgeInsets.only(top: 10, bottom: 8),
          errorText: errorText,
          labelText: labelText,
          labelStyle: GoogleFonts.notoSans(
              color: WcColors.grey100,
              fontSize: 17,
              fontWeight: FontWeight.w300),
          floatingLabelStyle: GoogleFonts.notoSans(
              color: WcColors.black, fontSize: 17, fontWeight: FontWeight.w500),
          alignLabelWithHint: true,
          enabledBorder: const UnderlineInputBorder(
            borderSide: BorderSide(color: WcColors.grey100, width: 0.6),
          ),
          disabledBorder: const UnderlineInputBorder(
            borderSide: BorderSide(color: WcColors.grey100, width: 0.6),
          ),
          focusedBorder: const UnderlineInputBorder(
            borderSide: BorderSide(color: WcColors.blue100, width: 1.5),
          ),
          hintText: hintText,
          hintStyle: GoogleFonts.notoSans(
              color: WcColors.grey100,
              fontSize: 17,
              fontWeight: FontWeight.w400),
        ),
      ),
    );
  }
}
