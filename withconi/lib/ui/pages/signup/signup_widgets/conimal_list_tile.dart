import '../../../../configs/constants/enum.dart';
import '../../../../import_basic.dart';

class ConimalListTile extends StatelessWidget {
  ConimalListTile(
      {Key? key,
      required this.name,
      required this.age,
      required this.species,
      required this.diseaseNum,
      required this.diseaseName})
      : super(key: key);
  Species species;
  String name;
  int age;
  String diseaseName;
  int? diseaseNum;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
            padding: EdgeInsets.symmetric(horizontal: 20),
            height: 77,
            alignment: Alignment.centerLeft,
            child: Row(
              children: [
                (species == Species.cat)
                    ? SizedBox(
                        width: 40,
                        child: Image.asset(
                          'assets/icons/cat.png',
                          width: 42,
                          alignment: Alignment.centerLeft,
                        ),
                      )
                    : SizedBox(
                        width: 40,
                        child: Image.asset(
                          'assets/icons/dog.png',
                          width: 40,
                          alignment: Alignment.centerLeft,
                        ),
                      ),
                SizedBox(
                  width: 16,
                ),
                Expanded(
                  flex: 3,
                  child: Text(
                    name,
                    style: GoogleFonts.notoSans(
                        fontSize: 17, fontWeight: FontWeight.w600),
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                SizedBox(
                  width: 10,
                ),
                SizedBox(
                  width: 55,
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.baseline,
                      textBaseline: TextBaseline.alphabetic,
                      children: [
                        Text(
                          '만 ',
                          style: GoogleFonts.notoSans(
                              fontSize: 16, fontWeight: FontWeight.w500),
                        ),
                        Text(
                          age.toString(),
                          style: GoogleFonts.montserrat(
                              fontSize: 16, fontWeight: FontWeight.w400),
                        ),
                        Text(
                          '살',
                          style: GoogleFonts.notoSans(
                              fontSize: 16, fontWeight: FontWeight.w500),
                        ),
                      ]),
                ),
                SizedBox(
                  width: 10,
                ),
                Expanded(
                  flex: 7,
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Text(
                          diseaseName,
                          style: GoogleFonts.notoSans(
                              fontSize: 16, fontWeight: FontWeight.w500),
                          overflow: TextOverflow.ellipsis,
                        ),
                        (diseaseNum != null)
                            ? Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                crossAxisAlignment: CrossAxisAlignment.baseline,
                                textBaseline: TextBaseline.ideographic,
                                children: [
                                  Text(
                                    '+${diseaseNum! - 1}',
                                    style: GoogleFonts.montserrat(
                                        fontSize: 16,
                                        fontWeight: FontWeight.w400),
                                  ),
                                  Text(
                                    '개 질병',
                                    style: GoogleFonts.notoSans(
                                        fontSize: 16,
                                        fontWeight: FontWeight.w500),
                                  ),
                                ],
                              )
                            : SizedBox.shrink(),
                      ]),
                ),
              ],
            )),
        Container(
          height: 1,
          color: WcColors.grey60,
        )
      ],
    );
  }
}
