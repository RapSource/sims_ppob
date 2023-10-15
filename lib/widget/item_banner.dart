import 'package:flutter/material.dart';
import 'package:sims_ppob_adityapratama/model/banner.dart';

class ItemBanner extends StatelessWidget {
  const ItemBanner({super.key, required this.banner});

  final Data banner;

  @override
  Widget build(BuildContext context) {
    return Image.network(
      banner.bannerImage ?? '',
      width: MediaQuery.of(context).size.width / 1.5,
    );
  }
}