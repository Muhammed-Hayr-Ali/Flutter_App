import 'package:application/packages.dart';
import 'package:application/required_files.dart';

class ProfileScreen extends StatelessWidget {
  ProfileScreen({super.key});
  final LocalStorage localStorage = LocalStorage();

  void editProfile() {
    Get.toNamed(Routes.editProfile);
  }

  void appLang() {
    custombottomSheet(child: const SelectLang());
  }

  void appMode() {
    custombottomSheet(child: const SelectMode());
  }

  void signOut(context) {
    custombottomSheet(
        title: 'Are you sure you want to log out?',
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            CustomListItem(
              onTap: () {
                localStorage.remove(keys: Keys.token);
                localStorage.remove(keys: Keys.profile);
                Get.offAllNamed(Routes.authentication);
              },
              child: Center(
                  child: Text('Yes'.tr,
                      style: Theme.of(context).textTheme.titleMedium)),
            ),
            const Divider(),
            CustomListItem(
              onTap: () => Get.back(),
              child: Center(
                  child: Text('No'.tr,
                      style: Theme.of(context).textTheme.titleMedium)),
            )
          ],
        ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Profile'.tr,
          style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const ProfileWidget(
              margin: EdgeInsets.symmetric(horizontal: 10),
            ),
            const SizedBox(height: 10),
            CustomListTile(
              title: 'Edit Profile',
              leading: const Icon(
                PhosphorIcons.note_pencil_bold,
                size: 22,
              ),
              onTap: editProfile,
            ),
            CustomListTile(
              title: 'Language',
              leading: const Icon(
                PhosphorIcons.globe_hemisphere_west_bold,
                size: 22,
              ),
              onTap: appLang,
            ),
            CustomListTile(
              title: 'Theme',
              leading: const Icon(
                PhosphorIcons.moon_bold,
                size: 22,
              ),
              onTap: appMode,
            ),
            CustomListTile(
              title: 'Sign Out',
              leading: const Icon(
                PhosphorIcons.power_bold,
                color: Colors.red,
                size: 22,
              ),
              onTap: () => signOut(context),
            ),
          ],
        ),
      ),
    );
  }
}
