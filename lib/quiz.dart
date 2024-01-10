import 'package:flutter/material.dart';

import 'package:flutter/material.dart';
import './question.dart';
import './answer.dart';

class Quiz extends StatelessWidget {
  final List<Map> questions;
  final int selectedQuestion;
  final void Function(int) onAnswer;

  const Quiz({
    required this.questions,
    required this.selectedQuestion,
    required this.onAnswer,
  });

  bool get hasSelectedQuestion {
    return selectedQuestion < questions.length;
  }

  @override
  Widget build(BuildContext context) {
    List<Map<String, Object>>? answers = hasSelectedQuestion
        ? questions[selectedQuestion]['answers'] as List<Map<String, Object>>
        : null;

    return Column(children: <Widget>[
      Question(questions[selectedQuestion]['text']),
      ...answers!
          .map((resp) => Answer(resp['text'].toString(),
              () => onAnswer(int.parse(resp['points'].toString()))))
          .toList(),
    ]);
  }
}
