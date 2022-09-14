// import 'package:withconi/ui/entities/custom_marker.dart';

// class QuickSort {
//   sortPlaceListByDistance({required List<CustomMarker> placeMarkerList}) {
//     int high = placeMarkerList.length - 1;
//     int low = 0;
//     List<CustomMarker> result = _quickSort(placeMarkerList, low, high);

//     return result;
//   }

//   List<CustomMarker> _quickSort(List<CustomMarker> list, int low, int high) {
//     if (low < high) {
//       int pi = partition(list, low, high);
//       _quickSort(list, low, pi - 1);
//       _quickSort(list, pi + 1, high);
//     }
//     return list;
//   }

//   int partition(List<CustomMarker> list, low, high) {
//     if (list.isEmpty) {
//       return 0;
//     }
//     double pivot = list[high].distance;
//     int i = low - 1;
//     for (int j = low; j < high; j++) {
//       if (list[j].distance < pivot) {
//         i++;
//         swap(list, i, j);
//       }
//     }
//     swap(list, i + 1, high);
//     return i + 1;
//   }

//   void swap(List<CustomMarker> list, int i, int j) {
//     CustomMarker temp = list[i];
//     list[i] = list[j];
//     list[j] = temp;
//   }
// }
