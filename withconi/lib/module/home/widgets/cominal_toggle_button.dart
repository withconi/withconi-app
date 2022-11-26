import '../../../data/enums/enum.dart';
import '../../../import_basic.dart';

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
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(shape: BoxShape.circle, boxShadow: [
          BoxShadow(
              color: WcColors.grey120.withOpacity(0.9),
              blurRadius: 3,
              offset: Offset(-0.6, 0.7))
        ]),
        child: CircleAvatar(
          radius: (selectedIndex == index) ? 26 : 20.5,
          backgroundColor: WcColors.white,
          child: CircleAvatar(
            backgroundColor:
                (species == Species.cat) ? WcColors.grey110 : WcColors.green20,
            radius: (selectedIndex == index) ? 22 : 20.5,
            child: Image.asset(
              species.imageSrc,
              height: (selectedIndex == index) ? 28 : 25,
            ),
          ),
        ),
      ),
    );
  }
}


// Container(
//       decoration: BoxDecoration(
//           shape: BoxShape.circle,
//           border: Border.all(
//               color: (index == selectedIndex)
//                   ? WcColors.white
//                   : Colors.transparent,
//               width: 3),
//           boxShadow: [
//             (index == selectedIndex)
//                 ? BoxShadow(
//                     color: Color.fromARGB(35, 0, 0, 0),
//                     blurRadius: 3,
//                     spreadRadius: 0,
//                     offset: Offset(-1.5, 2.5))
//                 : BoxShadow(
//                     color: Color.fromARGB(38, 0, 0, 0),
//                     blurRadius: 2,
//                     spreadRadius: -2,
//                     offset: Offset(-0.9, 2.3)),
//           ]),
//       child: ClipOval(
//         child: Material(
//           color: (species == Species.cat)
//               ? WcColors.grey110
//               : WcColors.green20, // Button color
//           child: InkWell(
//             splashColor: WcColors.grey100, // Splash color
//             onTap: onTap,
//             child: Container(
//                 width: (index == selectedIndex) ? 46 : 40,
//                 height: (index == selectedIndex) ? 46 : 40,
//                 child: Image.asset(
//                   (species == Species.cat)
//                       ? 'assets/icons/cat_black.png'
//                       : 'assets/icons/dog.png',
//                   scale: (index == selectedIndex) ? 15 : 18,
//                 )),
//           ),
//         ),
//       ),
//     );