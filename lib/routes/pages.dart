import '../app/adresses/views/add_new_address.dart';
import '../app/adresses/views/update_address.dart';
import '../app/adresses/views/location_screen.dart';
import '../app/adresses/views/my_addresses.dart';
import '../app/authentication/account/controller/account_controller.dart';
import '../app/authentication/account/view/create_new_password.dart';
import '../app/authentication/account/view/forgot_password.dart';
import '../app/authentication/account/view/verify_verification_code.dart';
import '../app/authentication/auth/completet_your_profile.dart';
import '../app/authentication/auth/controller/auth_controller.dart';
import '../app/authentication/auth/creat_new_account.dart';
import '../app/authentication/auth/login_user.dart';
import '../app/authentication/authentication.dart';
import '../app/bottomNavigationBar/view/bottom_navigation_bar.dart';

import '../app/profile/controller/profile_controller.dart';
import '../app/profile/view/edit_profile.dart';
import '../app/splash_screen/controller/splashscreen_controller.dart';
import '../packages.dart';
import '../required_files.dart';

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
        // transitionDuration: const Duration(milliseconds: 1500),
        // transition: Transition.fade,
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
        binding: BindingsBuilder(() {
          Get.put<AccountController>(AccountController());
        })),
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
        // transitionDuration: const Duration(milliseconds: 1500),
        // transition: Transition.fade,
        // curve: curve,
        binding: BindingsBuilder(() {
          Get.put<ProfileController>(ProfileController());
        })),
    GetPage(
      name: Routes.editProfile,
      page: () => const EditProfile(),
      transitionDuration: duration,
      transition: transition,
      curve: curve,
    ),
    GetPage(
      name: Routes.myAddresses,
      page: () => const MyAddresses(),
      transitionDuration: duration,
      transition: transition,
      curve: curve,
    ),
    GetPage(
      name: Routes.addNewAddress,
      page: () => const AddNewAddress(),
      transitionDuration: duration,
      transition: transition,
      curve: curve,
    ),
    GetPage(
      name: Routes.editAddress,
      page: () => const UpdateAddress(),
      transitionDuration: duration,
      transition: transition,
      curve: curve,
    ),
    GetPage(
      name: Routes.locationScreen,
      page: () => const LocationScreen(),
      transitionDuration: duration,
      transition: transition,
      curve: curve,
    ),
  ];
}
