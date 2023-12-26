import 'package:application/packages.dart';
import 'package:application/required_files.dart';
import 'package:onesignal_flutter/onesignal_flutter.dart';
import 'package:uuid/uuid.dart';
import 'package:simnumber/sim_number.dart';
import 'package:simnumber/siminfo.dart';

class OneSignalinit extends GetxController {
  LocalStorage localStorage = LocalStorage();

  @override
  void onInit() {
    super.onInit();
    initPlatformState();
  }

  initPlatformState() async {
    OneSignal.Debug.setLogLevel(OSLogLevel.verbose);

    OneSignal.initialize('49ef83b6-29de-457c-a160-de17abc8456c');
    OneSignal.Notifications.requestPermission(await PerHandler.notification());

    final externalId =
        localStorage.readData(keys: Keys.uuid) ?? const Uuid().v1();
    localStorage.saveData(keys: Keys.uuid, data: externalId);
    await OneSignal.login(externalId);

    if (await PerHandler.phone()) {
      SimInfo simInfo = await SimNumber.getSimData();
      for (var s in simInfo.cards) {
        OneSignal.User.addTagWithKey(
            'phoneNumber${s.slotIndex}', '${s.phoneNumber}');
      }
    }
  }
}
