import 'package:flutter/foundation.dart';
import 'package:withconi/core/error_handling/error_message_object.dart';

import 'failures.dart';
import '../../global_widgets/snackbar.dart';

class FailureInterpreter {
  FailureInterpreter._internal();
  static final _singleton = FailureInterpreter._internal();
  factory FailureInterpreter() => _singleton;

  mapFailureToDialog(Failure _failure, String occurMethod) {
    ErrorObject errorMessage =
        ErrorObject.mapFailureToErrorMessage(failure: _failure);

    if (kDebugMode) {
      print(
        '\n❤️‍🔥 FAIL[$_failure] => METHOD FROM: $occurMethod\n📍 title: ${errorMessage.title}\n📍 message: ${errorMessage.message}',
      );
    }

    return showCustomSnackbar(text: errorMessage.message);
  }

  String mapFailureToText(Failure _failure) {
    ErrorObject errorMessage =
        ErrorObject.mapFailureToErrorMessage(failure: _failure);

    return errorMessage.message;
  }

  mapFailureToSnackbar(Failure _failure, String occurMethod) {
    ErrorObject errorMessage =
        ErrorObject.mapFailureToErrorMessage(failure: _failure);

    if (kDebugMode) {
      print(
        '\n❤️‍🔥 FAIL[$_failure] => METHOD FROM: $occurMethod\n📍 title: ${errorMessage.title}\n📍 message: ${errorMessage.message}',
      );
    }

    return showCustomSnackbar(text: errorMessage.message);
  }

  mapFailureToPage(Failure _failure, String occurMethod) {
    ErrorObject errorMessage =
        ErrorObject.mapFailureToErrorMessage(failure: _failure);
    if (kDebugMode) {
      print(
        '\n❤️‍🔥 FAIL[$_failure] => METHOD FROM: $occurMethod\n📍 title: ${errorMessage.title}\n📍 message: ${errorMessage.message}',
      );
    }
    return showCustomSnackbar(text: errorMessage.message);
  }
}
