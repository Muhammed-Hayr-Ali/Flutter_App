import 'package:application/packages.dart';

class HomeController extends GetxController {
  //
  // @override
  // void onInit() {
  //   super.onInit();
  //   // _getPosts();
  // }

  // final Dio _dio = Dio();
  // final Options? options = Options(contentType: 'application/json');
  // int index = 1;
  // RxBool isLoading = true.obs;
  // List<Post> post = [];

  // //
  // _getPosts() async {
  //   try {
  //     final response = await _dio
  //         .get('${AppConstants.serverUrl}/post/?page=$index', options: options);

  //     if (response.statusCode == 200) {
  //       final data = (response.data['data'] as List)
  //           .map((e) => Post.fromJson(e))
  //           .toList();
  //       post.addAll(data);
  //     } else {}
  //   } on DioError catch (e) {
  //     final errorMessage = e.response?.data['message'];
  //     throw errorMessage;
  //   } finally {
  //     update();
  //     isLoading(false);
  //   }
  // }
}
