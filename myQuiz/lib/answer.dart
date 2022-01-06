import 'package:flutter/material.dart';

class Answer extends StatelessWidget {
  final VoidCallback selectHandler;
  final String answerText;

  Answer(this.selectHandler, this.answerText);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(4),
      child: OutlinedButton(
        style: OutlinedButton.styleFrom(
          primary: Colors.brown[500],
          minimumSize: Size(160, 40),
          side: BorderSide(color: Colors.deepOrange[200]),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(18),
          ),
          textStyle: TextStyle(fontSize: 15),
        ),
        child: Text(answerText),
        onPressed: selectHandler,
      ),
    );
  }
}
