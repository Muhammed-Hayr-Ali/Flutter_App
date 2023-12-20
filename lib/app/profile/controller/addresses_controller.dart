import 'package:application/packages.dart';
import 'package:application/required_files.dart';
import 'package:application/utils/models/address.dart';
import 'package:dio/dio.dart';

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

  Future<void> getAllAddresses() async {
    isLoading(true);

    final token = await _localStorage.readData(keys: Keys.token);
    final header = {'Authorization': 'Bearer $token'};

    try {
      final response = await _dio.get(Api.getAllAddresses,
          options: Options(headers: header));

      if (!response.data['status']) return;
      final data = response.data['data'];
      List<AddressModel> list = [];
      data.forEach((element) {
        list.add(AddressModel.fromJson(element));
      });
      listAddresses = list;
      update();
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

  Future<bool> addNewAddresse(
      {required Map<String, dynamic> newAddress}) async {
    isLoading(true);
    FormData data = FormData.fromMap(newAddress);
    final token = await _localStorage.readData(keys: Keys.token);
    final header = {'Authorization': 'Bearer $token'};

    try {
      final response = await _dio.post(Api.createAddress,
          options: Options(headers: header), data: data);

      if (!response.data['status']) return false;
      CustomNotification.showSnackbar(message: '${response.data['message']}');
      getAllAddresses();
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
