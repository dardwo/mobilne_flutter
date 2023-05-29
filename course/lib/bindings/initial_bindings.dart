import 'package:course/controllers/auth_controller.dart';
import 'package:course/controllers/theme_controller.dart';
import 'package:course/services/firebase_storage_service.dart';
import 'package:get/get.dart';

class InitialBindings implements Bindings {
  @override
  void dependencies(){
    Get.put(ThemeController());
    Get.put(AuthController(), permanent: true);
    //Get.put(FirebaseStorageService());
    Get.lazyPut(() => FirebaseStorageService());

  }
}
