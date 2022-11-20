extension ParseToMiliseconds on DateTime {
  int toMilliseconds() {
    return millisecondsSinceEpoch;
  }
}

extension ParseToDatetime on int {
  DateTime toDatetime() {
    return DateTime.fromMillisecondsSinceEpoch(this);
  }
}

String getDistanceToString({required double distanceMeter}) {
  String distanceResult = '';

  double distanceMeters = distanceMeter;

  // _getMeterDistanceBetween(
  // baseLocation: _currentLocation, placeLocation: placeLocation);
  List<String> suffixes = ['m', 'km'];
  if (distanceMeters < 1000) {
    String metersString = distanceMeters.floor().toString() + suffixes[0];
    distanceResult = metersString;
  } else {
    String kilometersString =
        (distanceMeters / 1000).toStringAsFixed(1) + suffixes[1];
    distanceResult = kilometersString;
  }

  return distanceResult;
}
