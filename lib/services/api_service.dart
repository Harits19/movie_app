import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:majootestcase/models/movie_response.dart';
import 'package:majootestcase/services/dio_config_service.dart' as dioConfig;
import 'package:majootestcase/utils/error_helper.dart';

class ApiServices {
  static Future<void> getMovieList({
    required ValueChanged<MovieResponse> onSuccess,
    required ValueChanged<String> onError,
  }) async {
    print({"called", ApiServices, getMovieList});
    try {
      final dio = dioConfig.createInstance();
      Response<String> response = await dio.request(
        "/auto-complete",
        queryParameters: {
          "q": 'game of thr',
        },
      );
      final movieResponse = MovieResponse.fromJson(jsonDecode(response.data!));
      onSuccess(movieResponse);
    } catch (e) {
      print(e.toString());
      onError(ErrorHelper.apiError(e));
    }
  }
}
