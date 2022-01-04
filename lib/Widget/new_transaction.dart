import 'package:flutter/material.dart';

class NewTransaction extends StatefulWidget {
  final Function addTx;

  NewTransaction({required this.addTx});

  @override
  _NewTransactionState createState() => _NewTransactionState();
}

class _NewTransactionState extends State<NewTransaction> {
  final nameController = TextEditingController();

  final amountController = TextEditingController();

  void onSubmit() {
    if (nameController.text.isEmpty || double.parse(amountController.text) <= 0)
      return;

    widget.addTx(nameController.text, double.parse(amountController.text));
    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      child: Container(
        padding: EdgeInsets.all(15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            TextField(
              decoration: InputDecoration(labelText: 'Title'),
              controller: nameController,
              onSubmitted: (_) => onSubmit(),
              //onChanged: (val) {
              //name = val;
              //},
            ),
            TextField(
              decoration: InputDecoration(labelText: 'Amount'),
              /*onChanged: (val) {
                        amount = val;
                      },*/
              controller: amountController,
              keyboardType: TextInputType.number,
              onSubmitted: (_) => onSubmit(),
            ),
            Row(
              children: [
                Text('No Chosen Date!'),
                TextButton(
                    onPressed: () {},
                    child: Text(
                      'Choose Date',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ))
              ],
            ),
            ElevatedButton(
              onPressed: onSubmit,
              child: Text('Add Transaction'),
              style: ElevatedButton.styleFrom(
                primary: Colors.amber,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
