class ProductRepositoryException implements Exception {
  final int code;
  final String message;
  ProductRepositoryException({
    required this.code,
    required this.message,
  });
}
