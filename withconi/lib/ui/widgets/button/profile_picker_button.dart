import 'dart:io';
import 'package:flutter_svg/svg.dart';
import '../../../import_basic.dart';

class ProfileImagePickerButton extends StatelessWidget {
  const ProfileImagePickerButton({
    Key? key,
    void Function()? onTap,
    required File? imageFile,
    required bool profileSeleted,
  })  : _onTap = onTap,
        _imageFile = imageFile,
        _profileSelected = profileSeleted,
        super(key: key);

  final void Function()? _onTap;
  final File? _imageFile;
  final bool _profileSelected;

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
                child: (_profileSelected)
                    ? ClipOval(
                        child: Image.file(
                          _imageFile!,
                          fit: BoxFit.cover,
                          height: 100,
                          width: 100,
                          errorBuilder: (context, error, stackTrace) {
                            return SvgPicture.asset(
                              'assets/icons/withconi_grey.svg',
                              width: 44,
                            );
                          },
                        ),
                      )
                    : SvgPicture.asset(
                        'assets/icons/withconi_grey.svg',
                        width: 44,
                      )),
          ),
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