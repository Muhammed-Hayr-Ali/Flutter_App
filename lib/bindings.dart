import 'package:application/packages.dart';

import 'app/splash_screen/controller/splashscreen_controller.dart';

class AppBindings extends Bindings {
  @override
  void dependencies() {
    Get.put<SplashScreenController>(SplashScreenController());
  }
}
