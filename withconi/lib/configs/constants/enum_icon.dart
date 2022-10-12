import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import 'enum.dart';

SvgPicture moreOptionsToIcon(MoreOption option) {
  switch (option) {
    case MoreOption.block:
      return SvgPicture.asset('assets/icons/circle_block.svg');
    case MoreOption.report:
      return SvgPicture.asset('assets/icons/circle_report.svg');
    case MoreOption.edit:
      return SvgPicture.asset('assets/icons/circle_edit.svg');
    case MoreOption.delete:
      return SvgPicture.asset('assets/icons/circle_delete.svg');

    default:
      return SvgPicture.asset('assets/icons/circle_delete.svg');
  }
}

Image speciesToImage(Species species) {
  switch (species) {
    case Species.cat:
      return Image.asset('assets/icons/cat_black.png');

    case Species.dog:
      return Image.asset(
        'assets/icons/dog.png',
      );
    default:
      return Image.asset('assets/icons/dog.png');
  }
}
