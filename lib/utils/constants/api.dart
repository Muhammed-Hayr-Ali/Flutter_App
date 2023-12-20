class Api {
  Api._();

  static const String baseUrl = 'http://192.168.55.248:8000';
  //
  static const Duration connectTimeout = Duration(seconds: 5);
  static const Map<String, dynamic> defaultHeaders = {
    'contentType': 'application/json',
    'Accept': 'application/json'
  };

  //Auth
  static const String register = '/api/auth/register';
  static const String checkMailAvailability = '/api/auth/checkMailAvailability';
  static const String login = '/api/auth/login';
  static const String continueWithGoogle = '/api/auth/continueWithGoogle';
  static const String logout = '/api/auth/logout';

  //Account
  static const String forgotPassword = '/api/account/forgotPassword';
  static const String verifyVerificationCode =
      '/api/account/verifyVerificationCode';
  static const String createNewPassword = '/api/account/createNewPassword';

  //Profile
  static const String currentUser = '/api/profile/getCurrentUser';
  static const String updateProfile = '/api/profile/updateProfile';

  static const String updatePassword = '/api/auth/updatePassword';




  static const String getAllAddresses = '/api/addresses/getAllAddresses';
  static const String createAddress = '/api/addresses/createAddress';


}
