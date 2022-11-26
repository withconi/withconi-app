import '../../../core/tools/helpers/search_highlighter.dart';
import '../../../import_basic.dart';
import '../../theme/text_theme.dart';
import '../../ui_model/disease_ui_model.dart';

class DictionaryListTile extends StatelessWidget {
  DictionaryListTile({
    Key? key,
    required this.width,
    required this.disease,
    // required this.selected,
    required this.onTap,
    // this.enableSelect = true,
    this.height = 53,
    this.padding = const EdgeInsets.only(left: 20, right: 20),
    this.searchKeyword,
    required this.diseaseIndex,
    // required this.onDiseaseInfoTap,
  }) : super(key: key);

  DiseaseUIModel disease;
  // bool selected;
  double width;
  double height;
  void Function(DiseaseUIModel)? onTap;
  // void Function(DiseaseUIModel) onDiseaseInfoTap;
  EdgeInsetsGeometry padding;
  // bool enableSelect;
  String? searchKeyword;
  int diseaseIndex;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        onTap!.call(disease);
      },
      child: Container(
        padding: padding,
        width: WcWidth,
        alignment: Alignment.center,
        height: height,
        color: Colors.transparent,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              height: 8,
              width: 8,
              decoration: BoxDecoration(
                  color: disease.diseaseType.color,
                  borderRadius: BorderRadius.circular(2)),
            ),
            SizedBox(
              width: 6,
            ),
            Container(
              constraints: BoxConstraints(maxWidth: 70, minWidth: 65),
              // width: 77,
              child: Text(
                disease.diseaseType.displayName,
                softWrap: false,
                style: TextStyle(
                    fontFamily: WcFontFamily.notoSans,
                    fontSize: 13.5,
                    height: 1,
                    color: WcColors.black,
                    fontWeight: FontWeight.w500,
                    overflow: TextOverflow.fade),
              ),
            ),
            SizedBox(
              width: 10,
            ),
            Expanded(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: Container(
                      color: WcColors.white,
                      // width: width - 165,
                      child: RichText(
                        softWrap: false,
                        text: TextSpan(
                            children: highlightOccurrences(
                                disease.name,
                                searchKeyword,
                                TextStyle(
                                    fontFamily: WcFontFamily.notoSans,
                                    fontSize: 16,
                                    height: 1,
                                    color: WcColors.black,
                                    fontWeight: FontWeight.w700)),
                            style: TextStyle(
                                fontFamily: WcFontFamily.notoSans,
                                fontSize: 16,
                                height: 1,
                                color: WcColors.black,
                                fontWeight: FontWeight.w400)),
                        overflow: TextOverflow.fade,
                      ),
                    ),
                  ),

                  // InkWell(
                  //   onTap: () {
                  //     onDiseaseInfoTap.call(disease);
                  //   },
                  //   child: Container(
                  //     alignment: Alignment.center,
                  //     height: 30,
                  //     width: 65,
                  //     decoration: BoxDecoration(
                  //       color: WcColors.grey80,
                  //       borderRadius: BorderRadius.circular(
                  //         5,
                  //       ),
                  //     ),
                  //     child: Text(
                  //       '질병정보',
                  //       style: TextStyle(
                  //           fontFamily: WcFontFamily.notoSans,
                  //           color: WcColors.black,
                  //           fontSize: 12,
                  //           fontWeight: FontWeight.w500,
                  //           height: 1),
                  //     ),
                  //   ),
                  // ),
                  // SizedBox(
                  //   width: 13,
                  // ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
