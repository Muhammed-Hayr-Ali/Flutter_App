import 'package:application/packages.dart';
import 'package:application/required_files.dart';

class ProfileController extends GetxController {
  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    getCurrentUser();
  }

  RxBool isLoading = false.obs;
  RxBool loadingSave = false.obs;

  final LocalStorage _localStorage = LocalStorage();
  final Dio _dio = Dio(
    BaseOptions(
        baseUrl: Api.baseUrl,
        connectTimeout: Api.connectTimeout,
        headers: Api.defaultHeaders),
  );

  User? currentUser;

  final userName = TextEditingController();
  final phoneNumber = TextEditingController();
  final status = TextEditingController();
  String? path;

  void getCurrentUser() async {
    final user = await _localStorage.readData(keys: Keys.profile);
    currentUser = User.fromJson(user);
    if (currentUser == null) return;
    update();
    userName.text = currentUser!.name??'';
    phoneNumber.text = currentUser!.phoneNumber??'';
    status.text = currentUser!.status??'';
  }

  void updateProfile() {}
}
