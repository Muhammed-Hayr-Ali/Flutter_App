import 'package:application/packages.dart';
import 'package:application/required_files.dart';

import '../component/loading_profile.dart';
import '../component/user_profile.dart';

class ProfileScreen extends StatelessWidget {
  ProfileScreen({super.key});
  final List<Widget> menu = [
    CustomListTile(
      title: 'Edit Profile',
      icon: PhosphorIcons.note_pencil_bold,
      onTap: () => Get.toNamed(Routes.editProfile),
    ),
    const CustomListTile(
      title: 'Language',
      icon: PhosphorIcons.globe_hemisphere_west_bold,
    ),
    const CustomListTile(
      title: 'Theme',
      icon: PhosphorIcons.moon_bold,
    ),
    const CustomListTile(
      title: 'Sign Out',
      icon: PhosphorIcons.power_bold,
      color: Colors.red,
    ),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.primaryColor,
        title: Text(
          'Account'.tr,
          style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
        centerTitle: false,
      ),
      body: Stack(
        children: [
          Container(
            width: double.infinity,
            color: AppColors.primaryColor,
            child: const Column(
              children: [
                ProfileUser(),
                SizedBox(height: 20),
                SizedBox(height: 20),
              ],
            ),
          ),
          Column(
            children: [
              const SizedBox(height: 256),
              Container(
                height: double.infinity,
                decoration: const BoxDecoration(
                    borderRadius: BorderRadius.vertical(
                      top: Radius.circular(9.0),
                    ),
                    color: Colors.white), // child: Column(
              ),
            ],
          ),
        ],
      ),
    );
  }
}
