import 'package:flutter/material.dart';

class Favorite extends StatelessWidget {
  final Function resetHandler;

  final String _favoriteList = "Question 1: Brown \n\n" +
      "Question 2: Dog \n\n" +
      "Question 3: Cocoa \n\n" +
      "Question 4: Spring \n\n" +
      "Question 5: Sunset";

  Favorite(this.resetHandler);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Container(
          color: Colors.orange[50],
          margin: EdgeInsets.fromLTRB(40, 0, 40, 15),
          padding: EdgeInsets.all(25),
          child: Text(
            _favoriteList,
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 18,
              color: Colors.brown,
            ),
          ),
        ),
        IconButton(
          iconSize: 32,
          icon: Icon(Icons.autorenew_rounded),
          color: Colors.pink[200],
          onPressed: resetHandler,
          tooltip: "Do quiz again",
        ),
      ],
    );
  }
}
