import 'package:withconi/core/error_handling/error_message_object.dart';

import '../core/error_handling/failures.dart';
import '../ui/widgets/snackbar.dart';

class ExceptionController {
  ExceptionController._internal();
  static final _singleton = ExceptionController._internal();
  factory ExceptionController() => _singleton;

  mapFailureToDialog(Failure _failure) {
    ErrorMessage errorMessage =
        ErrorMessage.mapFailureToErrorMessage(failure: _failure);

    return showSnackbar(text: errorMessage.message);
  }

  mapFailureToSnackbar(Failure _failure) {
    ErrorMessage errorMessage =
        ErrorMessage.mapFailureToErrorMessage(failure: _failure);

    return showSnackbar(text: errorMessage.message);
  }

  mapFailureToPage(Failure _failure) {
    ErrorMessage errorMessage =
        ErrorMessage.mapFailureToErrorMessage(failure: _failure);

    return showSnackbar(text: errorMessage.message);
  }
}
