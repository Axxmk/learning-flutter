import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../models/transaction.dart';
import './chart_bar.dart';

class Chart extends StatelessWidget {
  final List<Transaction> recentTransactions;

  Chart(this.recentTransactions);

  List<Map<String, Object>> get _groupTransactionValues {
    return List.generate(7, (int index) {
      final weekDay = DateTime.now().subtract(
        Duration(
          days: index,
        ),
      );

      var totalSum = 0.0;

      for (var i = 0; i < recentTransactions.length; i++) {
        var date = recentTransactions[i].date;
        if (date.day == weekDay.day && date.month == weekDay.month && date.year == weekDay.year) {
          totalSum += recentTransactions[i].amount;
        }
      }

      return {
        "day": DateFormat.E().format(weekDay),
        "amount": totalSum,
      };
    }).reversed.toList();
  }

  double get totalSpending {
    return _groupTransactionValues.fold(0.0, (sum, item) {
      return sum + item['amount'];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2,
      margin: EdgeInsets.symmetric(
        vertical: 10,
        horizontal: 12,
      ),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(6)),
      child: Padding(
        padding: EdgeInsets.all(16),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: _groupTransactionValues.map((data) {
            return Expanded(
              child: ChartBar(data['day'], data['amount'],
                  totalSpending == 0.0 ? 0.0 : (data['amount'] as double) / totalSpending),
            );
          }).toList(),
        ),
      ),
    );
  }
}
