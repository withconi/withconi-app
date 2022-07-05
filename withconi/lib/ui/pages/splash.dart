import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:withconi/controller/auth_controller.dart';
import 'package:withconi/ui/theme/sizes.dart';

class SplashPage extends StatelessWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    AuthController _controller = AuthController.to;
    return Scaffold(
      body: SafeArea(
        child: SizedBox(
          height: WcHeight,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                const SizedBox(
                  height: 75,
                ),
                Image.asset(
                  'assets/icons/withconi.png',
                  height: 120,
                ),
                const SizedBox(
                  height: 16,
                ),
                // Text(
                //   'WITHCONI',
                //   style: GoogleFonts.notoSans(
                //       fontSize: 25, fontWeight: FontWeight.w600),
                // ),
                const SizedBox(
                  height: 60,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
