import 'package:flutter/material.dart';

class Result extends StatelessWidget {
  final int resultScore;
  final Function resetHandler;
  final Function showFavHandler;

  Result(this.resultScore, this.resetHandler, this.showFavHandler);

  String get resultPhrase {
    String resultText;
    if (resultScore <= 20) {
      resultText = "So sad  :(";
    } else if (resultScore <= 40) {
      resultText = "That's okay";
    } else if (resultScore <= 60) {
      resultText = "Wow  :)";
    } else if (resultScore <= 80) {
      resultText = "Amazing !!";
    } else {
      resultText = "Unbelievable !!";
    }
    return resultText;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Text(
          "$resultScore % ",
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 40,
            fontWeight: FontWeight.bold,
            color: Colors.brown[400],
          ),
        ),
        Text(
          resultPhrase,
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
            color: Colors.brown[300],
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            IconButton(
              icon: Icon(Icons.autorenew_rounded),
              color: Colors.pink[200],
              onPressed: resetHandler,
              tooltip: "Do quiz again",
            ),
            IconButton(
              icon: Icon(Icons.favorite_border_outlined),
              color: Colors.pink[200],
              onPressed: showFavHandler,
              tooltip: "Show my fav",
            ),
          ],
        ),
      ],
    );
  }
}
