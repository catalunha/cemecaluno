class CourseOfferRepositoryException implements Exception {
  final int code;
  final String message;
  CourseOfferRepositoryException({
    required this.code,
    required this.message,
  });
}
