import 'package:dio/dio.dart';
import 'package:application/packages.dart';
import 'package:application/required_files.dart';

class ProfileController extends GetxController {
  //
  //

  final Dio _dio = Dio(
    BaseOptions(
        baseUrl: Api.baseUrl,
        connectTimeout: Api.connectTimeout,
        headers: Api.defaultHeaders),
  );

  final _localStorage = LocalStorage();
  final _imageService = ImageService();

  //
  //
  User? currentUser;
  String? path;
  int? uid;

  //
  RxBool loadingSave = false.obs;
  bool isLoading = true;

  //
  @override
  void onInit() {
    getCurrentUser();
    super.onInit();
  }

  void getCurrentUser() {
    var data = _localStorage.readData(keys: Keys.profile);
    currentUser = User.fromJson(data);
    update();
  }

  void uploadingImage() async {
    final imagePath = await _imageService.getImage();
    if (imagePath != null) {
      path = imagePath;
      update();
    }
  }

  Future<bool> save(UserProfile userProfile) async {
    loadingSave(true);
    final token = _localStorage.readData(keys: Keys.token);
    final Options options = Options(headers: {
      'Authorization': 'Bearer $token',
    });

    final data = FormData.fromMap({
      'id': userProfile.id,
      'name': userProfile.name,
      'phone_number': userProfile.phoneNumber,
      'status': userProfile.status,
    });

    if (path != null) {
      MultipartFile photo = await MultipartFile.fromFile(path!);
      data.files.add(MapEntry("photo", photo));
    }

    try {
      final response =
          await _dio.post(Api.updateProfile, data: data, options: options);
      if (response.data['status']) {
        debugPrint('${response.data}');
        _localStorage.saveData(keys: Keys.profile, data: response.data['user']);
        getCurrentUser();
        Get.back();
        return true;
      }
      return false;
    } on DioException catch (e) {
      debugPrint(e.response?.data['message']);
      CustomNotification.showSnackbar(
          message: e.response?.data['message'] ?? e.error);
      return false;
    } finally {
      loadingSave(false);
    }
  }

  void logOut() {
    _localStorage.remove(keys: Keys.token);
    _localStorage.remove(keys: Keys.profile);
    Get.offAllNamed(Routes.authentication);
  }
}
