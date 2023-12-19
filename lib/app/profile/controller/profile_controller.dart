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

  void getCurrentUser() async {
    final user = await _localStorage.readData(keys: Keys.profile);
    currentUser = User.fromJson(user);
    if (currentUser == null) return;
    update();
  }

  void updateProfile({required Map<String, dynamic> newUser}) async {
    isLoading(true);

    final token = await _localStorage.readData(keys: Keys.token);
    final header = {'Authorization': 'Bearer $token'};

    FormData data = FormData.fromMap({
      'name': newUser['name'],
      'status': newUser['status'],
      'country_code': newUser['countryCode'],
      'phone_number': newUser['phoneNumber'],
      'gender': newUser['gender'],
      'date_birth': newUser['dateBirth'],
    });

    if (newUser['path'] != null) {
      MultipartFile photo = await MultipartFile.fromFile(newUser['path']);
      data.files.add(MapEntry('profile', photo));
    }

    try {
      final response = await _dio.post(Api.updateProfile,
          options: Options(headers: header), data: data);
      if (!response.data['status']) return;

      final profile = response.data['data']['profile'];
      _localStorage.saveData(keys: Keys.profile, data: profile);
      final message = response.data['message'];
      CustomNotification.showSnackbar(message: message);
      final newProfile = response.data['data']['profile'];
      currentUser = User.fromJson(newProfile);
      update();
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
