import 'package:flutter/material.dart';

class ItemCard extends StatelessWidget {
  const ItemCard({
    Key? key,
    required this.courentPcost,
    required this.totalCost,
    required this.QTY,
    required this.itemName,
    required this.nickName,
    required this.perCost,
  }) : super(key: key);

  final double courentPcost;
  final double totalCost;
  final int QTY;
  final String itemName;
  final String nickName;
  final double perCost;

  @override
  Widget build(BuildContext context) {
    return Container(
      // Remaining widget layout continues in the report.
    );
  }
}