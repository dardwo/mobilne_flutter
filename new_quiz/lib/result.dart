import 'package:flutter/material.dart';

class Result extends StatelessWidget {
  int score;
  final VoidCallback resetScore;

  Result(this.score, this.resetScore);

  String get resultPhrase {
    String resultText;
    if (score <= 1) {
      resultText =
          'You should do the quiz one more time \nYour score is $score';
    } else if (score <= 3) {
      resultText =
          'You could do it better.\nYour score is $score ';
    } else {
      resultText =
          'Well done!\nYour score is $score';
    }
    return resultText;  
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          resultPhrase,
          style: const TextStyle(fontSize: 25),
          textAlign: TextAlign.center,
        ),
        ElevatedButton(
          onPressed: resetScore,
          style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all(Colors.red[100]),
              foregroundColor: MaterialStateProperty.all(Colors.black)),
          child: const Padding(
              padding: EdgeInsets.all(20.0),
              child: Text(
                'Try again',
                style: TextStyle(fontSize: 16),
                textAlign: TextAlign.center,
              )),
        )
      ],
    );
  }
}