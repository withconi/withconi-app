import 'package:withconi/module/ui_model/latlng_ui_model.dart';
import 'package:withconi/module/ui_model/place_marker_ui_model.dart';
import 'package:withconi/module/ui_model/place_ui_model/abstract_class/place_preview_ui.dart';

import '../../../data/enums/enum.dart';

class QuickSort {
  static final QuickSort _instance = QuickSort._internal();

  QuickSort._internal();

  factory QuickSort() {
    return _instance;
  }

  // sortPlaceByType(
  //     {required List<PlacePreviewUiModel> placeList,
  //     required SortType sortType}) {
  //   int high = placeList.length - 1;
  //   int low = 0;
  //   List<PlacePreviewUiModel> result =
  //       _quickSort(placeList, low, high, sortType, baseLocation);

  //   return result;
  // }

  sortByVisiting({
    required List<PlacePreviewUIModel> placeList,
  }) {
    int high = placeList.length - 1;
    int low = 0;
    List<PlacePreviewUIModel> result = _visitingQuickSort(placeList, low, high);

    return result;
  }

  sortByNearestWithBaseLocation(
      {required List<PlacePreviewUIModel> placeList,
      required LatLngUIModel baseLocation}) {
    int high = placeList.length - 1;
    int low = 0;

    List<PlacePreviewUIModel> result =
        _distanceQuickSort(placeList, low, high, Sorting.nearest, baseLocation);

    return result;
  }

  // List<PlacePreviewUiModel> _quickSort(List<PlacePreviewUiModel> list, int low,
  //     int high, SortType sortType, LatLngUIModel baseLocation) {
  //   if (low < high) {
  //     late int pi;

  //     if (sortType == SortType.visiting) {
  //       pi = visitingPartition(list, low, high);
  //     } else if (sortType == SortType.nearest) {
  //       pi = distancePartition(list, low, high, baseLocation);
  //     }
  //     _quickSort(list, low, pi - 1, sortType, baseLocation);
  //     _quickSort(list, pi + 1, high, sortType, baseLocation);
  //   }
  //   return list;
  // }

  List<PlacePreviewUIModel> _distanceQuickSort(List<PlacePreviewUIModel> list,
      int low, int high, Sorting sortType, LatLngUIModel baseLocation) {
    if (low < high) {
      late int pi;

      pi = distancePartition(list, low, high, baseLocation);

      _distanceQuickSort(list, low, pi - 1, sortType, baseLocation);
      _distanceQuickSort(list, pi + 1, high, sortType, baseLocation);
    }
    return list;
  }

  List<PlacePreviewUIModel> _visitingQuickSort(
      List<PlacePreviewUIModel> list, int low, int high) {
    if (low < high) {
      late int pi;

      pi = visitingPartition(list, low, high);

      _visitingQuickSort(list, low, pi - 1);
      _visitingQuickSort(list, pi + 1, high);
    }
    return list;
  }

  int distancePartition(
      List<PlacePreviewUIModel> list, low, high, LatLngUIModel baseLocation) {
    if (list.isEmpty) {
      return 0;
    }
    double pivot = list[high].meterDistance(baseLocation);
    int i = low - 1;
    for (int j = low; j < high; j++) {
      if (list[j].meterDistance(baseLocation) < pivot) {
        i++;
        swap(list, i, j);
      }
    }
    swap(list, i + 1, high);
    return i + 1;
  }

  int visitingPartition(List<PlacePreviewUIModel> list, low, high) {
    if (list.isEmpty) {
      return 0;
    }
    int pivot = list[high].totalReviews;
    int i = low - 1;
    for (int j = low; j < high; j++) {
      if (list[j].totalReviews > pivot) {
        i++;
        swap(list, i, j);
      }
    }
    swap(list, i + 1, high);
    return i + 1;
  }

  void swap(List<PlacePreviewUIModel> list, int i, int j) {
    PlacePreviewUIModel temp = list[i];
    list[i] = list[j];
    list[j] = temp;
  }
}
