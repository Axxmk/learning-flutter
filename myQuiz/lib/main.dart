import 'package:flutter/material.dart';

import './quiz.dart';
import './result.dart';
import './favorite.dart';

//void main() {
//  runApp(MyApp());
//}

void main() => runApp(MyApp()); //* '=>' for one expression in function

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final _questionList = const [
    {
      "question": "What's your favorite color?",
      "answers": [
        {'text': 'Blue', 'score': 8},
        {'text': 'Brown', 'score': 20},
        {'text': 'Black & white', 'score': 17},
        {'text': 'Green', 'score': 2},
        {'text': 'Red', 'score': 5},
      ],
    },
    {
      "question": "What's your favorite animal?",
      "answers": [
        {'text': 'Cat', 'score': 18},
        {'text': 'Dog', 'score': 20},
        {'text': 'Hamster', 'score': 9},
        {'text': 'Bird', 'score': 4},
        {'text': 'Not like animal', 'score': 0},
      ],
    },
    {
      "question": "What's your favourite drink?",
      "answers": [
        {'text': 'Coffee', 'score': 3},
        {'text': 'Coke', 'score': 15},
        {'text': 'Bubble Tea', 'score': 9},
        {'text': 'Cocoa', 'score': 20},
      ],
    },
    {
      "question": "What's your favourite seasons?",
      "answers": [
        {'text': 'Winter', 'score': 15},
        {'text': 'Summer', 'score': 10},
        {'text': 'Spring', 'score': 20},
        {'text': 'Rainny', 'score': 3},
      ],
    },
    {
      "question": "What's your fovorite time of the day?",
      "answers": [
        {'text': 'Sunrise', 'score': 15},
        {'text': 'Midday', 'score': 9},
        {'text': 'Sunset', 'score': 20},
        {'text': 'Midnight', 'score': 12},
      ],
    },
  ];

  var _questionIndex = 0;
  var _totalScore = 0;
  var _favoriteShow = false;

  void _showFavorite() {
    setState(() {
      _favoriteShow = true;
    });
  }

  void _resetQuiz() {
    setState(() {
      _questionIndex = 0;
      _totalScore = 0;
      _favoriteShow = false;
    });
  }

  void _answerQuestion(int score) {
    _totalScore += score;

    setState(() {
      _questionIndex++;
    });

    if (_questionIndex < _questionList.length) {
      print("We have more questions!");
    } else {
      print("No more questions!");
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('My Quiz App'),
          backgroundColor: Colors.deepOrange[200],
        ),
        body: _questionIndex < _questionList.length
            ? Quiz(
                questions: _questionList,
                answerQuestion: _answerQuestion,
                questionIndex: _questionIndex,
              )
            : _favoriteShow == false
                ? Result(_totalScore, _resetQuiz, _showFavorite)
                : Favorite(_resetQuiz),
      ),
    );
  }
}
