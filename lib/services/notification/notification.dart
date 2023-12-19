import 'package:application/packages.dart';
import 'package:onesignal_flutter/onesignal_flutter.dart';
import 'package:uuid/uuid.dart';

class NotificationController extends GetxController {
  @override
  void onInit() {
    super.onInit();
    initPlatformState();
  }

  Future<void> initPlatformState() async {
    OneSignal.initialize('43aa2aec-bdd6-4190-b576-14b795c4e6ad');
    final String externalId = const Uuid().v1().toString();
    await OneSignal.login(externalId);
  }
}
