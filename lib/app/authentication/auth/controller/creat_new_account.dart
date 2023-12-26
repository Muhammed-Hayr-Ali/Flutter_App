import 'package:application/packages.dart';
import 'package:dio/dio.dart';
import '../../../../required_files.dart';

class CreatNewAccountController extends GetxController {
  RxBool isLoading = false.obs;

  final LocalStorage _localStorage = LocalStorage();
  final Dio _dio = Dio(
    BaseOptions(
        baseUrl: Api.baseUrl,
        connectTimeout: Api.connectTimeout,
        headers: Api.defaultHeaders),
  );

  ///
  Future<bool> checkMailAvailability(
      {required Map<String, dynamic> data}) async {
    isLoading(true);

    FormData formData = FormData.fromMap(data);

    try {
      final response =
          await _dio.post(Api.checkMailAvailability, data: formData);
      return response.data['status'];
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

  Future<bool> sendVerificationCode(
      {required Map<String, dynamic> data}) async {
    isLoading(true);

    FormData formData = FormData.fromMap(data);

    try {
      final response =
          await _dio.post(Api.sendVerificationCode, data: formData);
      return response.data['status'];
      
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

  Future<bool> completeRegistration(
      {required Map<String, dynamic> data}) async {
    isLoading(true);

    FormData formData = FormData.fromMap(data);

    try {
      final response =
          await _dio.post(Api.completeRegistration, data: formData);
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



//   RxString countryCode = '+963'.obs;
//   RxString registerError = ''.obs;
//   RxString genderValue = 'Unspecified'.obs;

//   void checkMailAvailability({required Map user}) async {
//     isLoading(true);

//     FormData data = FormData.fromMap({
//       'email': user['email'],
//     });






//     try {
//       final response = await _dio.post(Api.checkMailAvailability, data: data);
//       if (!response.data['status']) return;

//       Get.toNamed(Routes.completetYourProfile, arguments: user);
//     } on DioException catch (exception) {
//       if (exception.response != null) {
//         final responseData = exception.response?.data;
//         CustomNotification.showSnackbar(message: '${responseData['message']}');

//       } else {
//         CustomDioException.exception(exception.type);
//       }
//     } finally {
//       isLoading(false);
//     }
//   }

//   void register(Map<String, dynamic> user) async {
//     isLoading(true);

//     FormData data = FormData.fromMap(user);

//     if (user['path'] != '') {
//       MultipartFile photo = await MultipartFile.fromFile(user['path']!);
//       data.files.add(MapEntry('profile', photo));
//     }

//     try {
//       final response = await _dio.post(Api.register, data: data);
//       if (!response.data['status']) return;

//       final profile = response.data['data']['profile'];
//       final token = response.data['data']['profile']['token'];
//       _localStorage.saveData(keys: Keys.profile, data: profile);
//       _localStorage.saveData(keys: Keys.token, data: token);
//       saveUserData(User.fromJson(profile));

//       Get.offAllNamed(Routes.home);
//       CustomNotification.showSnackbar(
//           message: '${'Welcome to the world of '.tr} ${AppConstants.appName}');
//     } on DioException catch (exception) {
//       if (exception.response != null) {
//         final responseData = exception.response?.data;
//         CustomNotification.showSnackbar(message: responseData['message']);
//       } else {
//         CustomDioException.exception(exception.type);
//       }
//     } finally {
//       isLoading(false);
//     }
//   }

//   void login(Map<String, dynamic> user) async {
//     isLoading(true);

//     FormData data = FormData.fromMap(user);

//     try {
//       final response = await _dio.post(Api.login, data: data);
//       if (!response.data['status']) return;

//       final token = response.data['data']['profile']['token'];
//       final profile = response.data['data']['profile'];
//       _localStorage.saveData(keys: Keys.token, data: token);
//       _localStorage.saveData(keys: Keys.profile, data: profile);
//       saveUserData(User.fromJson(profile));

//       Get.offAllNamed(Routes.home);

//       CustomNotification.showSnackbar(
//           message:
//               '${'Welcome Back,'.tr} ${response.data['data']['profile']['name']}');
//     } on DioException catch (exception) {
//       if (exception.response != null) {
//         final responseData = exception.response?.data;
//         CustomNotification.showSnackbar(message: responseData['message']);
//       } else {
//         CustomDioException.exception(exception.type);
//       }
//     } finally {
//       isLoading(false);
//     }
//   }

//   void continueWithGoogle() async {
//     isLoading(true);
//     final GoogleSignIn googleSignIn = GoogleSignIn(scopes: ['email']);
//     try {
//       final GoogleSignInAccount? googleUser = await googleSignIn.signIn();
//       if (googleUser == null) {
//         CustomNotification.showSnackbar(
//             message: 'We were unable to obtain your account information');
//         return;
//       }

//       FormData data = FormData.fromMap({
//         'name': googleUser.displayName,
//         'email': googleUser.email.toString(),
//         'password': googleUser.id,
//         'profile': googleUser.photoUrl.toString()
//       });

//       final response = await _dio.post(Api.continueWithGoogle, data: data);

//       if (!response.data['status']) return;
//       final isNewUser = response.data['message'];
//       final profile = response.data['data']['profile'];
//       final token = response.data['data']['profile']['token'];
//       _localStorage.saveData(keys: Keys.profile, data: profile);
//       _localStorage.saveData(keys: Keys.token, data: token);

//       saveUserData(User.fromJson(profile));

//       Get.offAllNamed(Routes.home);
//       CustomNotification.showSnackbar(
//           message: isNewUser
//               ? '${'Welcome to the world of '.tr} ${AppConstants.appName}'
//               : '${'Welcome Back,'.tr} ${response.data['data']['profile']['name']}');

//       Get.offAllNamed(Routes.home);
//     } on DioException catch (exception) {
//       if (exception.response != null) {
//         final responseData = exception.response?.data;
//         CustomNotification.showSnackbar(message: responseData['message']);
//       } else {
//         CustomDioException.exception(exception.type);
//       }
//     } finally {
//       isLoading(false);
//     }
//   }

//   void logout() async {
//     try {
//       final response = await _dio.post(Api.logout,
//           options: Options(headers: Authorization().bearer()));
//       if (!response.data['status']) return;

//       _localStorage.remove(keys: Keys.profile);

//       OneSignal.logout();

//       Get.offAndToNamed(Routes.authentication);
//     } on DioException catch (exception) {
//       if (exception.response != null) {
//         final responseData = exception.response?.data;
//         final errorMessage = responseData['message'];
//         CustomNotification.showSnackbar(message: errorMessage);
//       } else {
//         CustomDioException.exception(exception.type);
//       }

//       Get.offAndToNamed(Routes.authentication);
//     }
//   }

//   Future<void> dataPolicy() async {
//     final Uri url = Uri.parse(AppConstants.getPrivacyPolicyUrl);
//     if (!await launchUrl(url, mode: LaunchMode.externalApplication)) {
//       throw Exception('Could not launch $url');
//     }
//   }

//   void saveUserData(User user) {
//     OneSignal.User.addEmail('${user.email}');
//     OneSignal.User.addSms('${user.countryCode}${user.phoneNumber}');
//     OneSignal.User.addTags({'id': user.id, 'permissions': user.permissions});
//   }
// }
