import 'package:flutter_svg/svg.dart';
import '../../../import_basic.dart';

class SearchBarWidget extends StatelessWidget {
  SearchBarWidget({
    void Function()? onTapRemove,
    void Function()? onTapSearch,
    void Function(String)? onTextChanged,
    required String hintText,
  })  : _onTapRemove = onTapRemove,
        _onTextChanged = onTextChanged,
        _onTapSearch = onTapSearch,
        _hintText = hintText,
        super();
  void Function()? _onTapRemove;
  void Function()? _onTapSearch;
  void Function(String)? _onTextChanged;
  String _hintText;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 45,
      width: WcWidth - 40,
      margin: EdgeInsets.symmetric(vertical: 30),
      decoration: BoxDecoration(
        color: WcColors.white,
        boxShadow: const [
          BoxShadow(
            color: Color.fromARGB(60, 0, 0, 0),
            spreadRadius: -1,
            blurRadius: 10,
            offset: Offset(0, 1),
          ),
        ],
        borderRadius: BorderRadius.circular(30),
      ),
      child: Row(
        children: [
          GestureDetector(
            onTap: _onTapSearch,
            child: Padding(
              padding: const EdgeInsets.only(left: 13, right: 12),
              child: SvgPicture.asset(
                'assets/icons/search.svg',
                color: WcColors.grey100,
              ),
            ),
          ),
          Expanded(
              child: TextField(
            controller: null,
            onChanged: _onTextChanged,
            style: GoogleFonts.notoSans(
                color: WcColors.black,
                fontSize: 16,
                fontWeight: FontWeight.w500),
            decoration: InputDecoration(
              hintText: _hintText,
              hintStyle: GoogleFonts.notoSans(
                  color: WcColors.grey100,
                  fontSize: 16,
                  fontWeight: FontWeight.w400),
              border: InputBorder.none,
            ),
          )),
          Container(
            height: 45,
            width: 1.2,
            color: WcColors.grey80,
          ),
          GestureDetector(
            onTap: _onTapRemove,
            child: Padding(
              padding: const EdgeInsets.only(left: 12, right: 14),
              child: SvgPicture.asset(
                'assets/icons/cancle.svg',
                color: WcColors.grey100,
                height: 16,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
