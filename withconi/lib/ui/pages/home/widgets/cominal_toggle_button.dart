import '../../../../configs/constants/enum.dart';
import '../../../../import_basic.dart';

class ConimalToggleButton extends StatelessWidget {
  ConimalToggleButton({
    Key? key,
    required this.onTap,
    required this.backgroundColor,
    required this.species,
    required this.index,
    required this.selectedIndex,
  }) : super(key: key);

  void Function() onTap;
  Color backgroundColor;
  Species species;
  int index;
  int selectedIndex;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          shape: BoxShape.circle,
          border: Border.all(
              color: (index == selectedIndex)
                  ? WcColors.white
                  : Colors.transparent,
              width: 3),
          boxShadow: [
            BoxShadow(
                color: Color.fromARGB(58, 49, 49, 49),
                blurRadius: 10,
                spreadRadius: -2,
                offset: Offset(-1, 3)),
          ]),
      child: ClipOval(
        child: Material(
          color: (species == Species.cat)
              ? WcColors.grey110
              : WcColors.green20, // Button color
          child: InkWell(
            splashColor: WcColors.grey100, // Splash color
            onTap: onTap,
            child: SizedBox(
                width: (index == selectedIndex) ? 45 : 40,
                height: (index == selectedIndex) ? 45 : 40,
                child: Padding(
                  padding: (index == selectedIndex)
                      ? EdgeInsets.all(8)
                      : EdgeInsets.all(8),
                  child: Image.asset(
                    (species == Species.cat)
                        ? 'assets/icons/cat_black.png'
                        : 'assets/icons/dog.png',
                    fit: BoxFit.cover,
                  ),
                )),
          ),
        ),
      ),
    );
  }
}
