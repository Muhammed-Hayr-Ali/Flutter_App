import '../packages.dart';

custombottomSheet({String? title, Widget? child, bool? isDismissible}) {
  return Get.bottomSheet(
    isDismissible: isDismissible ?? true,
    elevation: 0,
    SizedBox(
      width: double.infinity,
      child: Card(
        elevation: 0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15.0),
        ),
        margin: const EdgeInsets.all(8.0),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              SizedBox(
                child: title != null
                    ? Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          title.tr,
                          style: const TextStyle(
                              fontSize: 18, fontWeight: FontWeight.w500),
                        ),
                      )
                    : null,
              ),
              SizedBox(
                child: child,
              ),
            ],
          ),
        ),
      ),
    ),
    barrierColor: Colors.black26,
  );
}
