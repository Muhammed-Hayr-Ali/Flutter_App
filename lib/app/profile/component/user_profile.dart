import 'package:application/packages.dart';
import 'package:application/required_files.dart';

import '../controller/profile_controller.dart';

class UserProfile extends StatelessWidget {
  const UserProfile({
    super.key,
  });

  String mail(String value) {
    return value.substring(0, value.indexOf("@"));
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
            color: AppColors.primaryColor,
            padding: const EdgeInsets.fromLTRB(8.0, 0, 8.0, 16.0),
            child: GetBuilder<ProfileController>(
              init: ProfileController(),
              builder: (_) => _.currentUser == null
                  ? Shimmer.fromColors(
                      baseColor: Colors.white,
                      highlightColor: Colors.grey.shade300,
                      child: Row(
                        children: [
                          Container(
                            height: Get.width * 0.14,
                            width: Get.width * 0.14,
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(
                                  Get.width * 0.14,
                                )),
                          ),
                          const SizedBox(width: 10),
                          Flexible(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                const SizedBox(),
                                Container(
                                  height: 26,
                                  width: 100,
                                  decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(4.0)),
                                ),
                                const SizedBox(height: 4),
                                Container(
                                  height: 15,
                                  width: 222,
                                  decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(4.0)),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    )
                  : Row(
                      children: [
                        CustomAvatar(
                            size: Get.width * 0.14,
                            imageUrl: '${_.currentUser!.profile}'),
                        const SizedBox(width: 10),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const SizedBox(),
                              Text(
                                _.currentUser!.name ?? '',
                                style: const TextStyle(
                                    fontSize: 20,
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold),
                              ),
                              Text(
                                '${_.currentUser!.email}',
                                textDirection: TextDirection.ltr,
                                style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 12,
                                ),
                              ),
                              // const SizedBox(height: 18),
                              // Text(
                              //   _.currentUser!.status ?? '',
                              //   textAlign: TextAlign.center,
                              //   style: const TextStyle(
                              //       fontSize: 12, fontWeight: FontWeight.w300),
                              // ),
                            ],
                          ),
                        ),
                        IconButton(
                          onPressed: () {},
                          icon: SvgPicture.asset('assets/svg/edit.svg'),
                        )
                      ],
                    ),
            )),
        Stack(
          children: [
            Container(
              height: 20,
              width: double.infinity,
              decoration: BoxDecoration(
                gradient: LinearGradient(colors: [
                  AppColors.primaryColor,
                  AppColors.primaryColor.withOpacity(0.0)
                ], stops: const [
                  0.0,
                  1.0
                ], begin: Alignment.topCenter, end: Alignment.bottomCenter),
              ),
            ),
            Container(
              height: 20,
              width: double.infinity,
              decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius:
                      BorderRadius.vertical(top: Radius.circular(8.0))),
            ),
          ],
        )
      ],
    );
  }
}
