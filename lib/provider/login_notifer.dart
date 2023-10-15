import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sims_ppob_adityapratama/utils/api_notifer.dart';
import 'package:sims_ppob_adityapratama/utils/endpoint.dart';

class LoginNotifier extends ChangeNotifier {
  final ApiNotifier apiNotifier;

  LoginNotifier({required this.apiNotifier});

  String _message = '';

  String get message => _message;

  bool _isSuccess = false;

  bool get isSuccess => _isSuccess;

  Future<void> login({required String email, required String password}) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    try {
      _message = '';
      var parameter = {"email": email, "password": password};
      var response =
          await apiNotifier.post(endpoint: Endpoint.login, data: parameter);

      if (response.statusCode == 200) {
        _isSuccess = true;
        await prefs.setString('token', response.data['data']['token']);
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
