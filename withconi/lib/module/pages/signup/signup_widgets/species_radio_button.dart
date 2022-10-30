import '../../../../data/enums/enum.dart';
import '../../../../import_basic.dart';

class SpeciesRadioButtonGroup extends StatelessWidget {
  SpeciesRadioButtonGroup({
    Key? key,
    required this.items,
  }) : super(key: key);

  List<SpeciesRadioButton> items;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: items,
    );
  }
}

class SpeciesRadioButton extends StatelessWidget {
  SpeciesRadioButton({
    Key? key,
    this.onTap,
    required this.selectedValue,
    required this.value,
    required this.disabledImage,
    required this.selectedColor,
    required this.selectedImage,
  }) : super(key: key);
  void Function()? onTap;
  Species value;
  Species? selectedValue;
  Widget disabledImage;
  Color selectedColor;
  Widget selectedImage;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 90,
        height: 90,
        padding: EdgeInsets.all(17),
        margin: EdgeInsets.only(right: 20),
        decoration: BoxDecoration(
            color: (selectedValue != null && value == selectedValue)
                ? selectedColor
                : WcColors.grey60,
            boxShadow: [
              BoxShadow(
                  color: WcColors.grey200.withOpacity(0.4),
                  blurRadius: 7,
                  offset: Offset(-1, 3),
                  spreadRadius: -4)
            ],
            shape: BoxShape.circle),
        child: (selectedValue != null && value == selectedValue)
            ? selectedImage
            : disabledImage,
      ),
    );
  }
}
