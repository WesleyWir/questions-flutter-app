import 'package:flutter/material.dart';
import './question.dart';
import './answer.dart';

main() {
  runApp(new QuestionApp());
}

class _QuestionAppState extends State<QuestionApp> {
  var _selectedQuestion = 0;
  final List<Map> _questions = const [
    {
      'text': 'Whats your favorite color?',
      'answers': ['Black', 'Red', 'Yellow', 'White'],
    },
    {
      'text': 'Whats your favorite animal?',
      'answers': ['Monkey', 'Rabbit', 'Lion', 'Horse'],
    },
    {
      'text': 'Whats your favorite meal?',
      'answers': ['Hamburguer', 'Pizza', 'Tacos', 'Lasagna'],
    },
  ];

  void _answer() {
    setState(() {
      _selectedQuestion++;
    });
    print(_selectedQuestion);
  }

  bool get hasSelectedQuestion {
    return _selectedQuestion < _questions.length;
  }

  Widget build(BuildContext context) {
    List<String>? answers =
        hasSelectedQuestion ? _questions[_selectedQuestion]['answers'] : null;

    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Questions'),
        ),
        body: hasSelectedQuestion
            ? Column(children: <Widget>[
                Question(_questions[_selectedQuestion]['text']),
                ...answers!.map((t) => Answer(t, _answer)).toList(),
              ])
            : null,
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
