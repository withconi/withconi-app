import 'package:withconi/configs/helpers/url_launcher.dart';
import 'package:withconi/ui/widgets/snackbar.dart';

import '../../../../import_basic.dart';

class PhoneCallButton extends StatelessWidget {
  PhoneCallButton({
    Key? key,
    required this.phoneNumber,
  }) : super(key: key);
  String phoneNumber;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (phoneNumber.isNotEmpty)
          ? () {
              UrlLauncher().launchCall(phoneNumber);
            }
          : () {
              showCustomSnackbar(text: '등록된 번호가 없습니다');
            },
      child: Image.asset(
        'assets/icons/call.png',
        height: 50,
        width: 50,
      ),
    );
  }
}
