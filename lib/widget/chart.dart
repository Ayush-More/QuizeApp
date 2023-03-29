import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../model/transaction.dart';

// ignore: must_be_immutable
class Chart extends StatelessWidget{
  List<Transaction> recentTransaction;
  Chart(this.recentTransaction);

  List<Map<String, Object>> get groupedTransactionValues{
    return List.generate(7, (index)  {
      final weekDay =DateTime.now().subtract(Duration(days: index));

      double totalSum =0.0;
      for (var i=0; i < recentTransaction.length; i++){
        if(recentTransaction[i].date.day==weekDay.day && recentTransaction[i].date.month == weekDay.month &&recentTransaction[i].date.year == weekDay.year){
          totalSum=totalSum + recentTransaction[i].amount;

        }

      }
      return {'Day': DateFormat.E(weekDay.day), 'amount': totalSum};

    });
  }

  @override
  Widget build(BuildContext context){
    return Card(elevation: 6,margin: EdgeInsets.all(20),child: Row(children: <Widget>[],),)
  }
}