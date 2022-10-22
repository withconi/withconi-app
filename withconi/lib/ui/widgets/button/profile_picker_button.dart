import 'package:flutter_svg/svg.dart';
import '../../../import_basic.dart';
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
          SizedBox(
              width: 90,
              height: 90,
              child: CircleAvatar(
                backgroundColor: WcColors.grey60,
                backgroundImage: (_imageItem != null)
                    ? _imageItem!.toImageByType()
                    : const AssetImage('assets/icons/withconi_grey.png'),
              )),
          Positioned(
            right: 0,
            bottom: 7,
            child: Container(
              decoration: BoxDecoration(boxShadow: [
                BoxShadow(
                  color: WcColors.grey100.withOpacity(0.5),
                  spreadRadius: -2,
                  blurRadius: 10,
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
