import 'package:application/packages.dart';
import 'package:application/required_files.dart';
import 'package:dio/dio.dart';

class Account extends GetxController {
  RxBool isLoading = false.obs;
  RxBool codeHasError = false.obs;

  final Dio _dio = Dio(
    BaseOptions(
        baseUrl: Api.baseUrl,
        connectTimeout: Api.connectTimeout,
        headers: Api.defaultHeaders),
  );
  String? email;
  String? verificationCode;

  void forgotPassword(String mail) async {
    isLoading(true);
    FormData data = FormData.fromMap({
      'email': mail,
    });

    try {
      final response = await _dio.post(Api.forgotPassword, data: data);
      if (!response.data['status']) return;
      final message = response.data['message'];
      CustomNotification.showSnackbar(message: message);

      Get.toNamed(Routes.verifyVerificationCode);

      email = mail;
    } on DioException catch (exception) {
      if (exception.response != null) {
        final responseData = exception.response?.data;
        CustomNotification.showSnackbar(message: responseData['message']);
      } else {
        CustomDioException.exception(exception.type);
      }
    } 
      isLoading(false);
    
  }

  void verifyVerificationCode({required String code}) async {
    isLoading(true);
    FormData data = FormData.fromMap({
      'email': email,
      'code': code,
    });

    try {
      final response = await _dio.post(Api.verifyVerificationCode, data: data);
      if (!response.data['status']) return;
      final message = response.data['message'];
      CustomNotification.showSnackbar(message: message);

      Get.toNamed(Routes.setPassword);

      verificationCode = code;
    } on DioException catch (exception) {
      // codeHasError(true);
      if (exception.response != null) {
        final responseData = exception.response?.data;
        if (responseData['message'] == 'Verification code error') {
          codeHasError(true);
        }
      } else {
        CustomDioException.exception(exception.type);
      }
    }
      isLoading(false);
    
  }

  void resetPassword({required String password}) async {
    isLoading(true);
    FormData data = FormData.fromMap({
      'email': email,
      'password': password,
      'code': verificationCode,
    });

    try {
      final response = await _dio.post(Api.resetPassword, data: data);
      if (!response.data['status']) return;

      final message = response.data['message'];
      CustomNotification.showSnackbar(message: message);

      Get.toNamed(Routes.loginUser);
    } on DioException catch (exception) {
      if (exception.response != null) {
        final responseData = exception.response?.data;
        CustomNotification.showSnackbar(message: responseData['message']);
      } else {
        CustomDioException.exception(exception.type);
      }
    } 
    
      isLoading(false);
    
  }
}
