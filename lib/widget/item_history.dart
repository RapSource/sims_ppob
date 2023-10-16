import 'package:flutter/material.dart';
import 'package:sims_ppob_adityapratama/model/transaction_history.dart';

class ItemHistory extends StatelessWidget {
  const ItemHistory({super.key, required this.history});

  final Record history;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: const EdgeInsets.all(15),
          height: 100,
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(
              border: Border.all(width: 0.5),
              borderRadius: BorderRadius.circular(10)),
          child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      '+ Rp.${history.totalAmount}',
                      style: TextStyle(
                          color: Colors.cyan,
                          fontSize: 25,
                          fontWeight: FontWeight.bold),
                    ),
                    Text(history.description ?? '')
                  ],
                ),
                Text(
                  '${history.createdOn} WIB',
                  style: TextStyle(color: Colors.grey[400]),
                )
              ]),
        )
      ],
    );
  }
}
