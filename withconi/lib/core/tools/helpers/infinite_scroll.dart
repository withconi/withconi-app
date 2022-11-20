import 'package:withconi/import_basic.dart';
import '../../../module/page_status.dart';

abstract class InfiniteScroll {
  late final Rx<PaginationFilter> _paginationFilter;
  late ScrollController infiniteScrollController;
  double get nextPageTrigger;

  late Rx<PageStatus> pageStatus;

  void addInfiniteScrollListener() {}

  void loadNextPage() => changePaginationFilter(1, 3);
  void loadNewPage() => changePaginationFilter(1, 3);

  void changePaginationFilter(int page, int listSize) {
    _paginationFilter.value.page = page;
    _paginationFilter.value.listSize = listSize;
  }

  Future<void> getDataByPaginationFilter(
      PaginationFilter _paginationFilter) async {}
}

class PaginationFilter {
  int page;
  int listSize;

  PaginationFilter({required this.page, required this.listSize, e});

  @override
  String toString() => 'PaginationFilter(page: $page, limit: $listSize)';

  @override
  bool operator ==(Object o) {
    if (identical(this, o)) return true;

    return o is PaginationFilter && o.page == page && o.listSize == listSize;
  }

  @override
  int get hashCode => page.hashCode ^ listSize.hashCode;
}
