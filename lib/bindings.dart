import 'package:application/packages.dart';
import 'package:application/services/onesgnal/onesignalinit.dart';

class AppBindings extends Bindings {
  @override
  void dependencies() {
    Get.put(OneSignalinit());
  }
}
