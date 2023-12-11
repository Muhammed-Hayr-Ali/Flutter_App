import '../../packages.dart';
import '../../required_files.dart';

class CustomDioException {
  CustomDioException._();

  static String connectionTimeout =
      'Unable to connect to the server. Please try again shortly';
  static String connectionError =
      'There is no internet connection, please check your connection';
  static String defaultException =
      'An unknown error has occurred. If the error persists, please contact us';

  static exception(exception) {
    switch (exception) {
      case DioExceptionType.connectionTimeout:
        CustomNotification.showSnackbar(message: connectionTimeout);
        break;
      case DioExceptionType.connectionError:
        CustomNotification.showSnackbar(message: connectionError);
        break;
      case DioExceptionType.badCertificate:
        CustomNotification.showSnackbar(message: connectionError);
        break;
      default:
        break;
    }
  }
}
