class StudentCourseRepositoryException implements Exception {
  final int code;
  final String message;
  StudentCourseRepositoryException({
    required this.code,
    required this.message,
  });
}
