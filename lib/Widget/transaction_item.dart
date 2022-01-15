import 'package:chart/models/transaction.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class TransactionItem extends StatelessWidget {
  const TransactionItem({
    Key? key,
    required this.trx,
    required this.trxDel,
  }) : super(key: key);

  final Transaction trx;
  final Function trxDel;

  @override
  Widget build(BuildContext context) {
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
                  '\$${trx.amount}',
                  style: Theme.of(context).textTheme.headline6,
                  textAlign: TextAlign.center,
                ),
              ),
            ),
          ),
          title: Text(trx.title, style: Theme.of(context).textTheme.headline6),
          subtitle: Text(
            /*DateFormat().format(tx.dt),*/
            DateFormat.yMMMd().format(trx.dt),
            style: TextStyle(
              color: Colors.grey,
            ),
          ),
          trailing: IconButton(
            icon: Icon(Icons.access_alarm),
            onPressed: () => trxDel(trx.id),
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
  }
}
