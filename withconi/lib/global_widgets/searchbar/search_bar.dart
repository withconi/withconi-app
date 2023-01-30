import 'package:flutter_svg/svg.dart';
import 'package:withconi/module/theme/text_theme.dart';
import '../../import_basic.dart';

class SearchBarWidget extends StatelessWidget {
  SearchBarWidget({
    required void Function() onTapClear,
    void Function()? onTapLeading,
    required void Function(String) onTextChanged,
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
  })  : _onTapAction = onTapClear,
        _onTextChanged = onTextChanged,
        _onTapLeading = onTapLeading,
        _hintText = hintText,
        _isEditable = isEditable ?? true,
        _onTextFieldTapped = onTextFieldTapped,
        _boxShadow = boxShadow ??
            const [
              BoxShadow(
                color: Color.fromARGB(30, 0, 0, 0),
                spreadRadius: -1,
                blurRadius: 4,
                offset: Offset(0, 1),
              ),
            ],
        _margin = margin ?? EdgeInsets.fromLTRB(0, 0, 0, 0),
        _width = width ?? Get.width - 40,
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
                child: Icon(
                  Icons.search_rounded,
                  size: 24,
                  color: WcColors.grey140.withOpacity(0.9),
                )),
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
              style: TextStyle(
                  fontFamily: WcFontFamily.notoSans,
                  color: WcColors.black,
                  fontSize: 16,
                  fontWeight: FontWeight.w500),
              decoration: InputDecoration(
                hintText: _hintText,
                hintStyle: TextStyle(
                    fontFamily: WcFontFamily.notoSans,
                    color: WcColors.grey140.withOpacity(0.95),
                    fontSize: 15.3,
                    height: 1.6,
                    letterSpacing: 0.1,
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
                  child: Container(
                      // color: WcColors.babyPinkLight,
                      padding: const EdgeInsets.only(
                        left: 9,
                        right: 13,
                        top: 11,
                        bottom: 11,
                      ),
                      child: Icon(
                        Icons.close_rounded,
                        size: 23,
                        color: WcColors.grey140.withOpacity(0.8),
                      )),
                )
              : SizedBox.shrink(),
        ],
      ),
    );
  }
}
