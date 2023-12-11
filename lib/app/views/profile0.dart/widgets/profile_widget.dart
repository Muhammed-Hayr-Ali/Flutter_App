import 'package:application/packages.dart';
import 'package:application/required_files.dart';

class ProfileWidget extends StatelessWidget {
  final EdgeInsetsGeometry? margin;
  const ProfileWidget({super.key, this.margin});

  String mail(String value) {
    return value.substring(0, value.indexOf("@"));
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: margin ?? const EdgeInsets.all(8.0),
      child: GetBuilder<ProfileController>(
        init: ProfileController(),
        builder: (_) => _.currentUser != null
            ? Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CustomAvatar(
                          size: Get.width * 0.22,
                          imageUrl: _.currentUser!.profile!),
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
                    _.currentUser!.name ?? '',
                    style: const TextStyle(
                        fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 2),
                  Text(
                    _.currentUser!.status ?? '',
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                        fontSize: 12, fontWeight: FontWeight.w300),
                  ),
                  const SizedBox(height: 6),
                  Text(
                    '@${mail(_.currentUser!.email ?? '')}',
                    style: const TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ],
              )
            : Shimmer.fromColors(
                baseColor: Colors.grey.shade300,
                highlightColor: Colors.grey.shade100,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Container(
                          height: Get.width * 0.22,
                          width: Get.width * 0.22,
                          decoration: BoxDecoration(
                              color: Colors.black,
                              borderRadius:
                                  BorderRadius.circular(Get.width * 0.22 / 4)),
                        ),
                        const SizedBox()
                      ],
                    ),
                    const SizedBox(height: 14),
                    Container(
                      height: 26,
                      width: 100,
                      decoration: BoxDecoration(
                          color: Colors.black,
                          borderRadius: BorderRadius.circular(4.0)),
                    ),
                    const SizedBox(height: 2),
                    Container(
                      height: 15,
                      width: 222,
                      decoration: BoxDecoration(
                          color: Colors.black,
                          borderRadius: BorderRadius.circular(4.0)),
                    ),
                    const SizedBox(height: 6),
                    Container(
                      height: 15,
                      width: 190,
                      decoration: BoxDecoration(
                          color: Colors.black,
                          borderRadius: BorderRadius.circular(4.0)),
                    ),
                  ],
                ),
              ),
      ),
    );
  }
}
