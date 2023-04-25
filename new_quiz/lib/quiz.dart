import 'package:flutter/material.dart';
import './question.dart';
import './answer.dart';

class Quiz extends StatelessWidget {
  final int questionIndex;
  final List<Map<String, Object>> questionList;
  final Function(int) selectHandler;

  Quiz(
    this.questionList,
    this.selectHandler,
    this.questionIndex,
  );

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Question(questionList[questionIndex]['question'] as String),
        ...(questionList[questionIndex]['answers'] as List<Map<String, Object>>)
            .map((answer) {
          return Answer(answer['text'] as String,
              () => selectHandler(answer['score'] as int));
        }).toList(),
      ],
    );
  }
}