import 'package:flutter/material.dart';

class Answer extends StatelessWidget {
  final VoidCallback selectHandler;
  final String answerText;

  Answer(this.selectHandler, this.answerText);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 160,
      child: OutlinedButton(
        style: OutlinedButton.styleFrom(
          side: BorderSide(
            color: Colors.deepOrange[100],
          ),
          padding: EdgeInsets.symmetric(
            vertical: 10,
          ),
          primary: Colors.brown[500],
          textStyle: TextStyle(
            fontSize: 15,
          ),
        ),
        child: Text(answerText),
        onPressed: selectHandler,
      ),
    );
  }
}
