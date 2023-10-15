import 'package:flutter/material.dart';
import 'package:sims_ppob_adityapratama/utils/api_notifer.dart';

class TopUpNotifier extends ChangeNotifier {
  final ApiNotifier apiNotifier;

  TopUpNotifier({required this.apiNotifier});
}