import 'package:application/required_files.dart';

class Authorization {

  final LocalStorage _storage = LocalStorage();

  Map<String, dynamic> bearer() {
    final token = _storage.readData(keys: Keys.token);
    return {'Authorization': 'Bearer $token'};
  }
}
