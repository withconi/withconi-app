import 'package:withconi/module/theme/text_theme.dart';

import '../../../../data/enums/enum.dart';
import '../../../../import_basic.dart';

class PlaceTypeToggleButton extends StatelessWidget {
  PlaceTypeToggleButton({
    Key? key,
    // required List<bool> isSelectedList,
    required List<PlaceType> placeTypeList,
    required PlaceType selectedPlaceType,
    required void Function(PlaceType)? onPressed,
  })  : _selectedPlaceType = selectedPlaceType,
        _onPressed = onPressed,
        _placeTypeList = placeTypeList,
        super(key: key);

  void Function(PlaceType)? _onPressed;
  PlaceType _selectedPlaceType;
  List<PlaceType> _placeTypeList;

  @override
  Widget build(BuildContext context) {
    List<bool> _selectionList = [
      (_selectedPlaceType == PlaceType.all),
      (_selectedPlaceType == PlaceType.hospital),
      (_selectedPlaceType == PlaceType.pharmacy)
    ];
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
          child: Text(
            '전체',
            style: TextStyle(
                fontFamily: WcFontFamily.notoSans,
                fontSize: 15,
                fontWeight: FontWeight.w400),
          ),
        ),
        Text(
          '병원',
          style: TextStyle(
              fontFamily: WcFontFamily.notoSans,
              fontSize: 15,
              fontWeight: FontWeight.w400),
        ),
        Padding(
          padding: const EdgeInsets.only(right: 3),
          child: Text(
            '약국',
            style: TextStyle(
                fontFamily: WcFontFamily.notoSans,
                fontSize: 15,
                fontWeight: FontWeight.w400),
          ),
        ),
      ],
      onPressed: (index) {
        _onPressed!.call(_placeTypeList[index]);
      },
      isSelected: _selectionList,
    );
  }
}
