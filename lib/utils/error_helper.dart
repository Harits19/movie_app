import 'dart:io';
import 'package:dio/dio.dart';

class ErrorHelper {
  static apiError(dynamic error) {
    String? message = "Something went wrong";
    print(
        'error === ${error.response}  ==== ${error.response != null ? error.response?.data : 'noresponse'} ==== ${error.response != null ? error.response?.extra : 'no response'}=== ${error.message}');
    if (error is DioError) {
      if (error.error is SocketException ||
          error.type == DioErrorType.connectTimeout) {
        message =
            "Cannot connect to server. Make sure you have proper internet connection";
      } else if (error.response != null &&
          error.response?.data['message'] != null) {
        message = error.response?.data['message'];
      } else {
        message = error.message;
      }
    }
    return message;
  }
}
