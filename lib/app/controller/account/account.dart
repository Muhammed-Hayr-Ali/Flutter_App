import 'package:application/packages.dart';
import 'package:application/required_files.dart';
import 'package:dio/dio.dart';

class Account extends GetxController {
  RxBool isLoading = false.obs;

  final Dio _dio = Dio(
    BaseOptions(
        baseUrl: Api.baseUrl,
        connectTimeout: Api.connectTimeout,
        headers: Api.defaultHeaders),
  );
  String? _email;

  void forgotPassword(String email) async {
    isLoading(true);
    FormData data = FormData.fromMap({
      'email': email,
    });

    try {
      final response = await _dio.post(Api.forgotPassword, data: data);
      if (!response.data['status']) return;
      final message = response.data['message'];
      CustomNotification.showSnackbar(message: message);

      Get.toNamed(Routes.setPassword);
      _email = email;
    } on DioException catch (exception) {
      if (exception.response != null) {
        final responseData = exception.response?.data;
        CustomNotification.showSnackbar(message: responseData['message']);
      } else {
        CustomDioException.exception(exception.type);
      }
    } finally {
      isLoading(false);
    }
  }

  void resetPassword({required String password, required String verificationCode}) async {
    isLoading(true);
    FormData data = FormData.fromMap({
      'email': _email,
      'password': password,
      'code': verificationCode,
    });

    try {
      final response = await _dio.post(Api.resetPassword, data: data);
      if (!response.data['status']) return;

      Get.toNamed(Routes.loginUser);
      final message = response.data['message'];
      CustomNotification.showSnackbar(message: message);
    } on DioException catch (exception) {
      if (exception.response != null) {
        final responseData = exception.response?.data;
        CustomNotification.showSnackbar(message: responseData['message']);
      } else {
        CustomDioException.exception(exception.type);
      }
    } finally {
      isLoading(false);
    }
  }
}
