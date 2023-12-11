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
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CustomAvatar(
                  size: Get.width * 0.22, imageUrl: user.profile ?? ''),
              Container(
                padding: const EdgeInsets.all(4),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  border: Border.all(color: AppColors.athensGray),
                ),
                child: const Icon(
                  PhosphorIcons.bell,
                  size: 18.0,
                ),
              )
            ],
          ),
          const SizedBox(height: 14),
          Text(
            user.name ?? '',
            style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 2),
          Text(
            user.status ?? '',
            textAlign: TextAlign.center,
            style: const TextStyle(fontSize: 12, fontWeight: FontWeight.w300),
          ),
          const SizedBox(height: 6),
          Text(
            '@${mail(user.email ?? '')}',
            textDirection: TextDirection.ltr,
            style: const TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w400,
            ),
          ),
        ],
      ),
    );
  }
}
