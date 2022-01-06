import 'package:flutter/material.dart';

class Result extends StatelessWidget {
  final int resultScore;
  final Function resetHandler;
  final Function showFavHandler;

  Result(this.resultScore, this.resetHandler, this.showFavHandler);

  String get resultPhrase {
    String resultText;
    if (resultScore <= 20) {
      resultText = "So sad :(";
    } else if (resultScore <= 40) {
      resultText = "That's okay";
    } else if (resultScore <= 60) {
      resultText = "Wow :)";
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
        Container(
          margin: EdgeInsets.only(bottom: 10),
          child: Text(
            "$resultScore% ",
            style: TextStyle(
              fontSize: 50,
              fontWeight: FontWeight.bold,
              color: Colors.brown[500],
            ),
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
              margin: EdgeInsets.only(right: 24),
              child: Text(
                resultPhrase,
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w500,
                  color: Colors.grey[400],
                ),
              ),
            ),
            IconButton(
              icon: Icon(Icons.autorenew_rounded),
              onPressed: resetHandler,
              splashRadius: 30,
              color: Colors.pink[200],
              tooltip: "Do quiz again",
            ),
            IconButton(
              icon: Icon(Icons.favorite_border_outlined),
              onPressed: showFavHandler,
              splashRadius: 30,
              color: Colors.pink[200],
              tooltip: "Show my fav",
            ),
          ],
        ),
      ],
    );
  }
}
