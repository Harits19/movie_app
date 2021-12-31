import 'dart:async';
import 'package:dio/dio.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

Dio createInstance() {
  var options = BaseOptions(
      baseUrl: "https://imdb8.p.rapidapi.com",
      connectTimeout: 12000,
      receiveTimeout: 12000,
      headers: {
        'x-rapidapi-host': 'imdb8.p.rapidapi.com',
        'x-rapidapi-key': 'fa34d33d0emsha549bdcc1990b59p1b5c4cjsn51de0bd2fef1'
      });
  final dioInstance = new Dio(options);
  dioInstance.interceptors.add(PrettyDioLogger(
      requestHeader: true,
      requestBody: true,
      responseBody: true,
      responseHeader: false,
      error: true,
      compact: true,
      maxWidth: 90));
  return dioInstance;
}
