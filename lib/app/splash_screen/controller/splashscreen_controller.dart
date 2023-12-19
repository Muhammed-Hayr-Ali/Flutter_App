import 'package:onesignal_flutter/onesignal_flutter.dart';
import 'package:uuid/uuid.dart';

import '../../../../packages.dart';
import '../../../../required_files.dart';

class SplashScreenController extends GetxController {
  @override
  void onInit() {
    getCurrentUser();
    super.onInit();
  }

  final LocalStorage _localStorage = LocalStorage();
  final Dio _dio = Dio(
    BaseOptions(
        baseUrl: Api.baseUrl,
        connectTimeout: Api.connectTimeout,
        headers: Api.defaultHeaders),
  );

  void getCurrentUser() async {
    final token = await _localStorage.readData(keys: Keys.token);
    final header = {'Authorization': 'Bearer $token'};

    try {
      final response =
          await _dio.post(Api.currentUser, options: Options(headers: header));
      if (!response.data['status']) Get.offAndToNamed(Routes.authentication);
      final profile = response.data['data']['profile'];
      _localStorage.saveData(keys: Keys.profile, data: profile);

      _localStorage.saveData(keys: Keys.profile, data: profile);
      _localStorage.saveData(keys: Keys.token, data: token);

      final uId = response.data['data']['profile']['id'];
      OneSignal.User.addTagWithKey('id', uId);
      Get.offAndToNamed(Routes.home);
    } on DioException catch (exception) {
      if (exception.response != null) {
        final responseData = exception.response?.data;
        final errorMessage = responseData['message'];
        if (errorMessage != 'Unauthenticated') {
          CustomNotification.showSnackbar(message: errorMessage);
        }
      } else {
        CustomDioException.exception(exception.type);
      }

      Get.offAndToNamed(Routes.authentication);
    }
  }
}
