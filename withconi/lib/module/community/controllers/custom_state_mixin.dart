import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:get/get_instance/src/lifecycle.dart';
import 'package:get/get_state_manager/src/simple/list_notifier.dart';
import 'package:get/get_state_manager/src/simple/simple_builder.dart';
import 'package:withconi/global_widgets/error_widget/error_widget.dart';
import 'package:withconi/global_widgets/loading/loading_page.dart';
import 'package:withconi/module/page_status.dart';
import 'package:withconi/module/theme/sizes.dart';

import '../../theme/colors.dart';

mixin WcStateMixin<T> on ListNotifierMixin {
  T? _value;
  PageStatus? _status;

  bool _isNullOrEmpty(dynamic val) {
    if (val == null) return true;
    var result = false;
    if (val is Iterable) {
      result = val.isEmpty;
    } else if (val is String) {
      result = val.isEmpty;
    } else if (val is Map) {
      result = val.isEmpty;
    }
    return result;
  }

  void _fillEmptyStatus() {
    _status = _isNullOrEmpty(_value)
        ? const PageStatus.loading()
        : const PageStatus.success();
  }

  PageStatus get status {
    notifyChildrens();
    return _status ??= _status = const PageStatus.loading();
  }

  T? get state => value;

  @protected
  T? get value {
    notifyChildrens();
    return _value;
  }

  @protected
  set value(T? newValue) {
    if (_value == newValue) return;
    _value = newValue;
    refresh();
  }

  @protected
  void change(T? newState, {PageStatus? status}) {
    var _canUpdate = false;
    if (status != null) {
      _status = status;
      _canUpdate = true;
    }
    if (newState != _value) {
      _value = newState;
      _canUpdate = true;
    }
    if (_canUpdate) {
      refresh();
    }
  }

  void append(Future<T> Function() body(), {String? errorMessage}) {
    final compute = body();
    compute().then((newValue) {
      change(newValue, status: const PageStatus.success());
    }, onError: (err) {
      change(state, status: PageStatus.error(errorMessage ?? err.toString()));
    });
  }
}

class Value<T> extends ListNotifier
    with WcStateMixin<T>
    implements ValueListenable<T?> {
  Value(T val) {
    _value = val;
    _fillEmptyStatus();
  }

  @override
  T? get value {
    notifyChildrens();
    return _value;
  }

  @override
  set value(T? newValue) {
    if (_value == newValue) return;
    _value = newValue;
    refresh();
  }

  T? call([T? v]) {
    if (v != null) {
      value = v;
    }
    return value;
  }

  void update(void fn(T? value)) {
    fn(value);
    refresh();
  }

  @override
  String toString() => value.toString();

  dynamic toJson() => (value as dynamic)?.toJson();
}

extension ReactiveT<T> on T {
  Value<T> get reactive => Value<T>(this);
}

typedef Condition = bool Function();

abstract class GetNotifier<T> extends Value<T> with GetLifeCycleBase {
  GetNotifier(T initial) : super(initial) {
    $configureLifeCycle();
  }

  @override
  @mustCallSuper
  void onInit() {
    super.onInit();
    SchedulerBinding.instance?.addPostFrameCallback((_) => onReady());
  }
}

extension StateExt<T> on WcStateMixin<T> {
  Widget obx({
    Widget? onError,
    // Widget? onLoading,
    Widget? onLoading,
    Widget? onInit,
    Widget? onLoadingMore,
    Widget? onEmpty,
    // required Widget onSuccess,
    required NotifierBuilder<T?> onSuccess,
  }) {
    return SimpleBuilder(builder: (_) {
      return status.maybeMap(
        init: (init) => (onInit == null)
            ? (value != null)
                ? onSuccess(value)
                : SizedBox.shrink()
            : onInit,
        loading: (loading) => (onLoading == null)
            ? (value != null)
                ? onSuccess(value)
                : LoadingPage(
                    height: loading.loadingHeight ?? WcHeight - 270,
                  )
            : onLoading,
        // loadingMore: (value) => onMoreLoading ?? Size,
        // emptyLastPage: emptyLastPage,
        empty: (empty) => (onEmpty == null)
            ? (value != null)
                ? onSuccess(value)
                : WcErrorWidget(
                    height: WcHeight - 270,
                    image: Image.asset(
                      'assets/icons/no_result.png',
                      height: 76,
                    ),
                    title: empty.title ?? '검색 결과가 없습니다',
                    message: empty.message ?? '다른 검색어로 시도해주세요 :)',
                  )
            : onEmpty,
        // onSuccess(value),
        // success: ,
        error: (error) => (onError == null)
            ? (value != null)
                ? onSuccess(value)
                : WcErrorWidget(
                    height: WcHeight - 300,
                    image: Image.asset(
                      'assets/icons/no_result.png',
                      height: 76,
                    ),
                    title: error.message,
                    message: '',
                  )
            : onError,

        success: (success) => onSuccess(value),
        orElse: () => onSuccess(value),
      );
    });
  }
}

typedef NotifierBuilder<T> = Widget Function(T state);
