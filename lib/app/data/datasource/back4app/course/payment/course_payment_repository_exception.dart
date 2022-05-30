class CoursePaymentRepositoryException implements Exception {
  final int code;
  final String message;
  CoursePaymentRepositoryException({
    required this.code,
    required this.message,
  });
}
