import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../models/transaction.dart';

class TransactionList extends StatelessWidget {
  final List<Transaction> transactions;
  final Function _deleteTrans;

  TransactionList(this.transactions, this._deleteTrans);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 610,
      child: transactions.isEmpty
          ? Column(
              children: [
                Text(
                  "No transactions added yet!",
                  style: Theme.of(context).textTheme.headline6,
                ),
                SizedBox(
                  height: 20,
                ),
                Container(
                  height: 250,
                  child: Image.asset(
                    'assets/images/like me.jpg',
                    fit: BoxFit.cover,
                  ),
                ),
              ],
            )
          : ListView.builder(
              itemCount: transactions.length,
              itemBuilder: (ctx, index) {
                return Card(
                  elevation: 2,
                  margin: EdgeInsets.symmetric(
                    vertical: 8,
                    horizontal: 7,
                  ),
                  child: ListTile(
                    leading: CircleAvatar(
                      backgroundColor: Color.fromRGBO(255, 150, 170, 0.6),
                      radius: 30,
                      child: Padding(
                        padding: EdgeInsets.all(6),
                        child: FittedBox(
                          child: Text(
                            "\$${transactions[index].amount}",
                          ),
                        ),
                      ),
                    ),
                    title: Text(
                      transactions[index].title,
                      style: Theme.of(context).textTheme.headline6,
                    ),
                    subtitle: Text(
                      DateFormat.yMMMd().format(transactions[index].date),
                      style: TextStyle(
                        color: Colors.grey,
                      ),
                    ),
                    trailing: IconButton(
                      icon: Icon(Icons.delete),
                      color: Theme.of(context).errorColor,
                      splashRadius: 30,
                      onPressed: () => _deleteTrans(transactions[index].id),
                      tooltip: "delete it",
                    ),
                  ),
                );
              },
            ),
    );
  }
}
