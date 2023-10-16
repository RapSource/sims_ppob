import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:sims_ppob_adityapratama/model/profile.dart';
import 'package:sims_ppob_adityapratama/utils/api_notifer.dart';
import 'package:sims_ppob_adityapratama/utils/endpoint.dart';

class UpdateNotifier extends ChangeNotifier {
  final ApiNotifier apiNotifier;

  UpdateNotifier({required this.apiNotifier});

  String _message = '';
  String get message => _message;

  bool _isSuccess = false;
  bool get isSuccess => _isSuccess;

  Profile? _profile;

  Profile? get profile => _profile;

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

  Future<void> update(
      {required String email,
      required String firstName,
      required String lastName,
      String? password,
      String? profileImage}) async {
    try {
      _message = '';
      var parameter = {
        "email": email,
        "first_name": firstName,
        "last_name": lastName,
        "password": password,
        "profile_image": profileImage
      };
      var response =
          await apiNotifier.put(endpoint: Endpoint.editProfile, data: parameter);

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
