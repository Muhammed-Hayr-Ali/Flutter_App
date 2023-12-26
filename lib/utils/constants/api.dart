class Api {
  Api._();

  static const String baseUrl = 'http://192.168.55.252:8000';
  //
  static const Duration connectTimeout = Duration(seconds: 5);
  static const Map<String, dynamic> defaultHeaders = {
    'contentType': 'application/json',
    'Accept': 'application/json'
  };

  //Auth
  static const String register = '/api/auth/register';
  static const String checkMailAvailability = '/api/auth/checkMailAvailability';
  static const String sendVerificationCode = '/api/auth/sendVerificationCode';
  static const String completeRegistration = '/api/auth/completeRegistration';

  static const String login = '/api/auth/login';
  static const String continueWithGoogle = '/api/auth/continueWithGoogle';

  //forgotPassword
  static const String forgotPassword = '/api/forgotPassword/sendVerificationCode';
  static const String verifyPhoneNumber =
      '/api/forgotPassword/verifyPhoneNumber';
  static const String createNewPassword = '/api/forgotPassword/createNewPassword';

  //Profile
  static const String currentUser = '/api/profile/getCurrentUser';
  static const String updateProfile = '/api/profile/updateProfile';
  static const String logout = '/api/profile/logout';

  static const String updatePassword = '/api/auth/updatePassword';

  static const String getUserAddresses = '/api/addresses/getUserAddresses';
  static const String createNewAddress = '/api/addresses/createNewAddress';
  static const String updateAddress = '/api/addresses/updateAddress';
  static const String setDefaultAddress = '/api/addresses/setDefaultAddress';
  static const String deleteAddress = '/api/addresses/deleteAddress';
}
