import 'package:flutter/material.dart';


class QuestionWidget extends StatefulWidget {
  const QuestionWidget({Key? key}) : super(key: key);

  _QuestionWidgetState createState() => _QuestionWidgetState();
}

class _QuestionWidgetState extends State<QuestionWidget> {
  var questionId = 0;
  var questions = [
    {
      'question': '5 + 8 = ?',
      'answer1': '11',
      'answer2': '12',
      'answer3': '13',
      'correct': '3',
    },
    {
      'question': '2 * 8 = ?',
      'answer1': '24',
      'answer2': '16',
      'answer3': '64',
      'correct': '2',
    },
    {
      'question': '2 + 21 = ?',
      'answer1': '21',
      'answer2': '41',
      'answer3': '23',
      'correct': '3',
    },
  ];

  @override
  void answer() {
    setState(() {
      questionId = (questionId + 1) % questions.length ;
    });
  }

  void resetscore() {
    setState(() {
      isPressed = true;
      counter = 0;
      tmp = 0;
      click = '0';
    });
  }

  bool isPressed = true;
  int counter = 0;
  int tmp = 0;
  String click = '0';

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
    
          Text('${counter} pkt'),
          Text(questions[questionId]['question']!,
              style: TextStyle(fontSize: 25)),
          ElevatedButton(
            onPressed: isPressed
                ? () {
                    tmp += 1;
                    tmp == 3 ? isPressed = false : null;
                    click = '1';
                    questions[questionId]['correct'] == click
                        ? counter += 1
                        : null;
                    answer();
                  }
                : null,
            child: Text(questions[questionId]['answer1']!),
          ),
          ElevatedButton(
            onPressed: isPressed
                ? () {
                    tmp += 1;
                    tmp == 3 ? isPressed = false : null;
                    click = '2';
                    questions[questionId]['correct'] == click
                        ? counter += 1
                        : null;
                    answer();
                  }
                : null,
            child: Text(questions[questionId]['answer2']!),
          ),
          ElevatedButton(
              onPressed: isPressed
                  ? () {
                      tmp += 1;
                      tmp == 3 ? isPressed = false : null;
                      click = '3';
                      questions[questionId]['correct'] == click
                          ? counter += 1
                          : null;
                      answer();
                    }
                  : null,
              child: Text(questions[questionId]['answer3']!)),
        ],
      ),
    );
  }
}