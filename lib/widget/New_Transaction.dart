import 'package:flutter/material.dart';

class NewTransaction extends StatefulWidget {
  final Function addtx;
  @override
  NewTransaction(this.addtx);

  @override
  State<NewTransaction> createState() => _NewTransactionState();
}

class _NewTransactionState extends State<NewTransaction> {
  final titleController = TextEditingController();

  final amountController = TextEditingController();

  void submit() {
    final enteredtitle = titleController.text;
    final enteredamount = double.parse(amountController.text);

    if (enteredtitle.isEmpty || enteredamount <= 0) {
      return;
    }
    widget.addtx(
      enteredtitle,
      enteredamount,
    );
    Navigator.of(context).pop();
  }

  Widget build(BuildContext context) {
    return Card(
      child: Container(
        padding: EdgeInsets.all(6),
        child: Column(children: [
          TextField(
            decoration: InputDecoration(labelText: 'title'),
            controller: titleController,
          ),
          TextField(
            decoration: InputDecoration(labelText: 'amount'),
            controller: amountController,
            keyboardType: TextInputType.number,
            onSubmitted: (_) => submit(),
          ),
          ElevatedButton(
              onPressed: () {
                submit();
              },
              child: Text('Add transaction'))
        ]),
      ),
    );
  }
}
