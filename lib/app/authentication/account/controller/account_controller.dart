import 'package:application/packages.dart';
import 'package:application/required_files.dart';
import 'package:dio/dio.dart';

class AccountController extends GetxController {
  RxBool isLoading = false.obs;
  RxString forgotPasswordError = ''.obs;
  RxString verifyVerificationCodeError = ''.obs;
  RxString createNewPasswordError = ''.obs;

  final Dio _dio = Dio(
    BaseOptions(
        baseUrl: Api.baseUrl,
        connectTimeout: Api.connectTimeout,
        headers: Api.defaultHeaders),
  );
  String? email;
  String? verificationCode;

  void forgotPassword({required String mail}) async {
    isLoading(true);
    FormData data = FormData.fromMap({
      'email': mail,
    });

    try {
      final response = await _dio.post(Api.forgotPassword, data: data);
      if (!response.data['status']) return;

      Get.toNamed(Routes.verifyVerificationCode);

      email = mail;
    } on DioException catch (exception) {
      if (exception.response != null) {
        final responseData = exception.response?.data;
        forgotPasswordError.value = responseData['message'];
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
      // final message = response.data['message'];
      // CustomNotification.showSnackbar(message: message);

      Get.toNamed(Routes.createNewPassword);

      verificationCode = code;
    } on DioException catch (exception) {
      // codeHasError(true);
      if (exception.response != null) {
        final responseData = exception.response?.data;
        verifyVerificationCodeError(responseData['message']);
      } else {
        CustomDioException.exception(exception.type);
      }
    }
    isLoading(false);
  }

  void createNewPassword({required String password}) async {
    isLoading(true);
    FormData data = FormData.fromMap({
      'email': email,
      'password': password,
      'code': verificationCode,
    });

    try {
      final response = await _dio.post(Api.createNewPassword, data: data);
      if (!response.data['status']) return;

      final message = response.data['message'];
      CustomNotification.showSnackbar(message: message);

      Get.toNamed(Routes.loginUser);
    } on DioException catch (exception) {
      if (exception.response != null) {
        final responseData = exception.response?.data;
        createNewPasswordError.value = responseData['message'];
      } else {
        CustomDioException.exception(exception.type);
      }
    }

    isLoading(false);
  }
}
