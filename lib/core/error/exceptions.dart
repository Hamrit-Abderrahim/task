class ServerException implements Exception {
  final String error;

  ServerException({required this.error});
}

//*******************In Case Local Data */
class LocalDataException implements Exception {
  final String erroMessage;

  LocalDataException(this.erroMessage);
}
