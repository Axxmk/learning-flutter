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
          color: Colors.deepOrange[50],
          margin: EdgeInsets.fromLTRB(40, 0, 40, 15),
          padding: EdgeInsets.fromLTRB(40, 25, 25, 25),
          child: Text(
            _favoriteList,
            style: TextStyle(
              fontSize: 18,
              color: Colors.brown,
            ),
          ),
        ),
        IconButton(
          iconSize: 28,
          icon: Icon(Icons.autorenew_rounded),
          color: Colors.pink[200],
          onPressed: resetHandler,
          tooltip: "Do quiz again",
        ),
      ],
    );
  }
}
