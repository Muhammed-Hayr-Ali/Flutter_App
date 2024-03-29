import 'package:application/packages.dart';

class Validator {
  Validator._();

  static userName(String value) {

  // regex:/^[^0-9!@#$%^&*()_+|~=`{}\[\]:";\'<>?,.\/]*$/'],

    if (value.isEmpty) {
      return 'Enter your full name'.tr;
    } else if (value.length <= 3) {
      return 'The name must be more than 3 letters'.tr;
    }
    return;
  }

  static email(String value) {
    if (value.isEmpty) {
      return 'Please enter your email'.tr;
    } else if (value.length < 6) {
      return 'The email cannot be less than 6'.tr;
    } else if (!RegExp(r"(?=.*[@])(?=.*[.])\w+").hasMatch(value)) {
      return 'must include @ and .'.tr;
    }
    return;
  }

  static pass(String value1) {
    if (value1.isEmpty) {
      return 'Please enter a password'.tr;
    } else if (value1.length < 8) {
      return 'The password cannot be less than 8'.tr;
    } else if (!RegExp(r"(?=.*[a-z])(?=.*[A-Z])(?=.*[0-9])\w+")
        .hasMatch(value1)) {
      return 'must include uppercase and lowercase letters and numbers'.tr;
    }
    return;
  }

  static password(String value1, String value2) {
    if (value1.isEmpty) {
      return 'Please enter a password'.tr;
    } else if (value1.length < 8) {
      return 'The password cannot be less than 8'.tr;
    } else if (!RegExp(r"(?=.*[a-z])(?=.*[A-Z])(?=.*[0-9])\w+")
        .hasMatch(value1)) {
      return 'must include uppercase and lowercase letters and numbers'.tr;
    } else if (value1 != value2) {
      return 'Password and confirmation do not match'.tr;
    }
    return null;
  }

  static phoneNumber(String value) {
    // String pattern = r'^(?:\+)?(^(?:[0]9)?[0-9]{10,15})$';
String pattern = r'^(\+)?[0-9]+$';    RegExp regExp = RegExp(pattern);
    if (value.isEmpty || !regExp.hasMatch(value)) {
      return 'Please enter valid phone number'.tr;
    }
    return null;
  }

  static verificationCode(String value) {
    if (value.isEmpty) {
      return 'Enter your verification Code'.tr;
    }
    return;
  }

  static isEmpty(String value) {
    if (value.isEmpty) {
      return 'Required field'.tr;
    }
    return;
  }
}
