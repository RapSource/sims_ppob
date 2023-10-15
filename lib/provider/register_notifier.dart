import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:sims_ppob_adityapratama/utils/api_notifer.dart';
import 'package:sims_ppob_adityapratama/utils/endpoint.dart';

class RegisterNotifier extends ChangeNotifier {
  final ApiNotifier apiNotifier;

  RegisterNotifier({required this.apiNotifier});

  String _message = '';
  String get message => _message;

  bool _isSuccess = false;
  bool get isSuccess => _isSuccess;

  Future<void> register(
      {required String email,
      required String firstName,
      required String lastName,
      required String password}) async {
    try {
      _message = '';
      var parameter = {
        "email": email,
        "first_name": firstName,
        "last_name": lastName,
        "password": password
      };
      var response =
          await apiNotifier.post(endpoint: Endpoint.register, data: parameter);

      if (response.statusCode == 200) {
        _isSuccess = true;
        notifyListeners();
      } else {
        _isSuccess = false;
        _message = response.data['message'];
        notifyListeners();
      }

      log('cek response $response}');
    } on DioException catch (e) {
      log('error register ${e.message}');
    }
  }
}
