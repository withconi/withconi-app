import 'package:flutter_svg/svg.dart';

import '../../../../import_basic.dart';

class CircularAddButton extends StatelessWidget {
  CircularAddButton({
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
                color: Color.fromARGB(54, 49, 49, 49),
                blurRadius: 7,
                spreadRadius: -5,
                offset: Offset(0, 2)),
          ]),
      child: ClipOval(
        child: Material(
          color: WcColors.white, // Button color
          child: InkWell(
            splashColor: WcColors.grey100, // Splash color
            onTap: onTap,
            child: SvgPicture.asset(
              'assets/icons/add.svg',
              fit: BoxFit.cover,
              height: 40,
            ),
          ),
        ),
      ),
    );
  }
}
