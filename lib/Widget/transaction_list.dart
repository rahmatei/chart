import 'package:chart/Widget/transaction_item.dart';
import 'package:chart/models/transaction.dart';
import 'package:flutter/material.dart';

class TransactionList extends StatelessWidget {
  final List<Transaction> trx;
  final Function trxDel;

  TransactionList({required this.trx, required this.trxDel});

  @override
  Widget build(BuildContext context) {
    //final textScaleSize = MediaQuery.of(context).textScaleFactor;
    return trx.isEmpty
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
        : ListView(
            children: trx
                .map((tx) => TransactionItem(
                    key: ValueKey(tx.id), trx: tx, trxDel: trxDel))
                .toList(),
          );
  }
}
