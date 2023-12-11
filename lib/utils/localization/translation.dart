import 'package:application/packages.dart';
import 'package:application/required_files.dart';

class Translation extends Translations {
  @override
  Map<String, Map<String, String>> get keys => {
        'ar': arabic,
        'en': english,
      };
}
