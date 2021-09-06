import 'package:flutter/material.dart';

class NewTransaction extends StatefulWidget {
  final Function _addNewTxHandler;

  NewTransaction(this._addNewTxHandler);

  @override
  _NewTransactionState createState() => _NewTransactionState();
}

class _NewTransactionState extends State<NewTransaction> {
  final _inputTitleController = TextEditingController();

  final _inputPriceController = TextEditingController();

  void submitData() {
    final enteredTitle = _inputTitleController.text;
    final enteredPrice = double.parse(_inputPriceController.text);
    // if either field is empty, then do nothing
    if (enteredTitle.isEmpty || enteredPrice <= 0) {
      return;
    }
    widget._addNewTxHandler(
      _inputTitleController.text,
      double.parse(_inputPriceController.text),
    );
    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      child: Container(
        padding: EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            TextField(
              controller: _inputTitleController,
              decoration: InputDecoration(
                labelText: 'Title',
              ),
              onSubmitted: (_) => submitData(),
            ),
            TextField(
              controller: _inputPriceController,
              decoration: InputDecoration(
                labelText: 'Amount',
              ),
              keyboardType: TextInputType.number,
              onSubmitted: (_) => submitData(),
            ),
            TextButton(
              onPressed: submitData,
              child: Text(
                'Add Transaction',
              ),
            )
          ],
        ),
      ),
    );
  }
}
