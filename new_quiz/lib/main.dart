import 'package:flutter/material.dart';
import './quiz.dart';
import './result.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  State<StatefulWidget> createState() {
    // TODO: implement createState
    return MyAppState();
  }
}

class MyAppState extends State {
  int questionIndex = 0;
  int totalScore = 0;
  var questions = [
    {
      'question':
          '2+2=?',
      'answers': [
        {
          'text':
              '2',
          'score': 0
        },
        {
          'text':
              '3',
          'score': 0
        },
        {
          'text':
              '4',
          'score': 1
        }
      ]
    },
    {
      'question': '2+3=?',
      'answers': [
        {
          'text':
              '5',
          'score': 1
        },
        {
          'text':
              '4',
          'score': 0
        },
        {
          'text':
              '8',
          'score': 0
        }
      ]
    },
    {
      'question': '3+8=?',
      'answers': [
        {
          'text':
              '11',
          'score': 1
        },
        {
          'text':
              '10',
          'score': 0
        }
      ]
    },
    {
      'question': '2+5+5=?',
      'answers': [
        {
          'text':
              '15',
          'score': 0
        },
        {
          'text':
              '12',
          'score': 1
        },
        {
          'text':
              '5',
          'score': 0
        }
      ]
    },
    //
  ];

  void resetScore() {
    setState(() {
      totalScore = 0;
      questionIndex = 0;
    });
  }

  void answerQuestion(int score) {
    totalScore += score;
    setState(() {
      questionIndex += 1 % questions.length;
    });
    print(totalScore);
  }

  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Simple Quiz App'),
        ),
        body: questionIndex < questions.length
            ? Quiz(questions, answerQuestion, questionIndex)
            : Result(totalScore, resetScore),
      ),
    );
  }
}