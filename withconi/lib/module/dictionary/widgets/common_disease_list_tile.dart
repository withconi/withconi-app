import 'package:withconi/module/theme/text_theme.dart';

import '../../../data/enums/enum.dart';
import '../../../import_basic.dart';
import '../../ui_model/disease_ui_model.dart';

class CommonDiseaseListTile extends StatelessWidget {
  CommonDiseaseListTile(
      {Key? key,
      required this.onTap,
      required this.species,
      required this.commonDisease,
      required this.index})
      : super(key: key);

  void Function(Species, int) onTap;
  Species species;
  DiseaseUIModel commonDisease;
  int index;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        onTap.call(species, index);
      },
      child: Container(
          alignment: Alignment.centerLeft,
          height: 38,
          width: WcWidth,
          padding: EdgeInsets.symmetric(horizontal: 30),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                constraints: BoxConstraints(maxWidth: 25, minWidth: 10),
                child: Text(
                  '${index + 1}',
                  softWrap: false,
                  style: GoogleFonts.workSans(
                      height: 1.4, fontWeight: FontWeight.w600, fontSize: 16),
                ),
              ),
              SizedBox(
                width: 10,
              ),
              Expanded(
                child: Text(
                  commonDisease.name,
                  softWrap: false,
                  maxLines: 1,
                  overflow: TextOverflow.fade,
                  style: TextStyle(
                      fontFamily: WcFontFamily.notoSans,
                      height: 1.3,
                      fontSize: 15),
                ),
              ),
            ],
          )),
    );
  }
}
