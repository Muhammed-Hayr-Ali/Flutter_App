import 'package:application/packages.dart';
import 'package:application/required_files.dart';
import 'package:dio/dio.dart';

class ForgotPasswordController extends GetxController {
  RxBool isLoading = false.obs;

  final Dio _dio = Dio(
    BaseOptions(
        baseUrl: Api.baseUrl,
        connectTimeout: Api.connectTimeout,
        headers: Api.defaultHeaders),
  );

  Future<bool> sendVerificationCode({required Map<String, dynamic> map}) async {
    isLoading(true);
    FormData data = FormData.fromMap(map);

    try {
      final response = await _dio.post(Api.forgotPassword, data: data);
      return response.data['status'];
    } on DioException catch (exception) {
      if (exception.response != null) {
        final responseData = exception.response?.data;
        CustomNotification.showSnackbar(message: responseData['message']);
      } else {
        CustomDioException.exception(exception.type);
      }
      return false;
    } finally {
      isLoading(false);
    }
  }


  Future <bool> verifyPhoneNumber({required Map<String, dynamic> map})async{
    isLoading(true);
    FormData data = FormData.fromMap(map);

    try {
      final response = await _dio.post(Api.verifyPhoneNumber, data: data);
      return response.data['status'];
    } on DioException catch (exception) {
      if (exception.response != null) {
        final responseData = exception.response?.data;
        CustomNotification.showSnackbar(message: responseData['message']);
      } else {
        CustomDioException.exception(exception.type);
      }
      return false;
    } finally {
      isLoading(false);
    }
  }


  Future <bool> createNewPassword({required Map<String, dynamic> map})async{
    isLoading(true);
    FormData data = FormData.fromMap(map);

    try {
      final response = await _dio.post(Api.createNewPassword, data: data);
      return response.data['status'];
    } on DioException catch (exception) {
      if (exception.response != null) {
        final responseData = exception.response?.data;
        CustomNotification.showSnackbar(message: responseData['message']);
      } else {
        CustomDioException.exception(exception.type);
      }
      return false;
    } finally {
      isLoading(false);
    }
  }



}
