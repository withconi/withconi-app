import '../../../../import_basic.dart';
import '../../../theme/text_theme.dart';

class SearchRefreshButton extends StatelessWidget {
  SearchRefreshButton({
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
        width: 147,
        height: 35,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'assets/icons/arrow_refresh.png',
              height: 12,
            ),
            SizedBox(
              width: 6,
            ),
            Text('현 지도에서 검색',
                style: TextStyle(
                    fontFamily: WcFontFamily.notoSans,
                    color: WcColors.black,
                    fontWeight: FontWeight.w400,
                    fontSize: 14,
                    height: 1.3))
          ],
        ),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(50),
          color: WcColors.white,
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
