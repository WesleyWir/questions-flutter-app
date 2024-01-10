import 'package:flutter/material.dart';

import 'package:flutter/material.dart';

class Result extends StatelessWidget {
  final int points;
  final void Function() onResetQuiz;

  Result(this.points, this.onResetQuiz);

  String get resultPhrase {
    if (points < 8) {
      return 'Parabéns!';
    } else if (points < 12) {
      return 'Você é bom!';
    } else if (points < 16) {
      return 'Impressionante!';
    } else {
      return 'Excelente!';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Center(
          child: Text(
            resultPhrase,
            style: TextStyle(fontSize: 28),
          ),
        ),
        TextButton(
          child: Text('Reiniciar?',
              style: TextStyle(
                fontSize: 18,
              )),
          style: TextButton.styleFrom(
            foregroundColor: Colors.blue,
          ),
          onPressed: onResetQuiz,
        )
      ],
    );
  }
}
