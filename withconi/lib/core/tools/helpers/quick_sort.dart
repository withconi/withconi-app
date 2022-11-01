import 'package:withconi/module/ui_model/custom_marker.dart';

import '../../../data/enums/enum.dart';

class QuickSort {
  sortPlaceByType(
      {required List<PlaceMarker> placeMarkerList,
      required SortType sortType}) {
    int high = placeMarkerList.length - 1;
    int low = 0;
    List<PlaceMarker> result = _quickSort(placeMarkerList, low, high, sortType);

    return result;
  }

  List<PlaceMarker> _quickSort(
      List<PlaceMarker> list, int low, int high, SortType sortType) {
    if (low < high) {
      late int pi;

      if (sortType == SortType.visiting) {
        pi = visitingPartition(list, low, high);
      } else if (sortType == SortType.nearest) {
        pi = distancePartition(list, low, high);
      }
      _quickSort(list, low, pi - 1, sortType);
      _quickSort(list, pi + 1, high, sortType);
    }
    return list;
  }

  int distancePartition(List<PlaceMarker> list, low, high) {
    if (list.isEmpty) {
      return 0;
    }
    double pivot = list[high].distanceMeter;
    int i = low - 1;
    for (int j = low; j < high; j++) {
      if (list[j].distanceMeter < pivot) {
        i++;
        swap(list, i, j);
      }
    }
    swap(list, i + 1, high);
    return i + 1;
  }

  int visitingPartition(List<PlaceMarker> list, low, high) {
    if (list.isEmpty) {
      return 0;
    }
    int pivot = list[high].place.totalReviews;
    int i = low - 1;
    for (int j = low; j < high; j++) {
      if (list[j].place.totalReviews > pivot) {
        i++;
        swap(list, i, j);
      }
    }
    swap(list, i + 1, high);
    return i + 1;
  }

  void swap(List<PlaceMarker> list, int i, int j) {
    PlaceMarker temp = list[i];
    list[i] = list[j];
    list[j] = temp;
  }
}
