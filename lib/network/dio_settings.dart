import 'package:dio/dio.dart';

class DioSettings {
  DioSettings() {
    setUp();
  }
  final dio = Dio(BaseOptions(headers: {'Accept': 'application/json'}));
  void setUp() {
    final interceptors = dio.interceptors;
    final loginterceptors = LogInterceptor(
      request: true,
      requestBody: true,
      requestHeader: true,
      responseBody: true,
      responseHeader: true,
      error: true,
    );
    interceptors.clear();
    interceptors.add(loginterceptors);
  }
}
