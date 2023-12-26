import 'package:application/packages.dart';
import 'package:application/required_files.dart';
import 'package:dio/dio.dart';

class LoginController extends GetxController {
  RxBool isLoading = false.obs;

  final LocalStorage _localStorage = LocalStorage();
  final Dio _dio = Dio(
    BaseOptions(
        baseUrl: Api.baseUrl,
        connectTimeout: Api.connectTimeout,
        headers: Api.defaultHeaders),
  );

  ///
  Future<bool> login({required Map<String, dynamic> data}) async {
    isLoading(true);

    FormData formData = FormData.fromMap(data);

    try {
      final response = await _dio.post(Api.login, data: formData);

      if (!response.data['status']) return false;

      final profile = response.data['data']['profile'];
      final token = response.data['data']['profile']['token'];
      _localStorage.saveData(keys: Keys.profile, data: profile);
      _localStorage.saveData(keys: Keys.token, data: token);

      return true;
    } on DioException catch (exception) {
      if (exception.response != null) {
        final responseData = exception.response?.data;
        CustomNotification.showSnackbar(message: '${responseData['message']}');
      } else {
        CustomDioException.exception(exception.type);
      }
      return false;
    } finally {
      isLoading(false);
    }
  }
}
