import 'package:flutter/material.dart';
import 'package:course/widgets/app_circle_button.dart';
import 'package:get/get.dart';
import 'package:course/configs/themes/app_colors.dart';

class IntroductionScreen extends StatelessWidget {
  const IntroductionScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(gradient: mainGradient()),
        alignment: Alignment.center,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: Get.width*0.2),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(Icons.star, size: 65),
              const SizedBox(height: 40),
              const Text(
                style: TextStyle(
                  fontSize: 18,
                  color: onSurfaceTextColor,
                  fontWeight: FontWeight.bold),
                  textAlign: TextAlign.center,
                "This is simple study app."),
              const SizedBox(height: 40),
              AppCircleButton(
                      onTap: () => Get.offAndToNamed("/home"),
                      child: const Icon(Icons.arrow_forward, size: 35))
            ],
          ),
        ),
      ),
    );
  }
}
