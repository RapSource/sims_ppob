import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:sims_ppob_adityapratama/model/transaction_history.dart';
import 'package:sims_ppob_adityapratama/utils/api_notifer.dart';

import '../model/balance.dart';
import '../utils/endpoint.dart';

class TransactionNotifier extends ChangeNotifier {
  final ApiNotifier apiNotifier;

  TransactionNotifier({required this.apiNotifier});

  TransactionHistory? _transactionHistory;

  TransactionHistory? get transactionHistory => _transactionHistory;

  Balance? _balance;

  Balance? get balance => _balance;

  void getTransactionHistory() async {
    try {
      var response =
          await apiNotifier.get(endpoint: Endpoint.transactionHistory);

      if (response.statusCode == 200) {
        _transactionHistory = TransactionHistory.fromJson(response.data);

        notifyListeners();
      }

      log('cek response history $response}');
    } on DioException catch (e) {
      log('error history ${e.message}');
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
