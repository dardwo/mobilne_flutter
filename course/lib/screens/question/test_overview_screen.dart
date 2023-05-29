import 'package:course/configs/themes/custom_text_styles.dart';
import 'package:course/configs/themes/ui_parameters.dart';
import 'package:course/controllers/question_paper/questions_controller.dart';
import 'package:course/screens/home/question_card.dart';
import 'package:course/widgets/common/background_decoration.dart';
import 'package:course/widgets/common/custom_app_bar.dart';
import 'package:course/widgets/common/main_button.dart';
import 'package:course/widgets/content_area.dart';
import 'package:course/widgets/questions/answer_card.dart';
import 'package:course/widgets/questions/countdown_timer.dart';
import 'package:course/widgets/questions/question_number_card.dart';
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
                      shrinkWrap: true,
                      physics: BouncingScrollPhysics(),
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: Get.width~/75,
                        childAspectRatio: 1,
                        crossAxisSpacing: 8,
                        mainAxisSpacing: 8,
                        ),
                      itemBuilder: (_, index){
                        AnswerStatus? _answerStatus;
                        if(controller.allQuestions[index].selectedAnswer!=null){
                          _answerStatus = AnswerStatus.answered;
                        }
                        return QuestionNumberCard(
                          index: index+1, 
                          status: _answerStatus, 
                          onTap: ()=>controller.jumpToQuestion(index)
                          
                        );
                      }
                    ),
                  )

                  ],
                ),
              ),
            ),
            ColoredBox(
              color: Theme.of(context).scaffoldBackgroundColor,
              child: Padding(
                padding: UIParameters.mobileScreenPadding,
                child: MainButton(
                  onTap: (){
                    controller.complete();
                  },
                  title: 'Complete',
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}