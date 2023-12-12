import '../packages.dart';

class CustomNotification {
  CustomNotification._();

  static showToast({String? title, required String message}) {
    Fluttertoast.showToast(
        msg: message.tr,
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 1,
        fontSize: 16.0);
  }

  static showSnackbar({String? title, required String message}) {
    Get.snackbar(
      '',
      '',
      titleText: const SizedBox(),
      messageText: Text(
        message.tr,
        style: const TextStyle(fontSize: 12.0, height: 1.5),
      ),
      borderRadius: 4.0,
      snackPosition: SnackPosition.TOP,
      padding: const EdgeInsets.fromLTRB(8, 8, 8, 16),
    );
  }
}
