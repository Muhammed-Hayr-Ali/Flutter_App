import 'package:application/app/profile/controller/profile_controller.dart';
import 'package:application/packages.dart';
import 'package:application/required_files.dart';

class UserProfile extends StatelessWidget {
  const UserProfile({
    super.key,
  });
  String shortMail(String value) {
    return value.substring(0, value.indexOf("@"));
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          color: AppColors.primaryColor,
          height: 200,
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Container(
                height: 100,
                color: AppColors.primaryColor,
              ),
              Container(
                height: 100,
                decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius:
                        BorderRadius.vertical(top: Radius.circular(20))),
              )
            ],
          ),
        ),
        GetBuilder<ProfileController>(
            init: ProfileController(),
            builder: (_) => Center(
                  child: SizedBox(
                    child: _.currentUser != null
                        ? Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              const SizedBox(height: 36),
                              CustomAvatar(
                                borderWidth: 4,
                                backgroundColor: Colors.white,
                                sourceImage: SourceImage.networkImage,
                                imagePath: '${_.currentUser!.profile}',
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text(
                                  '${_.currentUser!.name}',
                                  style: const TextStyle(
                                      // color: AppColors.primaryColor,
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text(
                                  '${_.currentUser!.status}',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      color: AppColors.primaryColor,
                                      fontSize: 12,
                                      fontWeight: FontWeight.w300),
                                ),
                              )
                            ],
                          )
                        : null,
                  ),
                ))
      ],
    );
  }
}

//     Column(
//       children: [
//         Container(
//           decoration: BoxDecoration(
//               gradient: LinearGradient(
//                   colors: [AppColors.primaryColor, Colors.white],
//                   stops: const [0.8, 1.0],
//                   begin: Alignment.topCenter,
//                   end: Alignment.bottomCenter)),
//           height: Get.height * 0.18,
//           child: Stack(
//             alignment: Alignment.center,
//             children: [
//               Column(
//                 children: [
//                   SizedBox(
//                     height: Get.height * 0.18 / 2,
//                   ),
//                   Expanded(
//                     child: Container(
//                       width: double.infinity,
//                       decoration: const BoxDecoration(
//                           color: Colors.white,
//                           borderRadius: BorderRadius.vertical(
//                               top: Radius.circular(16.0))),
//                     ),
//                   )
//                 ],
//               ),
//               GetBuilder<ProfileController>(
//                 builder: (_) => SizedBox(
//                   child: _.currentUser != null
//                       ? Column(
//                           mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                           children: [
//                             Hero(
//                               tag: 'user_avatar',
//                               child: CustomAvatar(
//                                   borderWidth: 2,
//                                   backgroundColor: Colors.white,
//                                   size: Get.width * 0.32,
//                                   sourceImage: SourceImage.networkImage,
//                                   imagePath: '${_.currentUser!.profile}'),
//                             ),
//                           ],
//                         )
//                       : null,
//                 ),
//               ),
//             ],
//           ),
//         ),
//         GetBuilder<ProfileController>(
//           builder: (_) => SizedBox(
//             child: _.currentUser == null
//                 ? Text(
//                     _.currentUser!.name ?? '',
//                     style: TextStyle(
//                         color: AppColors.blackColor,
//                         fontSize: 18,
//                         fontWeight: FontWeight.w500),
//                   )
//                 : null,
//           ),
//         ),
//         GetBuilder<ProfileController>(
//           builder: (_) => SizedBox(
//             child: _.currentUser != null
//                 ? Padding(
//                     padding: const EdgeInsets.all(8.0),
//                     child: Text(
//                       _.currentUser!.status ?? '',
//                       textAlign: TextAlign.center,
//                       style: TextStyle(
//                           color: AppColors.primaryColor,
//                           fontSize: 11,
//                           fontWeight: FontWeight.w400),
//                     ),
//                   )
//                 : null,
//           ),
//         )
//       ],
//     );
//   }
// }
