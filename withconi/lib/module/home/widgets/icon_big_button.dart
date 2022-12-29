import '../../../import_basic.dart';
import '../../theme/text_theme.dart';

class IconBigButton extends StatelessWidget {
  IconBigButton(
      {Key? key, required this.imageSrc, required this.text, this.onTap})
      : super(key: key);
  String imageSrc;
  String text;
  void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Ink(
        decoration: BoxDecoration(
            color: WcColors.blue20, borderRadius: BorderRadius.circular(10)),
        child: InkWell(
          borderRadius: BorderRadius.circular(10),
          splashColor: Color.fromARGB(255, 218, 225, 237),
          onTap: onTap,
          child: Container(
            padding: EdgeInsets.all(20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  imageSrc,
                  height: 45,
                ),
                SizedBox(
                  height: 13,
                ),
                Text(
                  text,
                  style: TextStyle(
                      fontFamily: WcFontFamily.notoSans,
                      color: WcColors.grey180,
                      fontSize: 15,
                      height: 1,
                      fontWeight: FontWeight.w600),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
