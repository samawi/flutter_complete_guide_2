import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class NewTransaction extends StatefulWidget {
  final Function _addNewTxHandler;

  NewTransaction(this._addNewTxHandler);

  @override
  _NewTransactionState createState() => _NewTransactionState();
}

class _NewTransactionState extends State<NewTransaction> {
  final _inputTitleController = TextEditingController();
  final _inputPriceController = TextEditingController();
  DateTime _selectedDate;

  void _submitData() {
    if (_inputPriceController.text.isEmpty) {
      return;
    }
    final enteredTitle = _inputTitleController.text;
    final enteredPrice = double.parse(_inputPriceController.text);
    // if either field is empty, then do nothing
    if (enteredTitle.isEmpty || enteredPrice <= 0 || _selectedDate == null) {
      return;
    }
    widget._addNewTxHandler(
      _inputTitleController.text,
      double.parse(_inputPriceController.text),
      _selectedDate,
    );
    Navigator.of(context).pop();
  }

  void _presentDatePicker() {
    showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2021),
      lastDate: DateTime.now(),
    ).then((value) {
      if (value == null) {
        return;
      }
      setState(() {
        _selectedDate = value;
      });
    });
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
            // 1. Field: Title of transaction
            TextField(
              controller: _inputTitleController,
              decoration: InputDecoration(
                labelText: 'Title',
              ),
              onSubmitted: (_) => _submitData(),
            ),
            // 2. Field: Amount of transaction
            TextField(
              controller: _inputPriceController,
              decoration: InputDecoration(
                labelText: 'Amount',
              ),
              keyboardType: TextInputType.number,
              onSubmitted: (_) => _submitData(),
            ),
            // 3. Date Picker
            Container(
              height: 70,
              child: Row(
                children: [
                  Expanded(
                    child: Text(_selectedDate == null
                        ? 'No Date Chosen!'
                        : 'Picked Date: ${DateFormat.yMd().format(_selectedDate)}'),
                  ),
                  TextButton(
                    onPressed: _presentDatePicker,
                    child: Text(
                      'Choose Date',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  )
                ],
              ),
            ),
            // 4. Submit button
            ElevatedButton(
              onPressed: _submitData,
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
