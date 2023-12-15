import 'package:application/packages.dart';
import 'package:application/required_files.dart';
import 'package:dio/dio.dart';

class AuthControlleer extends GetxController {
  RxBool isLoading = false.obs;
  RxString countryCode = '+963'.obs;
  RxString checkMailAvailabilityError = ''.obs;
  RxString registerError = ''.obs;
  RxString genderValue = 'Unspecified'.obs;

  final LocalStorage _localStorage = LocalStorage();
  final Dio _dio = Dio(
    BaseOptions(
        baseUrl: Api.baseUrl,
        connectTimeout: Api.connectTimeout,
        headers: Api.defaultHeaders),
  );

  void checkMailAvailability({required Map user}) async {
    isLoading(true);

    FormData data = FormData.fromMap({
      'email': user['email'],
    });

    try {
      final response = await _dio.post(Api.checkMailAvailability, data: data);
      if (!response.data['status']) return;

      Get.toNamed(Routes.completetYourProfile, arguments: user);
    } on DioException catch (exception) {
      if (exception.response != null) {
        final responseData = exception.response?.data;
        checkMailAvailabilityError.value = responseData['message'];
      } else {
        CustomDioException.exception(exception.type);
      }
    } finally {
      isLoading(false);
    }
  }

  void register(Map<dynamic, dynamic> user) async {
    isLoading(true);

    FormData data = FormData.fromMap({
      'name': user['name'],
      'email': user['email'],
      'password': user['password'],
      'country_code': user['country_code'],
      'phone_number': user['phone_number'],
      'gender': user['gender'],
      'date_birth': user['date_birth'],
    });

    if (user['path'] != '') {
      MultipartFile photo = await MultipartFile.fromFile(user['path']!);
      data.files.add(MapEntry('profile', photo));
    }

    try {
      final response = await _dio.post(Api.register, data: data);
      if (!response.data['status']) return;

      final profile = response.data['data']['profile'];
      final token = response.data['data']['profile']['token'];

      _localStorage.saveData(keys: Keys.profile, data: profile);
      _localStorage.saveData(keys: Keys.token, data: token);

      Get.offAllNamed(Routes.home);
      CustomNotification.showSnackbar(
          message: '${'Welcome to the world of '.tr} ${AppConstants.appName}');
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

  void login(Map<dynamic, dynamic> user) async {
    isLoading(true);

    FormData data = FormData.fromMap({
      'email': user['email'],
      'password': user['password'],
    });

    try {
      final response = await _dio.post(Api.login, data: data);
      if (!response.data['status']) return;

      final profile = response.data['data']['profile'];
      final token = response.data['data']['profile']['token'];

      _localStorage.saveData(keys: Keys.profile, data: profile);
      _localStorage.saveData(keys: Keys.token, data: token);
      Get.offAllNamed(Routes.home);
      CustomNotification.showSnackbar(
          message:
              '${'Welcome Back,'.tr} ${response.data['data']['profile']['name']}');
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

  void continueWithGoogle() async {
    isLoading(true);
    final GoogleSignIn googleSignIn = GoogleSignIn(scopes: ['email']);
    try {
      final GoogleSignInAccount? googleUser = await googleSignIn.signIn();
      if (googleUser == null) {
        CustomNotification.showSnackbar(
            message: 'We were unable to obtain your account information');
        return;
      }

      Map data = {
        'name': googleUser.displayName,
        'email': googleUser.email.toString(),
        'password': googleUser.id,
        'profile': googleUser.photoUrl.toString()
      };

      final response = await _dio.post(Api.continueWithGoogle, data: data);

      if (!response.data['status']) return;
      final profile = response.data['data']['profile'];
      final token = response.data['data']['profile']['token'];
      final isNewUser = response.data['message'];

      _localStorage.saveData(keys: Keys.profile, data: profile);
      _localStorage.saveData(keys: Keys.token, data: token);
      CustomNotification.showSnackbar(
          message: isNewUser
              ? '${'Welcome to the world of '.tr} ${AppConstants.appName}'
              : '${'Welcome Back,'.tr} ${response.data['data']['profile']['name']}');

      Get.offAllNamed(Routes.home);
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

  void logout() async {
    final token = await _localStorage.readData(keys: Keys.token);
    final header = {'Authorization': 'Bearer $token'};
    try {
      final response =
          await _dio.post(Api.logout, options: Options(headers: header));
      if (!response.data['status']) return;

      _localStorage.remove(keys: Keys.profile);
      Get.offAndToNamed(Routes.authentication);
    } on DioException catch (exception) {
      if (exception.response != null) {
        final responseData = exception.response?.data;
        final errorMessage = responseData['message'];
        CustomNotification.showSnackbar(message: errorMessage);
      } else {
        CustomDioException.exception(exception.type);
      }

      Get.offAndToNamed(Routes.authentication);
    }
  }

  Future<void> dataPolicy() async {
    final Uri url = Uri.parse(AppConstants.getPrivacyPolicyUrl);
    if (!await launchUrl(url, mode: LaunchMode.externalApplication)) {
      throw Exception('Could not launch $url');
    }
  }
}