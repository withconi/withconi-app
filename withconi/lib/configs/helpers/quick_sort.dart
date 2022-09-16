import 'package:withconi/data/model/abstract_class/place_type.dart';
import 'package:withconi/ui/entities/custom_marker.dart';

import '../constants/enum.dart';

class QuickSort {
  sortPlaceByType(
      {required List<CustomMarker> placeMarkerList,
      required SortType sortType}) {
    int high = placeMarkerList.length - 1;
    int low = 0;
    List<CustomMarker> result =
        _quickSort(placeMarkerList, low, high, sortType);

    return result;
  }

  // sortPlaceByVisiting({required List<CustomMarker> placeMarkerList}) {
  //   int high = placeMarkerList.length - 1;
  //   int low = 0;
  //   List<CustomMarker> result = _quickSort(placeMarkerList, low, high);

  //   return result;
  // }

  List<CustomMarker> _quickSort(
      List<CustomMarker> list, int low, int high, SortType sortType) {
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

  int distancePartition(List<CustomMarker> list, low, high) {
    if (list.isEmpty) {
      return 0;
    }
    double pivot = list[high].place.distanceByMeter;
    int i = low - 1;
    for (int j = low; j < high; j++) {
      if (list[j].place.distanceByMeter < pivot) {
        i++;
        swap(list, i, j);
      }
    }
    swap(list, i + 1, high);
    return i + 1;
  }

  int visitingPartition(List<CustomMarker> list, low, high) {
    if (list.isEmpty) {
      return 0;
    }
    int pivot = list[high].place.totalVisitingConimal;
    int i = low - 1;
    for (int j = low; j < high; j++) {
      if (list[j].place.totalVisitingConimal < pivot) {
        i++;
        swap(list, i, j);
      }
    }
    swap(list, i + 1, high);
    return i + 1;
  }

  void swap(List<CustomMarker> list, int i, int j) {
    CustomMarker temp = list[i];
    list[i] = list[j];
    list[j] = temp;
  }
}
