import 'package:application/packages.dart';
import 'package:application/required_files.dart';
import 'package:dio/dio.dart';

class ProfileController extends GetxController {
  @override
  void onInit() {
    super.onInit();
    getCurrentUser();
  }

  RxBool isLoading = false.obs;

  final LocalStorage _localStorage = LocalStorage();
  final Dio _dio = Dio(
    BaseOptions(
        baseUrl: Api.baseUrl,
        connectTimeout: Api.connectTimeout,
        headers: Api.defaultHeaders),
  );
  // Rx<User?> currentUser =User().obs;

  User? currentUser;

  String? path;

  getCurrentUser() async {
    final user = await _localStorage.readData(keys: Keys.profile);
    currentUser = User.fromJson(user);
    if (currentUser == null) return;
    update();
  }

  Future<bool> updateProfile({required Map<String, dynamic> newUser}) async {
    isLoading(true);

    FormData data = FormData.fromMap(newUser);

    if (newUser['path'] != null) {
      MultipartFile photo = await MultipartFile.fromFile(newUser['path']);
      data.files.add(MapEntry('profile', photo));
    }

    try {
      final response = await _dio.post(Api.updateProfile,
          options: Options(headers: Authorization().bearer()), data: data);
      if (!response.data['status']) return false;

      final profile = response.data['data']['profile'];
      _localStorage.saveData(keys: Keys.profile, data: profile);

      CustomNotification.showSnackbar(message: response.data['message']);

      await getCurrentUser();
      update();
      return true;
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


  Future<bool> logout() async {
    isLoading(true);


    try {
      final response = await _dio.post(Api.logout,
          options: Options(headers: Authorization().bearer()));
      if (!response.data['status']) return false;
      _localStorage.remove(keys: Keys.profile);
      _localStorage.remove(keys: Keys.token);

      return true;
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
