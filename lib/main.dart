import 'package:application/packages.dart';
import 'package:application/required_files.dart';

main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await GetStorage.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    // GetStorage().write('theme', false);
    return GetMaterialApp(
      title: AppConstants.appName,
      theme: AppThemes.lightTheme,
      darkTheme: AppThemes.darkTheme,
      themeMode: ThemeService().getMode(),
      translations: Translation(),
      locale: Locale(GetStorage().read('language') ?? 'en'),
      fallbackLocale: const Locale('en'),
      initialBinding: AppBindings(),
      debugShowCheckedModeBanner: false,
      initialRoute: Pages.initial,
      getPages: Pages.routes,
    );
  }
}
