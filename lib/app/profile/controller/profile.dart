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

  User? currentUser;

  String? path;
  final userName = TextEditingController();
  final phoneNumber = TextEditingController();
  final status = TextEditingController();

  void getCurrentUser() async {
    final user = await _localStorage.readData(keys: Keys.profile);
    currentUser = User.fromJson(user);
    if (currentUser == null) return;
    update();
    userName.text = currentUser!.name ?? '';
    status.text = currentUser!.status ?? '';
    phoneNumber.text = currentUser!.phoneNumber ?? '';
  }

  void updateProfile() async {
    isLoading(true);
    final token = await _localStorage.readData(keys: Keys.token);
    final header = {'Authorization': 'Bearer $token'};

    FormData data = FormData.fromMap({
      'name': userName.text,
      'status': status.text,
      'phone_number': phoneNumber.text,
    });

    if (path != null) {
      MultipartFile photo = await MultipartFile.fromFile(path!);
      data.files.add(MapEntry('profile', photo));
    }

    try {
      final response = await _dio.post(Api.updateProfile,
          options: Options(headers: header), data: data);
      if (!response.data['status']) return;

      final profile = response.data['data']['profile'];
      _localStorage.saveData(keys: Keys.profile, data: profile);
      // final message = response.data['message'];
      // CustomNotification.showSnackbar(message: message);
      final newProfile = response.data['data']['profile'];
      currentUser = User.fromJson(newProfile);
      update();
      Get.back();
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
}
