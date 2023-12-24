import 'package:application/packages.dart';
import 'package:application/required_files.dart';
import 'package:application/app/adresses/models/address.dart';
import 'package:dio/dio.dart';

class AddressesController extends GetxController {
  RxBool isLoading = false.obs;
  RxString addAdressError = ''.obs;
  int? selectedIndex;

  selecteditem(value) {
    selectedIndex = value;
    update();
  }

  final Dio _dio = Dio(
    BaseOptions(
        baseUrl: Api.baseUrl,
        connectTimeout: Api.connectTimeout,
        headers: Api.defaultHeaders),
  );

  List<UserAddress> listAddresses = [];
  int? defaultAddress;

  @override
  void onInit() {
    super.onInit();
    getUserAddresses();
  }

  Future<void> getUserAddresses() async {
    isLoading(true);
    listAddresses = [];
    try {
      final response = await _dio.get(Api.getUserAddresses,
          options: Options(headers: Authorization().bearer()));

      if (!response.data['status'] || response.data['data']['adresses'] == []) {
        return;
      }
      final data = response.data['data']['adresses'];
      final defaultId = response.data['data']['default_address'];
      List<UserAddress> list = [];
      data.forEach((element) {
        list.add(UserAddress.fromJson(element));
      });
      defaultAddress = defaultId;
      listAddresses = list;
      // if (defaultId == null) {
      //   update();
      //   return;
      // }
      // var specificItem =
      //     listAddresses.firstWhere((item) => item.id == defaultId);
      // listAddresses.remove(specificItem);
      // listAddresses.insert(0, specificItem);

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

  Future<bool> createNewAddress(
      {required Map<String, dynamic> newAddress}) async {
    isLoading(true);
    FormData data = FormData.fromMap(newAddress);

    try {
      final response = await _dio.post(Api.createNewAddress,
          options: Options(headers: Authorization().bearer()), data: data);
      if (!response.data['status']) return false;
      await getUserAddresses();
      CustomNotification.showSnackbar(message: '${response.data['message']}');
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

  Future<bool> updateAddress({required Map<String, dynamic> newAddress}) async {
    isLoading(true);
    FormData data = FormData.fromMap(newAddress);

    try {
      final response = await _dio.post(Api.updateAddress,
          options: Options(headers: Authorization().bearer()), data: data);

      if (!response.data['status']) return false;
      await getUserAddresses();
      CustomNotification.showSnackbar(message: '${response.data['message']}');
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

  void searchResults(String query) {
    if (query.isEmpty) {
      getUserAddresses();
    } else {
      var lowercaseQuery =
          query.toLowerCase(); // تحويل الاستعلام إلى حروف صغيرة

      listAddresses = listAddresses
          .where((element) =>
              element.recipientName!.toLowerCase().contains(lowercaseQuery) ||
              element.country!.toLowerCase().contains(lowercaseQuery) ||
              element.state!.toLowerCase().contains(lowercaseQuery) ||
              element.addressLine1!.toLowerCase().contains(lowercaseQuery) ||
              element.addressLine2!.toLowerCase().contains(lowercaseQuery) ||
              element.phoneNumber!.toLowerCase().contains(lowercaseQuery) ||
              element.city!.toLowerCase().contains(lowercaseQuery))
          .toList();
      update();
    }
  }

  Future<bool> setDefaultAddress(int id) async {
    isLoading(true);
    FormData data = FormData.fromMap({'id': id});

    try {
      final response = await _dio.post(Api.setDefaultAddress,
          options: Options(headers: Authorization().bearer()), data: data);

      if (!response.data['status']) return false;
      await getUserAddresses();
      CustomNotification.showSnackbar(message: '${response.data['message']}');
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

  Future<bool> deleteAddress(int id) async {
    isLoading(true);
    FormData data = FormData.fromMap({'id': id});

    try {
      final response = await _dio.post(Api.deleteAddress,
          options: Options(headers: Authorization().bearer()), data: data);

      if (!response.data['status']) return false;
      await getUserAddresses();
      CustomNotification.showSnackbar(message: '${response.data['message']}');
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
