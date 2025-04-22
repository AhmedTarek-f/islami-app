import 'package:dio/dio.dart';
import 'package:islami_app/core/utils/exceptions/dio_exceptions.dart';

abstract class ApiService {
  static final Dio _dio = Dio(
    BaseOptions(
      connectTimeout: const Duration(seconds: 10),
      receiveTimeout: const Duration(seconds: 10),
      headers: {
        "Content-Type": "application/json",
      },
    ),
  );

  // GET Request
  static Future<Response?> getRequest(String endpoint, {Map<String, dynamic>? queryParams,Map<String, String>? headers}) async {
    try {
      Response response = await _dio.get(
          endpoint,
          queryParameters: queryParams,
          options: Options(
              headers: headers
          )
      );
      return response;
    } catch (e) {
      throw DioExceptions.handleError(e);
    }
  }

  // POST Request
  static Future<Response?> postRequest(String endpoint, {Map<String, dynamic>? data, Map<String, dynamic>? queryParams, Map<String, String>? headers,}) async {
    try {
      Response response = await _dio.post(
          endpoint,
          data: data,
          queryParameters: queryParams,
          options: Options(
              headers: headers
          )
      );
      return response;
    } catch (e) {
      throw DioExceptions.handleError(e);
    }
  }

  // PUT Request
  static Future<Response?> putRequest(String endpoint, {Map<String, dynamic>? data, Map<String, dynamic>? queryParams}) async {
    try {
      Response response = await _dio.put(endpoint, data: data, queryParameters: queryParams);
      return response;
    } catch (e) {
      throw DioExceptions.handleError(e);
    }
  }

  // DELETE Request
  static Future<Response?> deleteRequest(String endpoint, {Map<String, dynamic>? queryParams}) async {
    try {
      Response response = await _dio.delete(endpoint, queryParameters: queryParams);
      return response;
    } catch (e) {
      throw DioExceptions.handleError(e);
    }
  }
}
