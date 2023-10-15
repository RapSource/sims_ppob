import 'package:flutter/material.dart';
import 'package:sims_ppob_adityapratama/model/services.dart';

class ItemServices extends StatelessWidget {
  const ItemServices({super.key, required this.service});

  final Data service;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Image.network(service.serviceIcon ?? ''),
        Text(service.serviceName?.split(' ').first ?? ''),
      ],
    );
  }
}
