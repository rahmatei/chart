import 'package:flutter/material.dart';

class ChartBar extends StatelessWidget {
  final String lable;
  final double spendingAmount;
  final double spendingPctAmount;

  ChartBar(
      {required this.lable,
      required this.spendingAmount,
      required this.spendingPctAmount});

  @override
  Widget build(BuildContext context) {
    print("pct : ${spendingPctAmount.toString()}");
    return Column(
      children: [
        Container(
            height: 20,
            child: FittedBox(
                child: Text('\$${spendingAmount.toStringAsFixed(0)}'))),
        SizedBox(
          height: 4,
        ),
        Container(
          width: 10,
          height: 60,
          child: Stack(
            children: [
              Container(
                decoration: BoxDecoration(
                    border: Border.all(color: Colors.green, width: 1.0),
                    borderRadius: BorderRadius.circular(20),
                    color: Color.fromRGBO(220, 220, 220, 1)),
              ),
              FractionallySizedBox(
                heightFactor: spendingPctAmount,
                child: Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Theme.of(context).primaryColor),
                ),
              )
            ],
          ),
        ),
        SizedBox(
          height: 4,
        ),
        Text(lable)
      ],
    );
  }
}
