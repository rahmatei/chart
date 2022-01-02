import 'package:chart/Widget/chart.dart';
import 'package:chart/Widget/new_transaction.dart';
import 'package:chart/Widget/transaction_list.dart';
import 'package:chart/models/transaction.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'testtt',
      theme: ThemeData(
        accentColor: Colors.blue,
        primarySwatch: Colors.cyan,
        primaryColor: Colors.cyan,
        fontFamily: 'Quicksand-Bold',
        textTheme: ThemeData.light().textTheme.copyWith(
              headline6: TextStyle(
                fontFamily: 'OpenSans',
                fontWeight: FontWeight.bold,
                fontSize: 15,
              ),
            ),
        appBarTheme: AppBarTheme(
          textTheme: ThemeData.light().textTheme.copyWith(
                headline6: TextStyle(
                  fontFamily: 'OpenSans',
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
        ),
      ),
      home: MyHome(),
    );
  }
}

class MyHome extends StatefulWidget {
  //String name = "";
  //String amount = "0.0";
  @override
  _MyHomeState createState() => _MyHomeState();
  /*@override
  _MyHome createState() => _MyHome();*/
}

class _MyHomeState extends State<MyHome> {
  final List<Transaction> transaction = [
    // Transaction(id: 'tx1', title: 'Shoes', amount: 10.10, dt: DateTime.now()),
    // Transaction(id: 'tx2', title: 'Shirt', amount: 5.10, dt: DateTime.now()),
  ];

  void _addTransaction(String name, double amount) {
    setState(() {
      transaction.add(Transaction(
          id: DateTime.now().toString(),
          title: name,
          amount: amount,
          dt: DateTime.now()));
    });
  }

  void _showAddTransactionBottomSheet(BuildContext context) {
    showModalBottomSheet(
        context: context,
        builder: (_) {
          return GestureDetector(
            onTap: () {},
            child: NewTransaction(addTx: _addTransaction),
            behavior: HitTestBehavior.opaque,
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).primaryColor,
        title: Text(
          'Data Transaction',
        ),
        actions: [
          IconButton(
              onPressed: () => _showAddTransactionBottomSheet(context),
              icon: Icon(
                Icons.add,
              ))
        ],
      ),
      body: SingleChildScrollView(
        child: SafeArea(
            child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Chart(
              recentedtrx: transaction.where((tx) {
                return tx.dt
                    .isAfter(DateTime.now().subtract(Duration(days: 7)));
              }).toList(),
            ),
            TransactionList(trx: transaction)
          ],
        )),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: Builder(
        builder: (context) => FloatingActionButton(
          onPressed: () => _showAddTransactionBottomSheet(context),
          child: Icon(Icons.add),
        ),
      ),
    );
  }
}
