import 'package:application/packages.dart';
import 'package:application/required_files.dart';
import '../component/user_profile.dart';
import '../controller/profile_controller.dart';

class ProfileScreen extends StatelessWidget {
  ProfileScreen({super.key});
  final ProfileController _ = Get.put(ProfileController());


  String _shortMail(String value) {
    return value.substring(0, value.indexOf("@"));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: null,
        centerTitle: true,
        backgroundColor: AppColors.primaryColor,
        title: GetBuilder<ProfileController>(
          init: ProfileController(),
          builder: (_) => Text(
            '@${_shortMail(_.currentUser!.email ?? '')}',
            style: const TextStyle(
              fontSize: 14,
              color: Colors.white,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
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
                      fontSize: 18, fontWeight: FontWeight.w600)),
            ),
            CustomListTile(
              title: 'Edit my profile',
              subtitle: 'Edit profile information and personal photo',
              leading: AppAssets.editProfile,
              onTap: () =>
                  Get.toNamed(Routes.editProfile, arguments: _.currentUser),
            ),
            CustomListTile(
              title: 'My addresses',
              subtitle: 'Set shipment delivery addresses',
              leading: AppAssets.mapPoint,
              onTap: () => Get.toNamed(Routes.editProfile),
            ),
            CustomListTile(
              title: 'Wish List',
              subtitle:
                  'A list of favorite products that you would like to obtain',
              leading: AppAssets.heart,
              onTap: () => Get.toNamed(Routes.editProfile),
            ),
            CustomListTile(
              title: 'My Orders',
              subtitle: 'In-process orders and completed orders',
              leading: AppAssets.cartCheck,
              onTap: () => Get.toNamed(Routes.editProfile),
            ),
            const SizedBox(height: 14.0),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text('App Settings'.tr,
                  style: const TextStyle(
                      fontSize: 18, fontWeight: FontWeight.w600)),
            ),
            CustomListTile(
              title: 'Language',
              subtitle: 'Choose the application language',
              leading: AppAssets.globus,
              onTap: () => Get.toNamed(Routes.editProfile),
            ),
            CustomListTile(
              title: 'Theme',
              subtitle: 'Choose the application Theme',
              leading: AppAssets.pallete,
              onTap: () => Get.toNamed(Routes.editProfile),
            ),
            CustomListTile(
              title: 'Notifications',
              subtitle: 'Choose the notifications you want to receive',
              leading: AppAssets.bell,
              onTap: () => Get.toNamed(Routes.editProfile),
            ),
            CustomListTile(
              title: 'FaQ',
              subtitle: 'Get quick answers about the service provided',
              leading: AppAssets.question,
              onTap: () => Get.toNamed(Routes.editProfile),
            ),
            CustomListTile(
              title: 'communication',
              subtitle: 'Help us improve the service by sending feedback',
              leading: AppAssets.message,
              onTap: () => Get.toNamed(Routes.editProfile),
            ),
            const SizedBox(height: 38.0),
            Center(
              child: CustomElevatedButton(
                width: Get.width * 0.7,
                height: 48,
                borderRadius: BorderRadius.circular(38.0),
                backgroundColor: AppColors.primaryColor,
                child: Text(
                  'Logout'.tr,
                  style: const TextStyle(color: Colors.white),
                ),
                onPressed: () => debugPrint(''),
              ),
            ),
            const SizedBox(height: 80.0),
          ],
        ),
      ),
    );
  }
}
