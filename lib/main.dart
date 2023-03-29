import 'package:first_app/widget/New_Transaction.dart';
import 'package:flutter/material.dart';
import './model/transaction.dart';
import './widget/Transaction_List.dart';

void main() => runApp(ExpenseApp());

class ExpenseApp extends StatelessWidget {
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'flutter app',
      theme: ThemeData(primarySwatch: Colors.deepPurple),
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  void _startAddNewTransaction(BuildContext ctx) {
    showModalBottomSheet(
        context: ctx,
        builder: (_) {
          return GestureDetector(
              onTap: () {},
              child: NewTransaction(addtransaction),
              behavior: HitTestBehavior.opaque);
        });
  }

  final List<Transaction> UserTransactions = [
    Transaction(id: 't1', title: 'shoes', amount: 76, date: DateTime.now()),
    Transaction(
        id: 't2', title: 'groceries', amount: 100, date: DateTime.now()),
  ];

  void addtransaction(String txTitle, double txAmount) {
    final newtx = Transaction(
        id: DateTime.now().toString(),
        title: txTitle,
        amount: txAmount,
        date: DateTime.now());
    setState(() {
      UserTransactions.add(newtx);
    });
  }

  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Expenses App'),
          actions: <Widget>[
            IconButton(
              onPressed: () {
                _startAddNewTransaction(context);
              },
              icon: Icon(Icons.add),
            )
          ],
        ),
        body: Column(
          children: [
            Container(
              width: double.infinity,
              color: Theme.of(context).primaryColor,
              child: Card(
                child: Text('Chart!'),
                elevation: 5,
              ),
            ),
            TransactionList(UserTransactions)
          ],
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            _startAddNewTransaction(context);
          },
          child: Icon(Icons.add),
        ));
  }
}
