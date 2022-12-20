import 'package:flutter_svg/svg.dart';

import '../../../data/enums/enum.dart';
import '../../../import_basic.dart';
import '../../theme/text_theme.dart';

class DiseaseItemBox extends StatelessWidget {
  DiseaseItemBox({
    Key? key,
    required this.diseaseName,
    required this.onTap,
    required this.diseaseType,
  }) : super(key: key);
  String diseaseName;
  void Function()? onTap;
  DiseaseType diseaseType;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        color: WcColors.blue100,
      ),
      height: 36,
      child: Row(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 10),
            child: ConstrainedBox(
              constraints:
                  // BoxConstraints(maxWidth: (WcWidth - 40 - (8 * 3)) / 3),
                  BoxConstraints(maxWidth: WcWidth / 3.1),
              child: Text(
                diseaseName,
                style: TextStyle(
                    height: 1.2,
                    fontFamily: WcFontFamily.notoSans,
                    fontSize: 13,
                    color: WcColors.white),
                overflow: TextOverflow.fade,
                softWrap: false,
              ),
            ),
          ),
          GestureDetector(
            onTap: onTap,
            child: Container(
              color: Colors.transparent,
              padding: const EdgeInsets.only(
                  left: 0, right: 3, top: 11.5, bottom: 11.5),
              child: SvgPicture.asset(
                'assets/icons/cancle.svg',
                // width: 12,
                // height: 12,
                color: WcColors.white,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
