class NetworkException implements Exception {
  String? message;
  int? statusCode;
  String? errorMessage;

  NetworkException({this.message, this.statusCode, this.errorMessage});
}
