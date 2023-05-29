import 'package:course/configs/themes/custom_text_styles.dart';
import 'package:course/configs/themes/ui_parameters.dart';
import 'package:course/controllers/question_paper/questions_controller.dart';
import 'package:course/screens/home/question_card.dart';
import 'package:course/widgets/common/background_decoration.dart';
import 'package:course/widgets/common/custom_app_bar.dart';
import 'package:course/widgets/content_area.dart';
import 'package:course/widgets/questions/countdown_timer.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TestOverviewScreen extends GetView<QuestionsController> {
  const TestOverviewScreen({super.key});
  static const String routeName = "/testoverview";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: CustomAppBar(
        title: controller.completedTest,
      ),
      body: BackgroundDecoration(
        child: Column(
          children: [
            Expanded(
              child: ContentArea(
                child: Column(
                  children:[ Row(
                    children: [
                      CountDownTimer(
                        color: UIParameters.isDarkMode()?
                        Theme.of(context).textTheme.bodyLarge!.color
                        :Theme.of(context).primaryColor,
                        time:'',
                      ),
                      Obx(
                        ()=>Text(
                          '${controller.time} Remaining',
                          style: countDownTimerTS(),
                        )
                      )
                    ],
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Expanded(
                    child: GridView.builder(
                      itemCount: controller.allQuestions.length,
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: Get.width~/75,
                        childAspectRatio: 1,
                        crossAxisSpacing: 8,
                        mainAxisExtent: 8,
                        ),
                      itemBuilder: (_, index){
                        return Text('${controller.allQuestions[index].selectedAnswer!=null}',
                        style: TextStyle(fontSize: 10),
                        );
                      }
                    ),
                  )

                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}