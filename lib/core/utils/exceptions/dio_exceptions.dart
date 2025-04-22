import 'package:dio/dio.dart';

class DioExceptions {
  static String handleError(dynamic error) {
    if (error is DioException) {
      switch (error.type) {
        case DioExceptionType.connectionTimeout:
          return "Connection timeout, please try again later.";
        case DioExceptionType.sendTimeout:
          return "Send timeout, please try again later.";
        case DioExceptionType.receiveTimeout:
          return "Receive timeout, please try again later.";
        case DioExceptionType.badResponse:
          return _handleBadResponse(error.response);
        case DioExceptionType.cancel:
          return "Request was cancelled.";
        case DioExceptionType.connectionError:
          return "No internet connection. Please check your network settings.";
        case DioExceptionType.unknown:
          return "Something went wrong. Please check your internet connection.";
        default:
          return "Unexpected error occurred.";
      }
    } else {
      return error.toString();
    }
  }

  static String _handleBadResponse(Response? response) {
    if (response == null) return "No response from server.";
    switch (response.statusCode) {
      case 400:
        return "Bad request, please check your input.";
      case 401:
        return "Unauthorized, please check your credentials.";
      case 403:
        return "Forbidden, you do not have permission.";
      case 404:
        return "Resource not found.";
      case 500:
        return "Internal server error, try again later.";
      default:
        return "Error ${response.statusCode}: ${response.statusMessage}";
    }
  }
}