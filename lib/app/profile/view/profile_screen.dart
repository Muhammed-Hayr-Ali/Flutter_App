import 'package:application/packages.dart';
import 'package:application/required_files.dart';
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
            style: const TextStyle(color: Colors.white),
          ),
          centerTitle: false,
          
        ),
        body: const Column(
          children: [UserProfile()],
        ));
  }
}
