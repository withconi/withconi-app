import '../../../import_basic.dart';
import '../../theme/text_theme.dart';

class MapShowButton extends StatelessWidget {
  MapShowButton({
    Key? key,
    void Function()? onTap,
  })  : _onTap = onTap,
        super(key: key);
  void Function()? _onTap;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: _onTap,
      child: Container(
        // width: 150,
        // height: 35,
        padding: EdgeInsets.fromLTRB(12, 8, 15, 8),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Image.asset(
            //   'assets/icons/arrow_refresh.png',
            //   height: 12,
            // ),
            Icon(
              Icons.map_rounded,
              size: 20,
              color: WcColors.white,
            ),
            SizedBox(
              width: 5,
            ),
            Text('지도보기',
                style: TextStyle(
                    fontFamily: WcFontFamily.notoSans,
                    color: WcColors.white,
                    fontWeight: FontWeight.w500,
                    fontSize: 14,
                    height: 1.3))
          ],
        ),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(50),
          color: WcColors.blue100,
          boxShadow: const [
            BoxShadow(
              color: Color.fromARGB(60, 0, 0, 0),
              spreadRadius: -1,
              blurRadius: 5,
              offset: Offset(0, 0),
            ),
          ],
        ),
      ),
    );
  }
}
