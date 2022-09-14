import '../../../../import_basic.dart';

class PhoneButton extends StatelessWidget {
  const PhoneButton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: Image.asset(
        'assets/icons/call.png',
        height: 50,
        width: 50,
      ),
    );
  }
}
