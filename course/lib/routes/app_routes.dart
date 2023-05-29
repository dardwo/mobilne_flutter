import 'package:course/controllers/question_paper/question_paper_controller.dart';
import 'package:course/controllers/question_paper/questions_controller.dart';
import 'package:course/controllers/zoom_drawer_controller.dart';
import 'package:course/screens/home/home_screen.dart';
import 'package:course/screens/introduction/introduction.dart';
import 'package:course/screens/login/login_screen.dart';
import 'package:course/screens/question/questions_screen.dart';
import 'package:course/screens/question/test_overview_screen.dart';
import 'package:course/screens/splash/splash_screen.dart';
import 'package:get/get.dart';

class AppRoutes {
  static List<GetPage> routes() => [
        GetPage(name: "/", page: () => const SplashScreen()),
        GetPage(
          name: "/introduction",
          page: () => const IntroductionScreen(),
        ),
        GetPage(
            name: "/home",
            page: () => const HomeScreen(),
            binding: BindingsBuilder(() {
              Get.put(QuestionPaperController());
              Get.put(MyZoomDrawerController());
            })),
        GetPage(
          name: LoginScreen.routeName,
          page: ()=>LoginScreen(),
        ),
        GetPage(
          name: QuestionsScreen.routeName,
          page: ()=> const QuestionsScreen(),
          binding: BindingsBuilder((){
            Get.put<QuestionsController>(QuestionsController());
          })
        ),
        GetPage(
          name: TestOverviewScreen.routeName, 
          page: ()=>TestOverviewScreen()
        )
      ];
}