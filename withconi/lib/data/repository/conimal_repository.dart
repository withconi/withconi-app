import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/physics.dart';
import 'package:withconi/configs/constants/enum.dart';
import 'package:withconi/configs/helpers/token_manager.dart';
import 'package:withconi/controller/signup/shared_data/conimal_data.dart';
import 'package:withconi/controller/signup/shared_data/disease_data.dart';
import 'package:withconi/core/error_handling/exceptions.dart';
import 'package:withconi/data/model/disease.dart';
import 'package:withconi/data/provider/auth_api.dart';
import 'package:withconi/data/provider/disease_api.dart';
import 'package:withconi/ui/widgets/snackbar.dart';

import '../model/conimal.dart';

class ConimalRepository {
  // final DiseaseAPI _api = DiseaseAPI();

  bool addConimal({
    required String conimalName,
    required Gender gender,
    required Species species,
    required DateTime birthDate,
    required DateTime adoptedDate,
  }) {
    try {
      if (checkConimalNum() < 100) {
        // throw MaxConimalException();
      }

      Conimal newConimal = Conimal(
          name: conimalName,
          gender: (gender == Gender.FEMALE) ? 'female' : 'male',
          species: (species == Species.CAT) ? 'cat' : 'dog',
          birthDate: birthDate.millisecondsSinceEpoch,
          adoptedDate: adoptedDate.millisecondsSinceEpoch,
          diseases: DiseaseData.to.selectedDiseases,
          createdAt: DateTime.now().millisecondsSinceEpoch);

      ConimalData.to.addNewConimal(newConimal);
      return true;
    } catch (e) {
      print(e);
      showSnackbar(text: '3마리의 코니멀까지만 등록 가능합니다');
      return false;
    }
  }

  bool editConimal(Conimal conimal) {
    return true;
  }

  bool removeConimal(Conimal conimal) {
    try {
      ConimalData.to.removeConimal(conimal);
      return true;
    } catch (e) {
      return false;
    }
  }

  int checkConimalNum() {
    int conimalNum = ConimalData.to.registeredConimals.length;
    return conimalNum;
  }
}
