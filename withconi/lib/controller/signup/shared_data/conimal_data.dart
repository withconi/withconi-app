import 'package:flutter/material.dart';

import '../../../core/error_handling/exceptions.dart';
import '../../../data/model/conimal.dart';
import '../../../import_basic.dart';

// class ConimalData extends GetxController {
//   static ConimalData get to => Get.find();

//   final List<Conimal> _registeredConimals = [];
//   List<Conimal> get registeredConimals => _registeredConimals;

//   // registerConimal(Conimal newConimal) {
//   //   if (registeredConimals.length < 3) {
//   //     _registeredConimals.add(newConimal);
//   //     print(registeredConimals);
//   //     return true;
//   //   } else {
//   //     throw MaxListException();
//   //   }
//   // }

//   // removeConimal() {
//   //   if (registeredConimals.isNotEmpty) {
//   //     _registeredConimals.removeLast();
//   //     return true;
//   //   } else {
//   //     throw EmptyListException();
//   //   }
//   // }

//   // removeAllConimal() {
//   //   if (registeredConimals.isNotEmpty) {
//   //     _registeredConimals.clear();
//   //     return true;
//   //   } else {
//   //     return true;
//   //   }
//   // }
// }
