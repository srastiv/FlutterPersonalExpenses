import 'package:flutter/material.dart';

class NewTransaction extends StatefulWidget {
  final Function addTX;

  NewTransaction(this.addTX);

  @override
  State<NewTransaction> createState() => _NewTransactionState();
}

class _NewTransactionState extends State<NewTransaction> {
  final titleController = TextEditingController();

  final amountController = TextEditingController();

  void submitData() {
    final enteredTitle = titleController.text;
    final enteredAmount = double.parse(amountController.text);

    if (enteredTitle.isEmpty || enteredAmount <= 0) {
      return;
    }

    widget.addTX(
      enteredTitle,
      enteredAmount,
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
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            TextField(
              autofocus: true,
              cursorColor: Color.fromARGB(255, 136, 70, 211),
              decoration: InputDecoration(labelText: "Title"),
              controller: titleController,
              onSubmitted: (_) => submitData(),
              //   onChanged: (val) {
              //    titleInput = val;
              //  },
            ),
            TextField(
              cursorColor: Color.fromARGB(255, 136, 70, 211),
              decoration: InputDecoration(labelText: "Amount"),
              controller: amountController,
              keyboardType: TextInputType.number,
              onSubmitted: (_) => submitData(),
              //   onChanged: (val) => amountInput = val,
            ),
            TextButton(
              child: Text("Add Transaction"),
              onPressed: submitData,

              //    print(titleInput);
              //    print(amountInput);

              style: TextButton.styleFrom(
                primary: Colors.amber[700],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
