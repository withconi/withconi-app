import 'package:flutter/material.dart';

import '../../../core/error_handling/exceptions.dart';
import '../../../data/model/conimal.dart';
import '../../../import_basic.dart';

class ConimalData extends GetxController {
  static ConimalData get to => Get.find();

  final List<Conimal> _registeredConimals = [];
  List<Conimal> get registeredConimals => _registeredConimals;

  addNewConimal(Conimal newConimal) {
    if (registeredConimals.length < 3) {
      _registeredConimals.add(newConimal);
      print(registeredConimals);
      return true;
    } else {
      throw MaxListException();
    }
  }

  removeConimal(Conimal conimal) {
    if (registeredConimals.contains(conimal)) {
      _registeredConimals.remove(conimal);
      return true;
    } else {
      throw EmptyListException();
    }
  }
}
