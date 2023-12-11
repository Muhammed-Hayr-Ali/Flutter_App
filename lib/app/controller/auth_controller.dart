import 'package:dio/dio.dart';
import 'package:application/packages.dart';
import 'package:application/required_files.dart';

class AuthController extends GetxController {
//
  RxBool isLoading = false.obs;

  final LocalStorage _localStorage = LocalStorage();

  final Dio _dio = Dio(
    BaseOptions(
        baseUrl: Api.baseUrl,
        connectTimeout: Api.connectTimeout,
        headers: Api.defaultHeaders),
  );

//

  Future<bool> creatNewAccount({
    required String name,
    required String email,
    required String password,
    String? path,
  }) async {
    isLoading(true);

    FormData data = FormData.fromMap({
      "name": name,
      "email": email,
      "password": password,
    });

    if (path != '') {
      MultipartFile photo = await MultipartFile.fromFile(path!);
      data.files.add(MapEntry("photo", photo));
    }

    try {
      final response = await _dio.post(Api.register, data: data);

      if (!response.data['status']) return false;
      await _localStorage.saveData(
          keys: Keys.token, data: response.data['token']);

      await _localStorage.saveData(
          keys: Keys.profile, data: response.data['user']);

      CustomNotification.showSnackbar(
          message: '${'Welcome to the world of '.tr} ${AppConstants.appName}');

      return true;
    } on DioException catch (e) {
      CustomNotification.showSnackbar(
          message: e.response?.data['message'] ?? e.error);

      return false;
    } finally {
      isLoading(false);
    }
  }

  Future<bool> userLogin(
      {required String email, required String password}) async {
    isLoading(true);
    final data = {"email": email, "password": password};
    try {
      final response = await _dio.post(Api.login, data: data);

      if (!response.data['status']) return false;
      await _localStorage.saveData(
          keys: Keys.token, data: response.data['token']);

      await _localStorage.saveData(
          keys: Keys.profile, data: response.data['user']);

      var userName = response.data['user']['name'] ?? '';
      CustomNotification.showSnackbar(
          message: '${'Welcome Back,'.tr} $userName');
      return true;
    } on DioException catch (e) {
      CustomNotification.showSnackbar(
          message: e.response?.data['message'] ?? e.error);
      return false;
    } finally {
      isLoading(false);
    }
  }

  Future<bool> resetPassword(String email) async {
    isLoading(true);
    final data = {"email": email};
    try {
      await _dio.post(Api.resetPassword, data: data);
      CustomNotification.showSnackbar(
          message:
              'Verification code sent successfully. You can find it in your inbox');
      return true;
    } on DioException catch (e) {
      CustomNotification.showSnackbar(
          message: e.response?.data['message'] ?? e.error);
      return false;
    } finally {
      isLoading(false);
    }
  }

  Future<bool> reset(
      String email, String verificationCode, String password) async {
    isLoading(true);
    final data = {
      'email': email,
      'verificationCode': verificationCode,
      'password': password
    };

    try {
      final response = await _dio.post(Api.updatePassword, data: data);
      await _localStorage.saveData(
          keys: Keys.token, data: response.data['token']);
      await _localStorage.saveData(
          keys: Keys.profile, data: response.toString());
      CustomNotification.showSnackbar(message: 'Password changed successfully');

      return true;
    } on DioException catch (e) {
      CustomNotification.showSnackbar(
          message: e.response?.data['message'] ?? e.error);
      return false;
    } finally {
      isLoading(false);
    }
  }

  Future<bool> continueWithGoogle() async {
    isLoading(true);

    final GoogleSignIn googleSignIn = GoogleSignIn(scopes: ['email']);
    try {
      final GoogleSignInAccount? googleUser = await googleSignIn.signIn();
      if (googleUser == null) {
        CustomNotification.showSnackbar(
            message: 'We were unable to obtain your account information');
        return false;
      }
      debugPrint(googleUser.photoUrl.toString());
      final data = {
        'name': '${googleUser.displayName}',
        'email': googleUser.email,
        'password': googleUser.id,
        'profile_url': '${googleUser.photoUrl}'
      };

      debugPrint(data.toString());
      final response = await _dio.post(Api.continueWithGoogle, data: data);
      _localStorage.saveData(keys: Keys.token, data: response.data['token']);

      _localStorage.saveData(keys: Keys.profile, data: response.data['user']);

      var userName = response.data['user']['name'] ?? '';

      CustomNotification.showSnackbar(
          message: response.data['newUser']
              ? 'Welcome to the world of new_appna'
              : '${'Welcome Back,'.tr} $userName');
      return true;
    } on DioException catch (e) {
      CustomNotification.showSnackbar(
          message: e.response?.data['message'] ?? e.error);
      return false;
    } finally {
      isLoading(false);
    }
  }

  Future<bool> logout() async {
    String token = await _localStorage.readData(keys: Keys.token);
    final options = Options(headers: {'Authorization': 'Bearer $token'});
    try {
      await _dio.post(Api.logout, options: options);

      _localStorage.remove(keys: Keys.token);
      _localStorage.remove(keys: Keys.profile);
      CustomNotification.showSnackbar(message: 'Signed out successfully');
      return true;
    } on DioException catch (e) {
      CustomNotification.showSnackbar(
          message: e.response?.data['message'] ?? e.error);
      return false;
    }
  }

  Future<void> dataPolicy() async {
    final Uri url = Uri.parse(AppConstants.getPrivacyPolicyUrl);
    if (!await launchUrl(url, mode: LaunchMode.externalApplication)) {
      throw Exception('Could not launch $url');
    }
  }
}
