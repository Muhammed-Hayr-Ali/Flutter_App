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
        title: Text(
          'Profile'.tr,
          style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
        ),
      ),
      body: SingleChildScrollView(
        physics: const ScrollPhysics(),
        child: Center(
          child: Column(
            children: [
              GetBuilder<ProfileController>(
                  init: ProfileController(),
                  builder: (_) => _.currentUser != null
                      ? ProfileUser(
                          user: _.currentUser!,
                        )
                      : const LadingProfile()),
              Container(
                height: 30,
                padding:
                    const EdgeInsets.symmetric(horizontal: 8.0, vertical: 4.0),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.grey.shade200),
              ),
              ListView.builder(
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemCount: menu.length,
                itemBuilder: (context, index) {
                  return menu[index];
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
