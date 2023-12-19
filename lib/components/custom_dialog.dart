import '../packages.dart';
import '../required_files.dart';

Future<bool> confirmDialog({required String title, Widget? content}) async {
  bool result = false;
  await Get.defaultDialog(
    title: title.tr,
    content: SizedBox(
      width: Get.width,
      child: Column(
        children: [
          content ?? const SizedBox(),
          CustomElevatedButton(
            child: Text(
              'Ok'.tr,
              style: const TextStyle(color: Colors.black87),
            ),
            onPressed: () => Get.back(result: true),
          ),
          const SizedBox(height: 8),
          CustomElevatedButton(
            backgroundColor: Colors.grey.shade100,
            child: Text(
              'Cancel'.tr,
              style: const TextStyle(color: Colors.black87),
            ),
            onPressed: () => Get.back(result: false),
          )
        ],
      ),
    ),
    radius: 10,
    titleStyle: const TextStyle(fontSize: 16),
  ).then((value) => result = value ?? false);
  return result;
}

Future<String> inputDialog(
    {required String title,
    required String hintText,
    int? mainLength,
    String? errorMessage}) async {
  final inputController = TextEditingController();
  String result = '';
  await Get.defaultDialog(
          title: title.tr,
          content: SizedBox(
            width: Get.width,
            child: Column(
              children: [
                Container(
                  padding: const EdgeInsets.all(8.0),
                  width: double.infinity,
                  decoration: BoxDecoration(
                      color: Colors.grey.shade100,
                      borderRadius: BorderRadius.circular(10.0)),
                  child: TextFormField(
                    minLines: 8,
                    maxLines: 10,
                    maxLength: 250,
                    autofocus: false,
                    controller: inputController,
                    decoration: InputDecoration(
                      contentPadding: EdgeInsets.zero,
                      counterStyle: const TextStyle(
                        height: double.minPositive,
                      ),
                      counterText: "",
                      hintStyle:
                          const TextStyle(fontSize: 14, color: Colors.black45),
                      hintText: hintText.tr,
                      border: InputBorder.none,
                    ),
                  ),
                ),
                const SizedBox(height: 8),
                CustomElevatedButton(
                    child: Text(
                      'Ok'.tr,
                      style: const TextStyle(color: Colors.black87),
                    ),
                    onPressed: () {
                      if (mainLength != null) {
                        if (inputController.text.length < mainLength) {
                          errorMessage != null
                              ? CustomNotification.showToast(
                                  message: errorMessage,
                                  )
                              : null;

                          return;
                        }
                      }

                      Get.back(result: inputController.text);
                    }),
                const SizedBox(height: 8),
                CustomElevatedButton(
                  child: Text(
                    'Cancel'.tr,
                    style: const TextStyle(color: Colors.black87),
                  ),
                  onPressed: () => Get.back(result: ''),
                )
              ],
            ),
          ),
          radius: 10,
          titleStyle: const TextStyle(fontSize: 16))
      .then((value) => result = value ?? '');
  return result;
}
