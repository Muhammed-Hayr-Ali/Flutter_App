import 'package:application/packages.dart';

import '../../../../required_files.dart';

class ProfileUser extends StatelessWidget {
  final User user;
  const ProfileUser({super.key, required this.user});
  String mail(String value) {
    return value.substring(0, value.indexOf("@"));
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: Column(
        children: [
          CustomAvatar(size: Get.width * 0.25, imageUrl: user.profile ?? ''),
          const SizedBox(height: 14),
          Text(
            user.name ?? '',
            style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 4),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 4.0),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.grey.shade200),
            child: Text(
              '@${mail(user.email ?? '')}',
              textDirection: TextDirection.ltr,
              style: TextStyle(
                color: AppColors.primaryColor,
                fontSize: 12,
                fontWeight: FontWeight.w400,
              ),
            ),
          ),
          const SizedBox(height: 6),
          Text(
            user.status ?? '',
            textAlign: TextAlign.center,
            style: const TextStyle(fontSize: 12, fontWeight: FontWeight.w300),
          ),
        ],
      ),
    );
  }
}
