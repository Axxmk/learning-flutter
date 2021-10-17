import 'package:flutter/material.dart';

class Answer extends StatelessWidget {
  final Function selectHandler;
  final String answerText;

  Answer(this.selectHandler, this.answerText);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 150,
      child: RaisedButton(
        color: Colors.orange[100],
        textColor: Colors.brown[500],
        child: Text(answerText),
        onPressed: selectHandler,
      ),
    );
  }
}
