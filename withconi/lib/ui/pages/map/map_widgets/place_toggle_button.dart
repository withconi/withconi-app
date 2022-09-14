import '../../../../import_basic.dart';

class PlaceTypeToggleButton extends StatelessWidget {
  PlaceTypeToggleButton({
    Key? key,
    required List<bool> isSelectedList,
    required void Function(int)? onPressed,
  })  : _isSelectedList = isSelectedList,
        _onPressed = onPressed,
        super(key: key);

  void Function(int)? _onPressed;
  List<bool> _isSelectedList;
  @override
  Widget build(BuildContext context) {
    return ToggleButtons(
      constraints: BoxConstraints.tight(Size(54, 45)),
      borderRadius: BorderRadius.circular(30),
      // color: WcColors.white,
      fillColor: WcColors.blue100,
      selectedColor: WcColors.white,
      selectedBorderColor: WcColors.blue100,
      disabledBorderColor: WcColors.green100,
      renderBorder: false,
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.only(left: 3),
          child: Text('전체'),
        ),
        Text('병원'),
        Padding(
          padding: const EdgeInsets.only(right: 3),
          child: Text('약국'),
        ),
      ],
      onPressed: _onPressed,
      isSelected: _isSelectedList,
    );
  }
}
