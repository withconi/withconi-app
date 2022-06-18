import '../core/error_handling/failures.dart';
import '../ui/widgets/snackbar.dart';

class ExceptionController {
  ExceptionController._internal();
  static final _singleton = ExceptionController._internal();
  factory ExceptionController() => _singleton;

  mapFailureToDialog(Failure? _failure) {
    if (_failure == null) {
      return;
    }

    return _failure.when(
      dataParsingFailure: (title, message) => print(title),
      noConnectionFailure: (title, message) => showSnackbar(text: message),
      serverFailure: (title, message) => print(title),
      noUserDataFailure: (String? title, String message) =>
          showSnackbar(text: message),
      maxListFailure: (String? title, String message) =>
          showSnackbar(text: message),
    );
  }

  mapFailureToSnackbar(Failure? _failure) {
    if (_failure == null) {
      return;
    }

    return _failure.when(
      dataParsingFailure: (title, message) => showSnackbar(text: message),
      noConnectionFailure: (title, message) => showSnackbar(text: message),
      serverFailure: (title, message) => showSnackbar(text: message),
      noUserDataFailure: (String? title, String message) =>
          showSnackbar(text: message),
      maxListFailure: (String? title, String message) =>
          showSnackbar(text: message),
    );
  }

  mapFailureToPage(Failure? _failure) {
    if (_failure == null) {
      return;
    }

    return _failure.when(
      dataParsingFailure: (title, message) => print(title),
      noConnectionFailure: (title, message) => showSnackbar(text: message),
      serverFailure: (title, message) => print(title),
      noUserDataFailure: (String? title, String message) =>
          showSnackbar(text: message),
      maxListFailure: (String? title, String message) =>
          showSnackbar(text: message),
    );
  }
}
