import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:sims_ppob_adityapratama/utils/api_notifer.dart';

import '../model/balance.dart';
import '../utils/endpoint.dart';

class TopUpNotifier extends ChangeNotifier {
  final ApiNotifier apiNotifier;

  TopUpNotifier({required this.apiNotifier});

  bool _isSuccess = false;

  bool get isSuccess => _isSuccess;

  String _message = '';

  String get message => _message;

  Balance? _balance;

  Balance? get balance => _balance;

  Future<void> topUp({required int amount}) async {
    _isSuccess = false;
    try {
      var parameter = {"top_up_amount": amount};
      var response =
          await apiNotifier.post(endpoint: Endpoint.topup, data: parameter);

      if (response.statusCode == 200) {
        _isSuccess = true;
        _message = response.data['message'];
        getBalance();
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

  void getBalance() async {
    try {
      var response = await apiNotifier.get(endpoint: Endpoint.balance);

      if (response.statusCode == 200) {
        _balance = Balance.fromJson(response.data);

        notifyListeners();
      }

      log('cek response balance $response}');
    } on DioException catch (e) {
      log('error profile ${e.message}');
    }
  }
}
