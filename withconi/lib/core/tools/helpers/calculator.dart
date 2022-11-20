class TimeCalculator {
  int calculateAge(DateTime birthDate) {
    DateTime currentDate = DateTime.now();
    int age = currentDate.year - birthDate.year;
    int month1 = currentDate.month;
    int month2 = birthDate.month;
    if (month2 > month1) {
      age--;
    } else if (month1 == month2) {
      int day1 = currentDate.day;
      int day2 = birthDate.day;
      if (day2 > day1) {
        age--;
      }
    }
    return age;
  }

  String calculateUploadAt(DateTime uploadAt) {
    List<String> timeSuffix = ['방금', '분', '시간', '일', '주', '달', '년'];
    DateTime currentDate = DateTime.now();
    String uploadAtStr = '';
    Duration differDuration = currentDate.difference(uploadAt);
    if (differDuration.inMinutes < 1) {
      uploadAtStr = '${timeSuffix[0]} 전';
    } else if (differDuration.inMinutes < 60) {
      uploadAtStr = '${differDuration.inMinutes}${timeSuffix[1]} 전';
    } else if (differDuration.inMinutes < (60 * 24)) {
      uploadAtStr = '${differDuration.inHours}${timeSuffix[2]} 전';
    } else if (differDuration.inDays <= 7) {
      uploadAtStr = '${differDuration.inDays}${timeSuffix[3]} 전';
    } else if (differDuration.inDays <= 28) {
      uploadAtStr = '${(differDuration.inDays / 4).round()}${timeSuffix[4]} 전';
    } else if (differDuration.inDays < 365) {
      uploadAtStr = '${(differDuration.inDays / 28).round()}${timeSuffix[5]} 전';
    } else if (differDuration.inDays >= 365) {
      uploadAtStr = '${differDuration.inDays % 365}${timeSuffix[6]} 전';
    }

    return uploadAtStr;
  }
}

class DistanceCalculator {
  static String getDistanceToString({required double distanceMeter}) {
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
}
