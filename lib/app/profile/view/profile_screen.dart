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
          style:
              const TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        centerTitle: false,
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const UserProfile(),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text('Account Settings'.tr,
                  style: const TextStyle(
                      fontSize: 18, fontWeight: FontWeight.w400)),
            ),
            ListTile(
              leading: Icon(
                Icons.location_on_rounded,
                color: AppColors.primaryColor,
              ),
              title: const Text(
                'My Addresses',
              ),
              subtitle: const Text('set shopping delivery address',
                  style: TextStyle(color: Colors.grey)),
            ),
            ListTile(
              leading: Icon(
                Icons.location_on_rounded,
                color: AppColors.primaryColor,
              ),
              title: const Text(
                'My Addresses',
              ),
              subtitle: const Text('set shopping delivery address',
                  style: TextStyle(color: Colors.grey)),
            ),
            ListTile(
              leading: Icon(
                Icons.location_on_rounded,
                color: AppColors.primaryColor,
              ),
              title: const Text(
                'My Addresses',
              ),
              subtitle: const Text('set shopping delivery address',
                  style: TextStyle(color: Colors.grey)),
            ),
            ListTile(
              leading: Icon(
                Icons.location_on_rounded,
                color: AppColors.primaryColor,
              ),
              title: const Text(
                'My Addresses',
              ),
              subtitle: const Text('set shopping delivery address',
                  style: TextStyle(color: Colors.grey)),
            ),
            ListTile(
              leading: Icon(
                Icons.location_on_rounded,
                color: AppColors.primaryColor,
              ),
              title: const Text(
                'My Addresses',
              ),
              subtitle: const Text('set shopping delivery address',
                  style: TextStyle(color: Colors.grey)),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text('App Settings'.tr,
                  style: const TextStyle(
                      fontSize: 18, fontWeight: FontWeight.w400)),
            ),
            ListTile(
              leading: Icon(
                Icons.location_on_rounded,
                color: AppColors.primaryColor,
              ),
              title: const Text(
                'My Addresses',
              ),
              subtitle: const Text('set shopping delivery address',
                  style: TextStyle(color: Colors.grey)),
            ),
            ListTile(
              leading: Icon(
                Icons.location_on_rounded,
                color: AppColors.primaryColor,
              ),
              title: const Text(
                'My Addresses',
              ),
              subtitle: const Text('set shopping delivery address',
                  style: TextStyle(color: Colors.grey)),
            ),
            ListTile(
              leading: Icon(
                Icons.location_on_rounded,
                color: AppColors.primaryColor,
              ),
              title: const Text(
                'My Addresses',
              ),
              subtitle: const Text('set shopping delivery address',
                  style: TextStyle(color: Colors.grey)),
            ),
            ListTile(
              leading: Icon(
                Icons.location_on_rounded,
                color: AppColors.primaryColor,
              ),
              title: const Text(
                'My Addresses',
              ),
              subtitle: const Text('set shopping delivery address',
                  style: TextStyle(color: Colors.grey)),
            ),
            ListTile(
              leading: Icon(
                Icons.location_on_rounded,
                color: AppColors.primaryColor,
              ),
              title: const Text(
                'My Addresses',
              ),
              subtitle: const Text('set shopping delivery address',
                  style: TextStyle(color: Colors.grey)),
            ),
          ],
        ),
      ),
    );
  }
}
