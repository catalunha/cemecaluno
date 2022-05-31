class StudentCartRepositoryException implements Exception {
  final int code;
  final String message;
  StudentCartRepositoryException({
    required this.code,
    required this.message,
  });
}
