import 'package:application/packages.dart';

enum Keys { language, theme, currentUser, token, profile ,primaryColor}

class LocalStorage {
  final storage = GetStorage();

  String key(Keys keys) {
    switch (keys) {
      case Keys.language:
        return 'language';
      case Keys.theme:
        return 'theme';
      case Keys.currentUser:
        return 'currentUser';
      case Keys.token:
        return 'token';
      case Keys.profile:
        return 'profile';
      case Keys.primaryColor:
        return 'primaryColor';
    }
  }

  saveData({required Keys keys, required dynamic data})  {
     storage.write(key(keys), data);
  }

  readData({required Keys keys})  {
    return  storage.read(key(keys));
  }

  remove({required Keys keys})  {
    return  storage.remove(key(keys));
  }
}
