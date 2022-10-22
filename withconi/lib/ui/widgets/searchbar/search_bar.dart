import 'package:flutter_svg/svg.dart';
import '../../../import_basic.dart';

class SearchBarWidget extends StatelessWidget {
  SearchBarWidget({
    void Function()? onTapAction,
    void Function()? onTapLeading,
    void Function(String)? onTextChanged,
    required String hintText,
    void Function()? onTextFieldTapped,
    bool? isEditable,
    List<BoxShadow>? boxShadow,
    EdgeInsetsGeometry? margin,
    String? iconSrc,
    Color? iconColor,
    double? width,
    bool? activeAction,
    required TextEditingController? textController,
  })  : _iconSrc = iconSrc ?? 'assets/icons/search.svg',
        _onTapAction = onTapAction,
        _onTextChanged = onTextChanged,
        _onTapLeading = onTapLeading,
        _hintText = hintText,
        _isEditable = isEditable ?? true,
        _onTextFieldTapped = onTextFieldTapped,
        _boxShadow = boxShadow ??
            const [
              BoxShadow(
                color: Color.fromARGB(50, 0, 0, 0),
                spreadRadius: -2,
                blurRadius: 6,
                offset: Offset(0, 1.5),
              ),
            ],
        _margin = margin ?? EdgeInsets.fromLTRB(0, 0, 0, 0),
        _iconColor = iconColor ?? WcColors.grey100,
        _width = width ?? WcWidth - 40,
        _activeAction = activeAction ?? true,
        _textController = textController,
        super();
  final void Function()? _onTapAction;
  final void Function()? _onTapLeading;
  final void Function(String)? _onTextChanged;
  final String _hintText;
  final bool _isEditable;
  final void Function()? _onTextFieldTapped;
  final List<BoxShadow> _boxShadow;
  final EdgeInsetsGeometry _margin;
  final String _iconSrc;
  final Color _iconColor;
  final double _width;
  final bool _activeAction;
  final TextEditingController? _textController;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 45,
      width: _width,
      margin: _margin,
      decoration: BoxDecoration(
        color: WcColors.white,
        boxShadow: _boxShadow,
        borderRadius: BorderRadius.circular(30),
      ),
      child: Row(
        children: [
          GestureDetector(
            onTap: _onTapLeading,
            child: Padding(
              padding: const EdgeInsets.only(left: 13, right: 12),
              child: SvgPicture.asset(
                _iconSrc,
                color: _iconColor,
                height: 20,
              ),
            ),
          ),
          // SizedBox(
          //   width: 20,
          // ),
          Expanded(
              child: GestureDetector(
            onTap: _onTextFieldTapped,
            child: TextField(
              // onTap: _onTextFieldTapped,
              enabled: _isEditable,
              controller: _textController,
              onChanged: _onTextChanged,
              style: GoogleFonts.notoSans(
                  color: WcColors.black,
                  fontSize: 16,
                  fontWeight: FontWeight.w500),
              decoration: InputDecoration(
                hintText: _hintText,
                hintStyle: GoogleFonts.notoSans(
                    color: WcColors.grey120,
                    fontSize: 16,
                    fontWeight: FontWeight.w400),
                border: InputBorder.none,
              ),
            ),
          )),
          Container(
            height: 45,
            width: 1.2,
            color: WcColors.grey80,
          ),
          (_activeAction)
              ? GestureDetector(
                  onTap: _onTapAction,
                  child: Padding(
                    padding: const EdgeInsets.only(
                        left: 12, right: 14, top: 12, bottom: 12),
                    child: SvgPicture.asset(
                      'assets/icons/cancle.svg',
                      color: WcColors.grey120,
                      height: 15,
                    ),
                  ),
                )
              : SizedBox.shrink(),
        ],
      ),
    );
  }
}
