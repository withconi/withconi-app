import 'package:flutter_svg/svg.dart';

import '../../../../import_basic.dart';

class DiseaseSelectListButton extends StatelessWidget {
  DiseaseSelectListButton({
    Key? key,
    required this.width,
    required this.name,
    required this.selected,
    required this.onTap,
    this.height = 50,
    this.padding = const EdgeInsets.symmetric(horizontal: 24),
  }) : super(key: key);

  String name;
  bool selected;
  double width;
  double height;
  void Function()? onTap;
  EdgeInsetsGeometry padding;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: padding,
        child: SizedBox(
          width: width,
          height: height,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SizedBox(
                width: width - 100,
                child: Text(
                  name,
                  style:
                      GoogleFonts.notoSans(fontSize: 15, color: WcColors.black),
                  overflow: TextOverflow.ellipsis,
                ),
              ),
              (selected)
                  ? SvgPicture.asset(
                      'assets/icons/check_circle_filled.svg',
                      width: 22,
                    )
                  : SvgPicture.asset(
                      'assets/icons/check_circle_line.svg',
                      width: 22,
                    )
            ],
          ),
        ),
      ),
    );
  }
}
