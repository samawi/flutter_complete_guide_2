import 'package:flutter/material.dart';

class NewTransaction extends StatelessWidget {
  final _inputTitleController = TextEditingController();
  final _inputPriceController = TextEditingController();
  final Function _addNewTxHandler;

  NewTransaction(this._addNewTxHandler);

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
            ),
            TextField(
              controller: _inputPriceController,
              decoration: InputDecoration(
                labelText: 'Amount',
              ),
            ),
            TextButton(
              style: ButtonStyle(
                foregroundColor: MaterialStateProperty.all(
                  Colors.purple,
                ),
              ),
              onPressed: () {
                _addNewTxHandler(
                  _inputTitleController.text,
                  double.parse(_inputPriceController.text),
                );
              },
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
