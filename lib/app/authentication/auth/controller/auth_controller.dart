import 'package:application/packages.dart';
import 'package:application/required_files.dart';
import 'package:dio/dio.dart';

class AuthControlleer extends GetxController {
  final LocalStorage _localStorage = LocalStorage();
  final Dio _dio = Dio(
    BaseOptions(
        baseUrl: Api.baseUrl,
        connectTimeout: Api.connectTimeout,
        headers: Api.defaultHeaders),
  );
  RxBool isLoading = false.obs;
  RxString countryCode = '+963'.obs;
  RxString registerError = ''.obs;
  RxString genderValue = 'Unspecified'.obs;


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

      FormData data = FormData.fromMap({
        'name': googleUser.displayName,
        'email': googleUser.email.toString(),
        'password': googleUser.id,
        'profile': googleUser.photoUrl.toString()
      });

      final response = await _dio.post(Api.continueWithGoogle, data: data);

      if (!response.data['status']) return;
      final isNewUser = response.data['message'];
      final profile = response.data['data']['profile'];
      final token = response.data['data']['profile']['token'];
      _localStorage.saveData(keys: Keys.profile, data: profile);
      _localStorage.saveData(keys: Keys.token, data: token);


      Get.offAllNamed(Routes.home);
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

  
  Future<void> dataPolicy() async {
    final Uri url = Uri.parse(AppConstants.getPrivacyPolicyUrl);
    if (!await launchUrl(url, mode: LaunchMode.externalApplication)) {
      throw Exception('Could not launch $url');
    }
  }


}
