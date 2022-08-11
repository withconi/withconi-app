import 'package:geolocator/geolocator.dart';

import 'package:dartz/dartz.dart';
import 'package:withconi/controller/ui_interpreter/failure_ui_interpreter.dart';
import 'package:withconi/core/error_handling/error_message_object.dart';
import 'package:withconi/data/model/disease.dart';
import 'package:withconi/data/repository/community_repository.dart';
import 'package:withconi/data/repository/disease_repository.dart';
import 'package:withconi/ui/widgets/loading.dart';
import '../../core/error_handling/failures.dart';
import '../../data/model/board.dart';
import '../../import_basic.dart';

class HospitalMainPageController extends GetxController {
  Rxn<Position> currentPosition = Rxn<Position>();

  @override
  onInit() async {
    super.onInit();
    currentPosition.value = await determinePosition();
  }

  /// Determine the current position of the device.
  ///
  /// When the location services are not enabled or permissions
  /// are denied the `Future` will return an error.
  Future<Position> determinePosition() async {
    bool serviceEnabled;
    LocationPermission permission;

    // Test if location services are enabled.
    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      // Location services are not enabled don't continue
      // accessing the position and request users of the
      // App to enable the location services.
      return Future.error('Location services are disabled.');
    }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        // Permissions are denied, next time you could try
        // requesting permissions again (this is also where
        // Android's shouldShowRequestPermissionRationale
        // returned true. According to Android guidelines
        // your App should show an explanatory UI now.
        return Future.error('Location permissions are denied');
      }
    }

    if (permission == LocationPermission.deniedForever) {
      // Permissions are denied forever, handle appropriately.
      return Future.error(
          'Location permissions are permanently denied, we cannot request permissions.');
    }

    // When we reach here, permissions are granted and we can
    // continue accessing the position of the device.
    return await Geolocator.getCurrentPosition();
  }
}
