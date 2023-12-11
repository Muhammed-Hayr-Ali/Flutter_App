import 'package:application/packages.dart';
import 'package:application/required_files.dart';

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
      name: Routes.ressetPass,
      page: () => RessetPass(),
      transitionDuration: duration,
      transition: transition,
      curve: curve,
      //binding: HomeBinding(),
    ),
    GetPage(
      name: Routes.setPassword,
      page: () => SetPassword(),
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
      page: () =>  EditProfile(),
      transitionDuration: duration,
      transition: transition,
      curve: curve,
    ),
  ];
}
