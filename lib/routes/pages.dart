import 'package:application/packages.dart';
import 'package:application/required_files.dart';

import '../app/authentication/account/view/create_new_password.dart';
import '../app/authentication/account/view/forgot_password.dart';
import '../app/authentication/account/view/verify_verification_code.dart';
import '../app/authentication/auth/creat_new_account.dart';
import '../app/authentication/auth/login_user.dart';
import '../app/authentication/authentication.dart';
import '../app/bottomNavigationBar/view/bottom_navigation_bar.dart';

import '../app/profile/view/edit_profile.dart';
import '../app/splash_screen/controller/splashscreen_controller.dart';

/// Pages
class Pages {
  static const initial = Routes.splashScreen;

  static Transition transition = Transition.cupertino;
  static Duration duration = const Duration(milliseconds: 600);
  static Curve curve = Curves.linear;

  static final routes = [
    GetPage(
        name: Routes.splashScreen,
        page: () => const SplashScreen(),
        // transitionDuration: duration,
        // transition: transition,
        // curve: curve,
        binding: BindingsBuilder(() {
          Get.put<SplashScreenController>(SplashScreenController());
        })),
    GetPage(
      name: Routes.authentication,
      page: () => Authentication(),
      // transitionDuration: duration,
      // transition: transition,
      // curve: curve,
    ),
    GetPage(
      name: Routes.creatNewAccount,
      page: () => CreatNewAccount(),
      transitionDuration: duration,
      transition: transition,
      curve: curve,
    ),
    GetPage(
      name: Routes.loginUser,
      page: () => Login(),
      transitionDuration: duration,
      transition: transition,
      curve: curve,
    ),
    GetPage(
      name: Routes.forgotPassword,
      page: () => ForgotPassword(),
      transitionDuration: duration,
      transition: transition,
      curve: curve,
      //binding: HomeBinding(),
    ),
    GetPage(
      name: Routes.verifyVerificationCode,
      page: () => VerifyVerificationCode(),
      transitionDuration: duration,
      transition: transition,
      curve: curve,
      //binding: HomeBinding(),
    ),
    GetPage(
      name: Routes.createNewPassword,
      page: () => CreateNewPassword(),
      transitionDuration: duration,
      transition: transition,
      curve: curve,
    ),
    GetPage(
      name: Routes.home,
      page: () => const NavBar(),
      // transitionDuration: duration,
      // transition: transition,
      // curve: curve,
    ),
    GetPage(
      name: Routes.editProfile,
      page: () => EditProfile(),
      transitionDuration: duration,
      transition: transition,
      curve: curve,
    ),
  ];
}
