import '../../../import_basic.dart';

class WcErrorWidget extends StatelessWidget {
  WcErrorWidget({
    Key? key,
    required this.image,
    required this.title,
    required this.message,
  }) : super(key: key);

  Widget image;
  String title;
  String message;

  @override
  Widget build(BuildContext context) {
    return Container(
        height: WcHeight - 230,
        width: WcWidth,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            image,
            SizedBox(
              height: 11,
            ),
            Text(
              title,
              style: GoogleFonts.notoSans(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: WcColors.grey160),
            ),
            SizedBox(
              height: 2,
            ),
            Text(
              message,
              style: GoogleFonts.notoSans(
                  fontSize: 15,
                  fontWeight: FontWeight.w300,
                  color: WcColors.grey140),
            ),
          ],
        ));
  }
}
