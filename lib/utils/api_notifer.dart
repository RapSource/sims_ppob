import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ApiNotifier extends ChangeNotifier {
  static const String baseUrl =
      'https://take-home-test-api.nutech-integrasi.app';

  Dio dio = Dio(BaseOptions(
    baseUrl: baseUrl,
    receiveDataWhenStatusError: true,
    connectTimeout: const Duration(seconds: 10),
    receiveTimeout: const Duration(seconds: 10),
  ));

  String accessToken = '';

  Future get(
      {required String endpoint,
      String? contentType,
      Map<String, dynamic>? queryParameters}) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    accessToken = prefs.getString('token') ?? '';
    try {
      var response = await dio.get(
        endpoint,
        queryParameters: queryParameters,
        options: Options(
          headers: {
            "Content-type": contentType,
            "Authorization": "Bearer $accessToken",
          },
        ),
      );
      return response;
    } on DioException catch (e) {
      log(e.message ?? '');
    }
  }

  Future post(
      {required String endpoint,
      dynamic data,
      Map<String, dynamic>? queryParameters,
      String? contentType = "application/json",
      String? token}) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    accessToken = prefs.getString('token') ?? '';
    try {
      var response = await dio.post(
        endpoint,
        data: data,
        queryParameters: queryParameters,
        options: Options(
          headers: {
            "Content-type": contentType,
            "Authorization": "Bearer $accessToken",
          },
          followRedirects: false,
          validateStatus: (status) {
            return (status ?? 0) < 500;
          },
        ),
      );
      return response;
    } on DioException catch (e) {
      log(e.message.toString());
    }
  }

  Future put({
    required String endpoint,
    dynamic data,
    Map<String, dynamic>? queryParameters,
    String? contentType,
  }) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    accessToken = prefs.getString('token') ?? '';
    try {
      var response = await dio.put(
        endpoint,
        data: data,
        queryParameters: queryParameters,
        options: Options(
          headers: {
            "Content-type": contentType,
            "Authorization": "Bearer $accessToken",
          },
        ),
      );
      return response;
    } on DioException catch (e) {
      log(e.message ?? '');
    }
  }

  Future delete({
    required String endpoint,
    dynamic data,
    Map<String, dynamic>? queryParameters,
    String? contentType,
  }) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    accessToken = prefs.getString('token') ?? '';
    try {
      var response = await dio.delete(
        endpoint,
        data: data,
        queryParameters: queryParameters,
        options: Options(
          headers: {
            "Content-type": contentType,
            "Authorization": "Bearer $accessToken",
          },
        ),
      );
      return response;
    } on DioException catch (e) {
      log(e.message ?? '');
    }
  }
}
