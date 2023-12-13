

import 'package:application/packages.dart';
import 'package:application/required_files.dart';

import '../controller/profile.dart';

class ProfileUser extends StatelessWidget {
  const ProfileUser({
    super.key,
  });

  String mail(String value) {
    return value.substring(0, value.indexOf("@"));
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0),
        child: GetBuilder<ProfileController>(
          init: ProfileController(),
          builder: (_) => _.currentUser == null
              ? Shimmer.fromColors(
                  baseColor: Colors.grey.shade300,
                  highlightColor: Colors.grey.shade100,
                  child: Column(
                    children: [
                      Container(
                        height: Get.width * 0.25,
                        width: Get.width * 0.25,
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius:
                                BorderRadius.circular(Get.width * 0.25)),
                      ),
                      const SizedBox(height: 14),
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
                      const SizedBox(height: 6),
                      Container(
                        height: 15,
                        width: 190,
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(4.0)),
                      ),
                    ],
                  ),
                )
              : Row(
                  children: [
                    CustomAvatar(
                        size: Get.width * 0.14,
                        imageUrl: _.currentUser!.profile ?? ''),
                    const SizedBox(width: 10),
                    Flexible(
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
                    )
                  ],
                ),
        ));
  }
}
