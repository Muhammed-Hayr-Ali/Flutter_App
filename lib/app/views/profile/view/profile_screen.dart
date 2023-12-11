import 'package:application/packages.dart';

import '../component/loading_profile.dart';
import '../controller/profile.dart';

class ProfileScreen extends StatelessWidget {
  ProfileScreen({super.key});
  final _ = Get.put(ProfileController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Profile'.tr,
          style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
        ),
      ),
      body: const SingleChildScrollView(
        child: Column(
          children: [LadingProfile()],
        ),
      ),
    );
  }
}
