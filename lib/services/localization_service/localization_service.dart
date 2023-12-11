import 'package:application/packages.dart';
import 'package:application/required_files.dart';

class Localization {
  static Localization instanse = Localization();
  final LocalStorage localStorage = LocalStorage();
  updateLocal(String language) async {
    await Get.updateLocale(Locale(language));
    await localStorage.saveData(keys: Keys.language, data: language);
  }
}
