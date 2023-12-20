import 'package:application/packages.dart';
import '../../required_files.dart';

class PerHandler {
  PerHandler._();
  static Future<bool> storage() async {
    var status = await Permission.storage.request();
    if (status.isGranted) {
      return true;
    } else if (status.isPermanentlyDenied) {
      CustomNotification.showSnackbar(
          message:
              'Permission to access files has been permanently denied. You can grant permission through settings');
      return false;
    }

    return false;
  }

  static Future<bool> camera() async {
    var status = await Permission.camera.request();
    if (status.isGranted) {
      return true;
    } else if (status.isPermanentlyDenied) {
      CustomNotification.showSnackbar(
          message:
              'Permission to access camera has been permanently denied. You can grant permission through settings');
      return false;
    }

    return false;
  }

  static Future<bool> notification() async {
    var status = await Permission.notification.request();
    if (status.isGranted) {
      return true;
    } else if (status.isPermanentlyDenied) {
      CustomNotification.showSnackbar(
          message:
              'Permission to access notification has been permanently denied. You can grant permission through settings');
      return false;
    }

    return false;
  }

  static Future<bool> location() async {
    var status = await Permission.location.request();
    if (status.isGranted) {
      return true;
    } else if (status.isPermanentlyDenied) {
      CustomNotification.showSnackbar(
          message:
              'Permission to access notification has been permanently denied. You can grant permission through settings');
      return false;
    }

    return false;
  }
}
