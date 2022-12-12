import 'package:withconi/module/theme/text_theme.dart';

import '../../../data/enums/enum.dart';
import '../../../import_basic.dart';

class PlaceTypeToggleButton extends StatelessWidget {
  const PlaceTypeToggleButton({
    Key? key,
    // required List<bool> isSelectedList,
    required List<PlaceType> placeTypeList,
    required PlaceType selectedPlaceType,
    required void Function(PlaceType)? onPressed,
  })  : _selectedPlaceType = selectedPlaceType,
        _onPressed = onPressed,
        _placeTypeList = placeTypeList,
        super(key: key);

  final void Function(PlaceType)? _onPressed;
  final PlaceType _selectedPlaceType;
  final List<PlaceType> _placeTypeList;

  @override
  Widget build(BuildContext context) {
    List<bool> _selectionList =
        PlaceType.values.map((e) => _selectedPlaceType == e).toList();
    return ToggleButtons(
      constraints: BoxConstraints.tight(const Size(54, 45)),
      borderRadius: BorderRadius.circular(30),
      // color: WcColors.white,
      fillColor: (_selectedPlaceType.mainColor),
      selectedColor: WcColors.white,
      selectedBorderColor: (_selectedPlaceType.mainColor),
      // disabledBorderColor: WcColors.green100,
      renderBorder: false,
      children: _placeTypeList.map((placeType) {
        return Container(
          padding: (_placeTypeList.first == placeType)
              ? EdgeInsets.only(left: 6)
              : (_placeTypeList.last == placeType)
                  ? EdgeInsets.only(right: 5)
                  : null,
          child: Text(
            placeType.displayName,
            style: TextStyle(
                fontFamily: WcFontFamily.notoSans,
                fontSize: 15,
                fontWeight: FontWeight.w400),
          ),
        );
      }).toList(),

      // const <Widget>[
      //   Padding(
      //     padding: EdgeInsets.only(left: 6),
      //     child: Text(
      //       '전체',
      //       style: TextStyle(
      //           fontFamily: WcFontFamily.notoSans,
      //           fontSize: 15,
      //           fontWeight: FontWeight.w400),
      //     ),
      //   ),
      //   Text(
      //     '병원',
      //     style: TextStyle(
      //         fontFamily: WcFontFamily.notoSans,
      //         fontSize: 15,
      //         fontWeight: FontWeight.w400),
      //   ),
      //   Padding(
      //     padding: EdgeInsets.only(right: 5),
      //     child: Text(
      //       '약국',
      //       style: TextStyle(
      //           fontFamily: WcFontFamily.notoSans,
      //           fontSize: 15,
      //           fontWeight: FontWeight.w400),
      //     ),
      //   ),
      // ],
      onPressed: (index) {
        _onPressed!.call(_placeTypeList[index]);
      },
      isSelected: _selectionList,
    );
  }
}
