import 'package:flutter_svg/svg.dart';

import '../../../import_basic.dart';

class ConimalSettingButton extends StatelessWidget {
  ConimalSettingButton({
    Key? key,
    this.onTap,
  }) : super(key: key);

  void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          shape: BoxShape.circle,
          border: Border.all(color: Colors.transparent, width: 3),
          boxShadow: [
            BoxShadow(
                color: Color.fromARGB(18, 0, 0, 0),
                blurRadius: 1,
                spreadRadius: 0,
                offset: Offset(-0.9, 1))
          ]),
      child: ClipOval(
        child: Material(
          color: WcColors.white, // Button color
          child: InkWell(
            splashColor: WcColors.grey140, // Splash color
            onTap: onTap,
            child: Container(
              height: 33,
              width: 33,
              child: Padding(
                padding: EdgeInsets.all(6),
                child: SvgPicture.asset(
                  'assets/icons/settings.svg',
                  fit: BoxFit.contain,
                  color: WcColors.grey120,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
