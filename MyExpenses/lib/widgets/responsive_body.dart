// internals
import 'package:flutter/material.dart';

// models
import '../models/transaction.dart';

// widgets
import 'transaction_list.dart';
import 'chart.dart';

class ResponsiveBody extends StatefulWidget {
  final Size appbarSize;
  final List<Transaction> userTransactions;
  final Function deleteTransaction;

  const ResponsiveBody({
    Key key,
    @required this.appbarSize,
    @required this.userTransactions,
    @required this.deleteTransaction,
  }) : super(key: key);

  @override
  State<ResponsiveBody> createState() => _ResponsiveBodyState();
}

class _ResponsiveBodyState extends State<ResponsiveBody> {
  bool _showChart = false;

  // Transactions getter
  List<Transaction> get _recentTransactions {
    return widget.userTransactions.where((tx) {
      return tx.date.isAfter(
        DateTime.now().subtract(Duration(days: 7)),
      );
    }).toList();
  }

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    final isLandscape = mediaQuery.orientation == Orientation.landscape;

    final transactionListWidget = Container(
      height: (mediaQuery.size.height - widget.appbarSize.height - mediaQuery.padding.top) * 0.75,
      child: TransactionList(widget.userTransactions, widget.deleteTransaction),
    );

    return SafeArea(
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            if (!isLandscape)
              Container(
                height:
                    (mediaQuery.size.height - widget.appbarSize.height - mediaQuery.padding.top) *
                        0.25,
                child: Chart(_recentTransactions),
              ),
            if (!isLandscape) transactionListWidget,
            if (isLandscape)
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    'Show Chart',
                    style: Theme.of(context).textTheme.labelMedium,
                  ),
                  Switch.adaptive(
                    value: _showChart,
                    onChanged: (bool newValue) {
                      setState(() {
                        _showChart = newValue;
                      });
                    },
                    activeColor: Theme.of(context).colorScheme.primary,
                  )
                ],
              ),
            if (isLandscape)
              _showChart
                  ? Container(
                      height: (mediaQuery.size.height -
                              widget.appbarSize.height -
                              mediaQuery.padding.top) *
                          0.7,
                      child: Chart(_recentTransactions),
                    )
                  : transactionListWidget,
          ],
        ),
      ),
    );
  }
}
