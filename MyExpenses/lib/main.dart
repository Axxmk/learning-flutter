// internals
import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';

// models
import './models/transaction.dart';

// widgets
import './widgets/responsive_body.dart';
import './widgets/new_transaction.dart';

void main() {
  // WidgetsFlutterBinding.ensureInitialized();
  // SystemChrome.setPreferredOrientations([
  //   DeviceOrientation.portraitUp,
  //   DeviceOrientation.portraitDown,
  // ]);
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'My Expenses',
      home: MyHomePage(),
      theme: ThemeData(
        colorScheme: ColorScheme.fromSwatch().copyWith(
          primary: Colors.deepPurple[200],
          secondary: Colors.orange[200],
          error: Colors.red[400],
        ),
        splashColor: Colors.orange[300],
        fontFamily: 'Quicksand',
        textTheme: ThemeData.light().textTheme.copyWith(
              titleLarge: TextStyle(
                color: Colors.deepPurple[300],
              ),
              titleSmall: TextStyle(
                color: Colors.deepPurple[300],
              ),
              labelLarge: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.w700,
              ),
              labelMedium: TextStyle(
                color: Colors.grey[700],
              ),
            ),
        appBarTheme: AppBarTheme(
          titleTextStyle: TextStyle(
            fontFamily: 'OpenSans',
            fontWeight: FontWeight.bold,
            fontSize: 20,
          ),
        ),
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final List<Transaction> _userTransactions = [];

  void _addNewTransaction(
    String txTitle,
    double txAmount,
    DateTime chosenDate,
  ) {
    final newTrans = Transaction(
      id: DateTime.now().toString(),
      title: txTitle,
      amount: txAmount,
      date: chosenDate,
    );

    setState(() {
      _userTransactions.add(newTrans);
    });
  }

  void _deleteTransaction(String id) {
    setState(() {
      _userTransactions.removeWhere((tx) => tx.id == id);
    });
  }

  // Show the modal bottom sheet to add a new transaction
  void _startAddNewTransaction(BuildContext ctx) {
    showModalBottomSheet(
      context: ctx,
      builder: (_) {
        return GestureDetector(
          child: NewTransaction(_addNewTransaction),
          onTap: () {},
          behavior: HitTestBehavior.opaque,
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final PreferredSizeWidget appBar = Platform.isIOS
        ? CupertinoNavigationBar(
            middle: Text("My Expenses"),
            trailing: Row(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                GestureDetector(
                  child: Icon(
                    CupertinoIcons.add,
                    size: 24,
                    color: Colors.black54,
                  ),
                  onTap: () => _startAddNewTransaction(context),
                )
              ],
            ),
          )
        : AppBar(
            title: Text("My Expenses"),
            actions: <Widget>[
              IconButton(
                icon: Icon(Icons.add),
                onPressed: () => _startAddNewTransaction(context),
                tooltip: "Add expense",
                splashRadius: 22,
              ),
            ],
          );

    return Platform.isIOS
        ? CupertinoPageScaffold(
            navigationBar: appBar,
            child: ResponsiveBody(
              appbarSize: appBar.preferredSize,
              userTransactions: _userTransactions,
              deleteTransaction: _deleteTransaction,
            ),
          )
        : Scaffold(
            backgroundColor: Color.fromARGB(255, 243, 243, 243),
            appBar: appBar,
            body: ResponsiveBody(
              appbarSize: appBar.preferredSize,
              userTransactions: _userTransactions,
              deleteTransaction: _deleteTransaction,
            ),
            floatingActionButton: Platform.isIOS
                ? Container()
                : FloatingActionButton(
                    child: Icon(Icons.add),
                    onPressed: () => _startAddNewTransaction(context),
                    tooltip: "Add expense",
                  ),
            floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
          );
  }
}
