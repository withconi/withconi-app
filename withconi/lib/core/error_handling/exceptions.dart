import 'package:dio/dio.dart';

class BadRequestException extends DioError implements Exception {
  BadRequestException(RequestOptions r) : super(requestOptions: r);

  @override
  String toString() {
    return 'Invalid request';
  }
}

class InternalServerErrorException extends DioError implements Exception {
  InternalServerErrorException(RequestOptions r) : super(requestOptions: r);

  @override
  String toString() {
    return 'Unknown error occurred, please try again later.';
  }
}

class ConflictException extends DioError implements Exception {
  ConflictException(RequestOptions r) : super(requestOptions: r);

  @override
  String toString() {
    return 'Conflict occurred';
  }
}

class UnauthorizedException extends DioError implements Exception {
  UnauthorizedException(RequestOptions r) : super(requestOptions: r);

  @override
  String toString() {
    return 'Access denied, wrong token';
  }
}

class NotFoundException extends DioError implements Exception {
  NotFoundException(RequestOptions r) : super(requestOptions: r);

  @override
  String toString() {
    return 'The requested information could not be found';
  }
}

class NoInternetConnectionException extends DioError implements Exception {
  NoInternetConnectionException(RequestOptions r) : super(requestOptions: r);

  @override
  String toString() {
    return 'No internet connection detected, please try again.';
  }
}

class TimeOutException extends DioError implements Exception {
  TimeOutException(RequestOptions r) : super(requestOptions: r);

  @override
  String toString() {
    return 'The connection has timed out, please try again.';
  }
}

class NoDataException implements Exception {
  @override
  String toString() {
    return 'Success, but empty list';
  }
}

class WrongPasswordException implements Exception {
  @override
  String toString() {
    return 'Success, but empty list';
  }
}

class NoUserException implements Exception {
  @override
  String toString() {
    return 'Success, but empty list';
  }
}

class DataParsingException implements Exception {
  @override
  String toString() {
    return 'Success, but empty list';
  }
}

class MaxListException implements Exception {
  @override
  String toString() {
    return 'Max list';
  }
}

class EmptyListException implements Exception {
  @override
  String toString() {
    return 'Empty list';
  }
}

class PlatformException implements Exception {
  @override
  String toString() {
    return 'Success, but empty list';
  }
}

class SignInCredentialException implements Exception {
  @override
  String toString() {
    return 'Success, but empty list';
  }
}

class CustomFirebaseAuthException implements Exception {
  final CREATE_EMAIL type;
  CustomFirebaseAuthException({required this.type});
}

enum CREATE_EMAIL {
  existingEmail,
  weakPassword,
  accountEnabled,
}

class CreateUserEmailException implements Exception {
  @override
  String toString() {
    return 'Success, but empty list';
  }
}

class SignInTokenException implements Exception {
  @override
  String toString() {
    return 'Success, but empty list';
  }
}

class PlatformSignInException implements Exception {
  @override
  String toString() {
    return 'Success, but empty list';
  }
}
