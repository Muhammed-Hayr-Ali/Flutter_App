import '../../packages.dart';
import '../../required_files.dart';

class AppThemes {
  AppThemes._();

  static ThemeData lightTheme = ThemeData(
    useMaterial3: true,
    colorScheme: ColorScheme.fromSeed(
        brightness: Brightness.light,
        seedColor: Colors.grey,
        primary: Colors.black),
    fontFamily: AppConstants.defaultFont,
    textTheme: TextAppTheme.lightTextTheme,
    inputDecorationTheme: InputTheme.lightInputDecorationTheme,
    textButtonTheme: TextButtonThemeData(
      style: ButtonStyle(
        splashFactory: NoSplash.splashFactory,
        overlayColor: MaterialStateProperty.all(Colors.transparent),
      ),
    ),
  ).copyWith(
    scaffoldBackgroundColor: Colors.white,
    appBarTheme: AppBarTheme(
      backgroundColor: Colors.transparent,
      scrolledUnderElevation: 0,
      elevation: 0,
      centerTitle: true,
      titleTextStyle: TextStyle(
          color: AppColors.blackColor,
          fontSize: 20,
          fontWeight: FontWeight.w400),
      systemOverlayStyle: const SystemUiOverlayStyle(
          statusBarColor: Colors.transparent,
          statusBarIconBrightness: Brightness.dark,
          statusBarBrightness: Brightness.light,
          //     systemNavigationBarColor: Colors.white,
          systemNavigationBarIconBrightness: Brightness.light),
    ),
    radioTheme: RadioThemeData(
      fillColor: MaterialStateProperty.all(Colors.green),
    ),
  );

  static ThemeData darkTheme = ThemeData(
    useMaterial3: true,
    colorScheme: ColorScheme.fromSeed(
      brightness: Brightness.dark,
      seedColor: Colors.green,
      primary: Colors.white,
    ),
    fontFamily: AppConstants.defaultFont,
    textTheme: TextAppTheme.darkTextTheme,
    inputDecorationTheme: InputTheme.darkInputDecorationTheme,
    textButtonTheme: TextButtonThemeData(
      style: ButtonStyle(
        splashFactory: NoSplash.splashFactory,
        overlayColor: MaterialStateProperty.all(Colors.transparent),
      ),
    ),
  ).copyWith(
    appBarTheme: const AppBarTheme(
      backgroundColor: Colors.transparent,
      scrolledUnderElevation: 0,
      elevation: 0,
      centerTitle: true,
      titleTextStyle: TextStyle(
          color: Colors.white, fontSize: 30, fontWeight: FontWeight.w200),
      systemOverlayStyle: SystemUiOverlayStyle(
          statusBarColor: Colors.transparent,
          statusBarIconBrightness: Brightness.light,
          statusBarBrightness: Brightness.dark,
          systemNavigationBarColor: Colors.black,
          systemNavigationBarIconBrightness: Brightness.dark),
    ),
    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
        backgroundColor: Colors.red, elevation: 0),
    listTileTheme: const ListTileThemeData(tileColor: Colors.black38),
    radioTheme: RadioThemeData(
      fillColor: MaterialStateProperty.all(Colors.green),
    ),
  );
}
