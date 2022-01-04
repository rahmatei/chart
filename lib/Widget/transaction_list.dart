import 'package:chart/models/transaction.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class TransactionList extends StatelessWidget {
  final List<Transaction> trx;

  TransactionList({required this.trx});

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 200,
        child: trx.isEmpty
            ? Column(
                children: [
                  Text('Not Data For Preview'),
                  SizedBox(
                    height: 20,
                  ),
                  Container(
                      height: 150,
                      child: Image.asset(
                        'assets/images/waiting.png',
                        fit: BoxFit.cover,
                      ))
                ],
              )
            : ListView.builder(
                itemBuilder: (context, index) {
                  return Card(
                      elevation: 8,
                      margin: EdgeInsets.symmetric(vertical: 5, horizontal: 8),
                      child: ListTile(
                        leading: CircleAvatar(
                          backgroundColor: Theme.of(context).primaryColor,
                          radius: 30,
                          child: Padding(
                            padding: const EdgeInsets.all(6.0),
                            child: FittedBox(
                              child: Text(
                                '\$${trx[index].amount}',
                                style: Theme.of(context).textTheme.headline6,
                                textAlign: TextAlign.center,
                              ),
                            ),
                          ),
                        ),
                        title: Text(trx[index].title,
                            style: Theme.of(context).textTheme.headline6),
                        subtitle: Text(
                          /*DateFormat().format(tx.dt),*/
                          DateFormat.yMMMd().format(trx[index].dt),
                          style: TextStyle(
                            color: Colors.grey,
                          ),
                        ),
                      )

                      /* Row(
                      children: [
                        Container(
                          width: 65,
                          margin: EdgeInsets.symmetric(
                              horizontal: 10, vertical: 20),
                          padding: EdgeInsets.all(5),
                          decoration: BoxDecoration(
                              border: Border.all(
                                  color: Theme.of(context).primaryColorDark,
                                  width: 2)),
                          child: Text(
                            '\$${trx[index].amount}',
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Theme.of(context).primaryColor,
                                fontSize: 18),
                            textAlign: TextAlign.center,
                          ),
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(trx[index].title,
                                style: Theme.of(context).textTheme.headline6),
                            Text(
                              /*DateFormat().format(tx.dt),*/
                              DateFormat.yMMMd().format(trx[index].dt),
                              style: TextStyle(
                                color: Colors.grey,
                              ),
                            )
                          ],
                        )
                      ],
                    ),*/
                      );
                },
                itemCount: trx.length));
  }
}
