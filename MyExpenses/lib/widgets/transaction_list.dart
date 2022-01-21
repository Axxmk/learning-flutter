import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../models/transaction.dart';

class TransactionList extends StatelessWidget {
  final List<Transaction> transactions;
  final Function deleteTrans;

  TransactionList(this.transactions, this.deleteTrans);

  @override
  Widget build(BuildContext context) {
    return transactions.isEmpty
        ? LayoutBuilder(builder: (ctx, constraints) {
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  margin: EdgeInsets.only(bottom: 30),
                  child: Text(
                    "No transactions added yet!",
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                ),
                Container(
                  height: constraints.maxHeight * 0.5,
                  child: Image.asset(
                    'assets/images/waiting.png',
                    fit: BoxFit.cover,
                    color: Colors.orange[100],
                  ),
                ),
              ],
            );
          })
        : ListView.builder(
            itemCount: transactions.length,
            itemBuilder: (ctx, index) {
              return Card(
                elevation: 1,
                margin: EdgeInsets.symmetric(
                  vertical: 4,
                  horizontal: 12,
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                child: ListTile(
                  leading: CircleAvatar(
                    backgroundColor: Theme.of(context).colorScheme.secondary,
                    radius: 30,
                    child: Padding(
                      padding: EdgeInsets.all(8),
                      child: FittedBox(
                        child: Text(
                          "\$${transactions[index].amount}",
                          style: Theme.of(context).textTheme.labelLarge,
                        ),
                      ),
                    ),
                  ),
                  title: Text(
                    transactions[index].title,
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                  subtitle: Text(
                    DateFormat.yMMMd().format(transactions[index].date),
                    style: Theme.of(context).textTheme.bodySmall,
                  ),
                  trailing: IconButton(
                    icon: Icon(Icons.delete),
                    onPressed: () => deleteTrans(transactions[index].id),
                    color: Theme.of(context).colorScheme.error,
                    splashRadius: 30,
                    tooltip: "delete it",
                  ),
                ),
              );
            },
          );
  }
}
