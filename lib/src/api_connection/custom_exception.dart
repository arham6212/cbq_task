class CustomException implements Exception {
  final String message;

  CustomException(this.message);

  @override
  String toString() {
    return message;
  }
}

class FetchDataException extends CustomException {
  FetchDataException(String message) : super(message);
}

class BadRequestException extends CustomException {
  BadRequestException(String message) : super(message);
}

class UnauthorisedException extends CustomException {
  UnauthorisedException(String message) : super(message);
}
