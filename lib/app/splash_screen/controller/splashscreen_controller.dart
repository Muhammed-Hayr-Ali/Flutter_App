import 'package:onesignal_flutter/onesignal_flutter.dart';
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
    try {
      final response = await _dio.post(Api.currentUser,
          options: Options(headers: Authorization().bearer()));

      if (!response.data['status']) Get.offAndToNamed(Routes.authentication);

      final profile = response.data['data']['profile'];
      _localStorage.saveData(keys: Keys.profile, data: profile);
      saveUserData(User.fromJson(profile));

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


  void saveUserData(User user) {
    OneSignal.User.addEmail('${user.email}');
    OneSignal.User.addSms('${user.countryCode}${user.phoneNumber}');
    OneSignal.User.addTags({'id': user.id, 'permissions': user.permissions});
  }



}
