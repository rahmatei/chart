import 'package:chart/Widget/chart_bar.dart';
import 'package:chart/models/transaction.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class Chart extends StatelessWidget {
  final List<Transaction> recentedtrx;

  Chart({required this.recentedtrx});

  List<Map<String, Object>> get groupTotalValues {
    return List.generate(
      7,
      (index) {
        final weekDay = DateTime.now().subtract(Duration(days: index));
        var totalSum = 0.0;
        for (int i = 0; i < recentedtrx.length; i++) {
          if (recentedtrx[i].dt.day == weekDay.day &&
              recentedtrx[i].dt.month == weekDay.month &&
              recentedtrx[i].dt.year == weekDay.year) {
            totalSum += recentedtrx[i].amount;
          }
        }
        return {"day": DateFormat.E().format(weekDay), "amount": totalSum};
      },
    ).reversed.toList();
  }

  double get totalSpending {
    return groupTotalValues.fold(0.0, (previousValue, element) {
      return previousValue + double.parse(element['amount'].toString());
    });
  }

  @override
  Widget build(BuildContext context) {
    return Card(
        elevation: 5,
        margin: EdgeInsets.all(20),
<<<<<<< HEAD
        child: Row(
          children: groupTotalValues.map((data) {
            return ChartBar(
                lable: data['day'].toString(),
                spendingAmount: double.parse(data['amount'].toString()),
                spendingPctAmount: totalSpending==0.0 ?0.0 : (data['amount'] as double) / totalSpending,);
          }).toList(),
=======
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: groupTotalValues.map((data) {
              return Flexible(
                flex: 1,
                fit: FlexFit.tight,
                child: ChartBar(
                    lable: data['day'].toString(),
                    spendingAmount: double.parse(data['amount'].toString()),
                    spendingPctAmount: totalSpending == 0.0
                        ? 0.0
                        : (data['amount'] as double) / totalSpending),
              );
            }).toList(),
          ),
>>>>>>> 949887b70eef1a30d4a31082e6b34e2d33c3c23a
        ));
  }
}
