import 'package:application/app/authentication/account/controller/account_controller.dart';
import 'package:application/app/authentication/auth/completet_your_profile.dart';
import 'package:application/app/profile/controller/profile_controller.dart';
import 'package:application/packages.dart';
import 'package:application/required_files.dart';

import '../app/authentication/account/view/create_new_password.dart';
import '../app/authentication/account/view/forgot_password.dart';
import '../app/authentication/account/view/verify_verification_code.dart';
import '../app/authentication/auth/controller/auth_controller.dart';
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
    ),
    GetPage(
        name: Routes.authentication,
        page: () => Authentication(),
        // transitionDuration: duration,
        // transition: transition,
        // curve: curve,
        binding: BindingsBuilder(() {
          Get.put(AuthControlleer());
        })),
    GetPage(
      name: Routes.creatNewAccount,
      page: () => CreatNewAccount(),
      transitionDuration: duration,
      transition: transition,
      curve: curve,
    ),
    GetPage(
      name: Routes.completetYourProfile,
      page: () => CompletetYourProfile(),
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
        binding: BindingsBuilder(() {
          Get.lazyPut(() => ProfileController());
        })),
    GetPage(
      name: Routes.editProfile,
      page: () => EditProfile(),
      transitionDuration: duration,
      transition: transition,
      curve: curve,
    ),
  ];
}
