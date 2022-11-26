import 'package:flutter_svg/svg.dart';
import 'package:withconi/core/tools/helpers/search_highlighter.dart';

import '../../../import_basic.dart';
import '../../theme/text_theme.dart';
import '../../ui_model/breed_ui_model.dart';
import '../../ui_model/disease_ui_model.dart';

class BreedListTileButton extends StatelessWidget {
  BreedListTileButton({
    Key? key,
    required this.width,
    required this.breed,
    // required this.selected,
    required this.onTap,
    this.enableSelect = true,
    this.height = 50,
    this.padding = const EdgeInsets.only(left: 24, right: 12),
    this.searchKeyword,
    required this.diseaseIndex,
  }) : super(key: key);

  BreedUIModel breed;
  // bool selected;
  double width;
  double height;
  void Function(BreedUIModel)? onTap;
  EdgeInsetsGeometry padding;
  bool enableSelect;
  String? searchKeyword;
  int diseaseIndex;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        onTap!.call(breed);
      },
      child: Padding(
        padding: padding,
        child: Container(
          // width: width,
          alignment: Alignment.center,
          height: height,
          color: Colors.transparent,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                width: 53,
                child: Text(
                  breed.category,
                  softWrap: false,
                  style: TextStyle(
                      fontFamily: WcFontFamily.notoSans,
                      fontSize: 13.7,
                      height: 1,
                      color: WcColors.grey200,
                      fontWeight: FontWeight.w600,
                      overflow: TextOverflow.fade),
                ),
              ),
              SizedBox(
                width: 6,
              ),
              Expanded(
                // width: ,
                // color: WcColors.babyPinkLight,
                child: Container(
                  color: WcColors.white,
                  // width: width - 120,
                  child: RichText(
                    softWrap: false,
                    text: TextSpan(
                        children: highlightOccurrences(
                            breed.name,
                            searchKeyword,
                            TextStyle(
                                fontFamily: WcFontFamily.notoSans,
                                fontSize: 16,
                                height: 1,
                                color: WcColors.grey200,
                                fontWeight: FontWeight.w600)),
                        style: TextStyle(
                            fontFamily: WcFontFamily.notoSans,
                            fontSize: 16,
                            height: 1,
                            color: WcColors.black,
                            fontWeight: FontWeight.w400)),
                    overflow: TextOverflow.fade,
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
