import 'package:application/packages.dart';
import 'package:application/required_files.dart';
import 'package:application/utils/models/address.dart';

class AddressesController extends GetxController {
  final LocalStorage _localStorage = LocalStorage();

  final Dio _dio = Dio(
    BaseOptions(
        baseUrl: Api.baseUrl,
        connectTimeout: Api.connectTimeout,
        headers: Api.defaultHeaders),
  );

  RxBool isLoading = false.obs;
  RxString addAdressError = ''.obs;

  List<AddressModel> listAddresses = [];

  @override
  void onInit() {
    super.onInit();
    getAllAddresses();
  }

  void getAllAddresses() async {
    isLoading(true);

    final token = await _localStorage.readData(keys: Keys.token);
    final header = {'Authorization': 'Bearer $token'};

    try {
      final response = await _dio.get(Api.getAllAddresses,
          options: Options(headers: header));

      if (!response.data['status']) return;
      final data = response.data['data'];
      print(data.runtimeType);
      data.forEach((element) {
        listAddresses.add(AddressModel.fromJson(element));
      });

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

  void addNewAddresse({required AddressModel addressModel}) {}
}
