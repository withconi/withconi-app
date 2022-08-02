// import 'package:withconi/import_basic.dart';

// import 'ui_helper/infinite_scroll.dart';

// class InfiniteScrollController extends GetxController {
//   final _dataList = <dynamic>[].obs;
//   final _paginationFilter = PaginationFilter().obs;
//   final _lastPage = false.obs;

//   List<dynamic> get dataList => _dataList.toList();
//   int get limit => _paginationFilter.value.limit!;
//   int get _page => _paginationFilter.value.page!;
//   bool get lastPage => _lastPage.value;

//   @override
//   onInit() {
//     ever(_paginationFilter, (_) => _getMoreData());
//     _changePaginationFilter(1, 15);
//     super.onInit();
//   }

//   Future<List<dynamic>> _getMoreData(
//       {required Future<dynamic> Function() asyncFunction}) async {
//     List<dynamic> dataList = await asyncFunction();
//     if (dataList.isEmpty) {
//       _lastPage.value = true;
//     }
//     return dataList;
//   }

//   void changeTotalPerPage(int limitValue) {
//     _dataList.clear();
//     _lastPage.value = false;
//     _changePaginationFilter(1, limitValue);
//   }

//   void _changePaginationFilter(int page, int limit) {
//     _paginationFilter.update((val) {
//       val!.page = page;
//       val.limit = limit;
//     });
//   }

//   void loadNextPage() => _changePaginationFilter(_page + 1, limit);
// }
