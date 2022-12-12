import 'package:flutter_svg/svg.dart';
import '../../import_basic.dart';
import '../photo_gallary/image_item.dart';

class ProfileImagePickerButton extends StatelessWidget {
  const ProfileImagePickerButton({
    Key? key,
    void Function()? onTap,
    required ImageItem? imageItem,
  })  : _onTap = onTap,
        _imageItem = imageItem,
        super(key: key);

  final void Function()? _onTap;
  final ImageItem? _imageItem;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: _onTap,
      child: Stack(
        children: [
          const SizedBox(
            width: 100,
            height: 100,
          ),
          Container(
            decoration: BoxDecoration(shape: BoxShape.circle, boxShadow: [
              BoxShadow(
                  color: WcColors.black.withOpacity(0.2),
                  blurRadius: 4,
                  spreadRadius: -2)
            ]),
            child: CircleAvatar(
              radius: 50,
              backgroundColor: WcColors.grey60,
              backgroundImage: (_imageItem != null)
                  ? _imageItem!.getImageByType
                  : const AssetImage('assets/icons/withconi_grey.png'),
            ),
          ),
          Positioned(
            right: 0,
            bottom: 0,
            child: Container(
              decoration: BoxDecoration(boxShadow: [
                BoxShadow(
                  color: WcColors.grey100.withOpacity(0.5),
                  spreadRadius: -2,
                  blurRadius: 8,
                  offset: const Offset(2, 4), // changes position of shadow
                ),
              ]),
              child: CircleAvatar(
                maxRadius: 17,
                backgroundColor: WcColors.white,
                child: SvgPicture.asset(
                  'assets/icons/edit.svg',
                  width: 17,
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
