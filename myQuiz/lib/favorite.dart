import 'package:flutter/material.dart';

class Favorite extends StatelessWidget {
  final Function resetHandler;

  final _favoriteList = [
    "Brown",
    "Dog",
    "Cocoa",
    "Spring",
    "Sunset",
  ];

  Favorite(this.resetHandler);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Container(
          decoration: BoxDecoration(
            color: Colors.deepOrange[50],
            borderRadius: BorderRadius.circular(20),
          ),
          margin: EdgeInsets.fromLTRB(40, 0, 40, 15),
          padding: EdgeInsets.fromLTRB(40, 25, 25, 25),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ...(_favoriteList.map((favorite) {
                var index = _favoriteList.indexOf(favorite) + 1;
                return Container(
                  padding: EdgeInsets.all(4),
                  child: Text(
                    "Question $index: $favorite",
                    style: TextStyle(
                      fontSize: 18,
                      color: Colors.brown,
                    ),
                  ),
                );
              })).toList(),
            ],
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
