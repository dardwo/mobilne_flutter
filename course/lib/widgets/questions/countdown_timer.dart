import 'package:course/configs/themes/custom_text_styles.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class CountDownTimer extends StatelessWidget {
  const CountDownTimer({super.key, 
  this.color, 
  required this.time});
  final Color? color;
  final String time;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(
          Icons.timer,
          color: color??Theme.of(context).primaryColor,
        ),
        const SizedBox(width: 5,),
        Text(
          time,
          style: countDownTimerTS().copyWith(color: color),
        )

      ],
    );
  }
}