import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class NewTransaction extends StatefulWidget {
  final Function addTx;

  NewTransaction({required this.addTx});

  @override
  _NewTransactionState createState() => _NewTransactionState();
}

class _NewTransactionState extends State<NewTransaction> {
  final nameController = TextEditingController();

  final amountController = TextEditingController();

  DateTime? _dt;

  void onSubmit() {
    if (nameController.text.isEmpty || double.parse(amountController.text) <= 0 || _dt==null)
      return;

    widget.addTx(nameController.text, double.parse(amountController.text),_dt);
    Navigator.of(context).pop();
  }


  void _showDataPicker(){
    showDatePicker(context: context, initialDate: DateTime.now(), firstDate: DateTime(2010), lastDate: DateTime(2050))
    .then((datePick) {
      if (datePick==null){
        return ;
      }
      setState(() {
        _dt=datePick;
      });
    });
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
                Expanded(child:Text(_dt==null? 'No Chosen Date!':'Pcked Date: ${DateFormat.yMd().format(_dt!)}')),
                TextButton(
                    onPressed:_showDataPicker,
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
