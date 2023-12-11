import '../packages.dart';

custombottomSheet({String? title, Widget? child}) {
  return Get.bottomSheet(
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
                        child: Text(title.tr),
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
