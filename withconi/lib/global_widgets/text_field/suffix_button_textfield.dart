import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:withconi/module/theme/colors.dart';

class WcSuffixIconTextField extends StatelessWidget {
  WcSuffixIconTextField(
      {Key? key,
      required this.hintText,
      this.onChanged,
      this.textController,
      required this.keyboardType,
      this.textObscure = false,
      this.errorText,
      this.labelText,
      this.width = double.infinity,
      this.readOnly = false,
      this.suffixIcon})
      : super(key: key);

  String hintText;
  void Function(String)? onChanged;
  TextEditingController? textController;
  String? labelText;
  TextInputType keyboardType;
  bool textObscure;
  String? errorText;
  double? width;
  bool readOnly;
  Widget? suffixIcon;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      height: 61,
      child: Stack(
        children: [
          TextField(
            enabled: !readOnly,
            readOnly: readOnly,
            autofocus: false,
            obscuringCharacter: '●',
            obscureText: textObscure,
            controller: textController,
            keyboardType: keyboardType,
            style: GoogleFonts.notoSans(
                color: WcColors.black,
                fontSize: 18,
                fontWeight: FontWeight.w600),
            onChanged: onChanged,
            cursorColor: WcColors.blue100,
            decoration: InputDecoration(
              // suffixIcon: UnconstrainedBox(child: suffixIcon),
              // suffixIconConstraints: BoxConstraints(minHeight: 30, minWidth: 24),
              isDense: true,
              contentPadding: EdgeInsets.only(top: 11, bottom: 10),
              errorText: errorText,
              labelText: labelText,
              labelStyle: GoogleFonts.notoSans(
                  color: WcColors.grey100,
                  fontSize: 17,
                  fontWeight: FontWeight.w300),
              floatingLabelStyle: GoogleFonts.notoSans(
                  color: WcColors.black,
                  fontSize: 17,
                  height: 0.55,
                  fontWeight: FontWeight.w500),
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
          Positioned(right: 0, bottom: 10, child: suffixIcon ?? SizedBox())
        ],
      ),
    );
  }
}
