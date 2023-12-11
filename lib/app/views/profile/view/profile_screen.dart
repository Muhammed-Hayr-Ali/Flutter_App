import 'package:application/components/custom_list_tile.dart';
import 'package:application/packages.dart';

import '../../../model/user_profile.dart';
import '../component/loading_profile.dart';
import '../component/user_profile.dart';
import '../controller/profile.dart';

class ProfileScreen extends StatelessWidget {
  ProfileScreen({super.key});
  final _ = Get.put(ProfileController());
  final List<Widget> menu = [
    const CustomListTile(
      title: 'Edit Profile',
      icon: PhosphorIcons.note_pencil_bold,
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
              SizedBox(
                  child: _.currentUser != null
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
