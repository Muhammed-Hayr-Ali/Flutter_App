import 'package:application/packages.dart';
import 'package:application/services/notification/notification.dart';

class AppBindings extends Bindings {
  @override
  void dependencies() {
    Get.put(NotificationController());
  }
}
