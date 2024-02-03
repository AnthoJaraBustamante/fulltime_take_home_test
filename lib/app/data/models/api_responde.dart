class ApiResponse<T> {
  final String message;
  final T data;
  final bool success;

  ApiResponse({required this.message, required this.data, required this.success});
}