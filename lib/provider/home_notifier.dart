import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:sims_ppob_adityapratama/model/balance.dart';
import 'package:sims_ppob_adityapratama/model/banner.dart';
import 'package:sims_ppob_adityapratama/model/profile.dart';
import 'package:sims_ppob_adityapratama/model/services.dart';
import 'package:sims_ppob_adityapratama/utils/api_notifer.dart';
import 'package:sims_ppob_adityapratama/utils/endpoint.dart';

class HomeNotifier extends ChangeNotifier {
  final ApiNotifier apiNotifier;

  HomeNotifier({required this.apiNotifier});

  Profile? _profile;

  Profile? get profile => _profile;

  Balance? _balance;

  Balance? get balance => _balance;

  Services? _services;

  Services? get services => _services;

  BannerModel? _banner;

  BannerModel? get banner => _banner;

  void getProfile() async {
    try {
      var response = await apiNotifier.get(endpoint: Endpoint.profile);

      if (response.statusCode == 200) {
        _profile = Profile.fromJson(response.data);

        notifyListeners();
      }

      log('cek response $response}');
    } on DioException catch (e) {
      log('error profile ${e.message}');
    }
  }

  void getBalance() async {
    try {
      var response = await apiNotifier.get(endpoint: Endpoint.balance);

      if (response.statusCode == 200) {
        _balance = Balance.fromJson(response.data);

        notifyListeners();
      }

      log('cek response $response}');
    } on DioException catch (e) {
      log('error profile ${e.message}');
    }
  }

  void getServices() async {
    try {
      var response = await apiNotifier.get(endpoint: Endpoint.services);

      if (response.statusCode == 200) {
        _services = Services.fromJson(response.data);
        notifyListeners();
      }

      log('cek response $response}');
    } on DioException catch (e) {
      log('error profile ${e.message}');
    }
  }

  void getBanner() async {
    try {
      var response = await apiNotifier.get(endpoint: Endpoint.banner);

      if (response.statusCode == 200) {
        _banner = BannerModel.fromJson(response.data);
        notifyListeners();
      }

      log('cek response $response}');
    } on DioException catch (e) {
      log('error profile ${e.message}');
    }
  }
}
