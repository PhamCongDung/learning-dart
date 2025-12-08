class ApiResponse<T> {
  final T? data;
  final String? error;
  ApiResponse._({this.data, this.error});
  factory ApiResponse.success(T data) {
    return ApiResponse._(data: data, error: null);
  }
  factory ApiResponse.failure(String error) {
    return ApiResponse._(data: null, error: error);
  }
  bool get isSuccess => error == null;
}

void main() {
  var success = ApiResponse<int>.success(200);
  print(success.isSuccess);
  print(success.data);
}
