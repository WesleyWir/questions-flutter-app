import 'package:flutter/material.dart';
import './quiz.dart';
import './result.dart';

main() {
  runApp(new QuestionApp());
}

class _QuestionAppState extends State<QuestionApp> {
  var _selectedQuestion = 0;
  var _totalPoints = 0;
  final List<Map> _questions = const [
    {
      'text': 'Whats your favorite color?',
      'answers': [
        {'text': 'Black', 'points': 10},
        {'text': 'Red', 'points': 5},
        {'text': 'Yellow', 'points': 3},
        {'text': 'White', 'points': 1},
      ],
    },
    {
      'text': 'Whats your favorite animal?',
      'answers': [
        {'text': 'Monkey', 'points': 10},
        {'text': 'Rabbit', 'points': 5},
        {'text': 'Lion', 'points': 3},
        {'text': 'Horse', 'points': 1},
      ],
    },
    {
      'text': 'Whats your favorite meal?',
      'answers': [
        {'text': 'Hamburguer', 'points': 10},
        {'text': 'Pizza', 'points': 5},
        {'text': 'Tacos', 'points': 3},
        {'text': 'Lasagna', 'points': 1},
      ],
    },
  ];

  void _answer(int points) {
    setState(() {
      _selectedQuestion++;
      _totalPoints += points;
    });
  }

  void _resetQuiz() {
    setState(() {
      _selectedQuestion = 0;
      _totalPoints = 0;
    });
  }

  bool get hasSelectedQuestion {
    return _selectedQuestion < _questions.length;
  }

  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Questions'),
        ),
        body: hasSelectedQuestion
            ? Quiz(
                questions: _questions,
                selectedQuestion: _selectedQuestion,
                onAnswer: _answer,
              )
            : Result(_totalPoints, _resetQuiz),
      ),
    );
  }
}

class QuestionApp extends StatefulWidget {
  @override
  _QuestionAppState createState() {
    return new _QuestionAppState();
  }
}
