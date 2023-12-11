import 'package:application/packages.dart';
import 'package:application/required_files.dart';

class ThemeService {
  LocalStorage localStorage = LocalStorage();


  getMode() {
    return GetStorage().read('theme') == null
        ? ThemeMode.system
        : ThemeService().getTheme();
  }




  bool isDarkMode() {
    return localStorage.readData(keys: Keys.theme) ?? false;
  }

  getTheme() {
    return isDarkMode() ? ThemeMode.dark : ThemeMode.light;
  }
}
