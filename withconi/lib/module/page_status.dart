import 'package:freezed_annotation/freezed_annotation.dart';
part 'page_status.freezed.dart';

@freezed
class PageStatus with _$PageStatus {
  const PageStatus._(); // This constructor is needed to have custom methods in Freezed.
  const factory PageStatus.init() = InitPageStatus;
  const factory PageStatus.loading() = LoadingPageStatus;
  const factory PageStatus.loadingMore() = LoadingMorePageStatus;
  const factory PageStatus.emptyLastPage() = EmptyLastPageStatus;
  const factory PageStatus.empty() = EmptyPageStatus;
  const factory PageStatus.success() = SuccessPageStatus;
  const factory PageStatus.error(String message) = ErrorPageStatus;
}
