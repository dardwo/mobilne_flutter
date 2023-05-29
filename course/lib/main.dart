import 'package:course/bindings/initial_bindings.dart';
import 'package:course/configs/themes/app_light_theme.dart';
import 'package:course/data_uploader_screen.dart';
import 'package:course/routes/app_routes.dart';
import 'package:course/screens/introduction/introduction.dart';
import 'package:course/screens/splash/splash_screen.dart';
import 'package:course/services/firebase_storage_service.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'controllers/theme_controller.dart';
import 'firebase_options.dart';

void main() {
  Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  WidgetsFlutterBinding.ensureInitialized();
  InitialBindings().dependencies(); //inject from InitialBindings (Get.put(AuthController()))
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      // theme: LightTheme().buildLightTheme(),
      theme: Get.find<ThemeController>().lightTheme,
      getPages: AppRoutes.routes());
  }
}

// check if backend works fine
// Future<void> main() async {
//   WidgetsFlutterBinding.ensureInitialized();
//   await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
//   runApp(GetMaterialApp(home: HomeScreen()));
// }