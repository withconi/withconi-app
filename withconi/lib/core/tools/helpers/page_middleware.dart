import 'package:flutter/material.dart';
import 'package:get/get.dart';

class GlobalMiddleware extends GetMiddleware {
  @override
  Widget onPageBuilt(Widget page) {
    print('Widget ${page.toStringShort()} will be showed');
    return page;
  }

  @override
  void onPageDispose() {
    print('PageDisposed');
  }
}
