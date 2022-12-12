import 'package:freezed_annotation/freezed_annotation.dart';
part 'page_status.freezed.dart';

@freezed
class PageStatus with _$PageStatus {
  const PageStatus._(); // This constructor is needed to have custom methods in Freezed.
  const factory PageStatus.init([String? title, String? message]) =
      InitPageStatus;
  const factory PageStatus.loading([double? loadingHeight]) = LoadingPageStatus;
  const factory PageStatus.loadingMore() = LoadingMorePageStatus;
  const factory PageStatus.emptyLastPage() = EmptyLastPageStatus;
  const factory PageStatus.empty([String? title, String? message]) =
      EmptyPageStatus;
  const factory PageStatus.success() = SuccessPageStatus;
  const factory PageStatus.error(String message) = ErrorPageStatus;
}
