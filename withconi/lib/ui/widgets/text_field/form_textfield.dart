import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:withconi/ui/theme/colors.dart';

class WcTextFormField extends StatelessWidget {
  WcTextFormField({
    Key? key,
    required this.hintText,
    required this.onChanged,
    required this.textController,
    required this.labelText,
    required this.keyboardType,
    this.textObscure = false,
    this.enabled = true,
    this.validator,
  }) : super(key: key);

  String hintText;
  void Function(String)? onChanged;
  TextEditingController textController;
  String labelText;
  TextInputType keyboardType;
  bool textObscure;
  bool enabled;

  String? Function(String?)? validator;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      autovalidateMode: AutovalidateMode.onUserInteraction,
      validator: validator,
      enabled: enabled,
      obscuringCharacter: '●',
      obscureText: textObscure,
      controller: textController,
      keyboardType: keyboardType,
      style: GoogleFonts.notoSans(
          color: WcColors.black, fontSize: 19, fontWeight: FontWeight.w600),
      onChanged: onChanged,
      cursorColor: WcColors.blue100,
      decoration: InputDecoration(
        // errorText: errorText,
        labelText: labelText,
        labelStyle: GoogleFonts.notoSans(
            color: WcColors.grey100, fontSize: 18, fontWeight: FontWeight.w300),
        floatingLabelStyle: GoogleFonts.notoSans(
            color: WcColors.black, fontSize: 18, fontWeight: FontWeight.w500),
        alignLabelWithHint: true,
        enabledBorder: const UnderlineInputBorder(
          borderSide: BorderSide(color: WcColors.grey100, width: 1),
        ),
        focusedBorder: const UnderlineInputBorder(
          borderSide: BorderSide(color: WcColors.blue100, width: 1.7),
        ),
        hintText: hintText,
        hintStyle: GoogleFonts.notoSans(
            color: WcColors.grey100, fontSize: 17, fontWeight: FontWeight.w400),
      ),
    );
  }
}
