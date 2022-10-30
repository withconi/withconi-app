import 'package:flutter_svg/svg.dart';
import 'package:withconi/core/tools/helpers/search_highlighter.dart';

import '../../../data/model/disease.dart';
import '../../../import_basic.dart';
import '../../theme/text_theme.dart';

class DiseaseListTileButton extends StatelessWidget {
  DiseaseListTileButton({
    Key? key,
    required this.width,
    required this.disease,
    required this.selected,
    required this.onTap,
    this.enableSelect = true,
    this.height = 50,
    this.padding = const EdgeInsets.symmetric(horizontal: 24),
    this.searchKeyword,
  }) : super(key: key);

  Disease disease;
  bool selected;
  double width;
  double height;
  void Function(Disease)? onTap;
  EdgeInsetsGeometry padding;
  bool enableSelect;
  String? searchKeyword;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        onTap!.call(disease);
      },
      child: Padding(
        padding: padding,
        child: Container(
          width: width,
          height: height,
          color: Colors.transparent,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SizedBox(
                width: width - 80,
                child: RichText(
                  text: TextSpan(
                      children: highlightOccurrences(
                          disease.name, searchKeyword, null),
                      style: TextStyle(
                          fontFamily: WcFontFamily.notoSans,
                          fontSize: 16,
                          color: WcColors.grey180,
                          fontWeight: FontWeight.w400)),
                  overflow: TextOverflow.ellipsis,
                ),
              ),
              if (enableSelect)
                (selected)
                    ? SvgPicture.asset(
                        'assets/icons/check_circle_filled.svg',
                        width: 22,
                      )
                    : SvgPicture.asset(
                        'assets/icons/check_circle_unchecked.svg',
                        width: 22,
                      )
              else
                const SizedBox.shrink()
            ],
          ),
        ),
      ),
    );
  }
}
