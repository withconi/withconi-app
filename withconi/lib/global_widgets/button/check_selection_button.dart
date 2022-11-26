import 'package:flutter_svg/svg.dart';
import 'package:withconi/module/ui_model/conimal_ui_model.dart';

import '../../data/enums/enum.dart';

import '../../import_basic.dart';
import '../../module/theme/text_theme.dart';

class VisitedConimalSelectionButton extends StatelessWidget {
  VisitedConimalSelectionButton({
    Key? key,
    required this.selected,
    required this.conimal,
    this.onChanged,
  }) : super(key: key);

  bool selected;
  ConimalUIModel conimal;
  Function(ConimalUIModel)? onChanged;

  @override
  Widget build(BuildContext context) {
    String _species;
    if (conimal.species == Species.cat) {
      _species = 'cat';
    } else {
      _species = 'dog';
    }
    return GestureDetector(
      onTap: () {
        onChanged!.call(conimal);
      },
      child: Stack(
        alignment: Alignment.bottomLeft,
        children: [
          const SizedBox(
            width: 110,
            height: 135,
          ),
          Positioned(
            left: 8,
            child: Container(
              alignment: Alignment.center,
              height: 130,
              width: 95,
              padding: EdgeInsets.fromLTRB(8, 12, 8, 0),
              decoration: BoxDecoration(
                  border: (selected)
                      ? Border.all(color: WcColors.blue100, width: 1.4)
                      : Border.all(color: WcColors.grey20),
                  color: (selected) ? WcColors.blue20 : WcColors.grey20,
                  borderRadius: BorderRadius.circular(6)),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    (selected)
                        ? 'assets/icons/$_species.png'
                        : 'assets/icons/${_species}_grey.png',
                    height: 38,
                  ),
                  Container(
                    alignment: Alignment.center,
                    height: 48,
                    child: Text(
                      conimal.name,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontFamily: WcFontFamily.notoSans,
                          color: (selected) ? WcColors.black : WcColors.grey160,
                          fontSize: 15,
                          height: 1.3,
                          overflow: TextOverflow.fade,
                          fontWeight: FontWeight.w500),
                    ),
                  ),
                  Expanded(
                    child: Text('만 ${conimal.age}살',
                        overflow: TextOverflow.clip,
                        style: GoogleFonts.openSans(
                            color:
                                (selected) ? WcColors.black : WcColors.grey140,
                            fontSize: 14,
                            fontWeight: FontWeight.w500)),
                  ),
                ],
              ),
            ),
          ),
          (selected)
              ? Positioned(
                  left: 0,
                  top: 0,
                  child: SvgPicture.asset(
                    'assets/icons/check_filled_blue.svg',
                    height: 20,
                  ))
              : SizedBox.shrink(),
        ],
      ),
    );
  }
}
