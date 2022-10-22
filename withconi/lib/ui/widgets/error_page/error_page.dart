import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:withconi/controller/ui_interpreter/failure_ui_interpreter.dart';
import 'package:withconi/ui/theme/text_theme.dart';
import 'package:withconi/ui/widgets/appbar/appbar.dart';

import '../../../core/error_handling/failures.dart';
import '../../theme/colors.dart';

class ErrorPage extends StatelessWidget {
  ErrorPage({Key? key, required this.failure}) : super(key: key);

  Failure failure;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: WcAppBar(title: ''),
      backgroundColor: WcColors.white,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'assets/icons/warning.png',
              height: 45,
            ),
            SizedBox(
              height: 5,
            ),
            Text(
              FailureInterpreter().mapFailureToText(failure),
              style: TextStyle(
                  fontFamily: WcFontFamily.notoSans,
                  fontSize: 17,
                  color: WcColors.grey180,
                  fontWeight: FontWeight.w500),
            ),
          ],
        ),
      ),
    );
  }
}
