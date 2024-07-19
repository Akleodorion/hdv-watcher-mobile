class ServerException implements Exception {
  final String errorMessage;

  ServerException({required this.errorMessage});
}

class UtilException implements Exception {
  final String errorMessage;

  UtilException({required this.errorMessage});
}
