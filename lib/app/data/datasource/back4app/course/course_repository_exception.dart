class CourseRepositoryException implements Exception {
  final int code;
  final String message;
  CourseRepositoryException({
    required this.code,
    required this.message,
  });
}
