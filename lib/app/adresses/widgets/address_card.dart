import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../../../packages.dart';
import '../../../required_files.dart';
import '../models/address.dart';

class AddressCard extends StatelessWidget {
  final UserAddress address;
  final bool isDefault;
  final Color? background;
  final void Function()? onLongPress;
  const AddressCard(
      {super.key,
      required this.address,
      required this.isDefault,
      this.background,
      this.onLongPress});

  bool hasLocation({required latitude, required longitude}) {
    if (latitude != '0.00000000' &&
        longitude != '0.00000000' &&
        latitude != null &&
        longitude != null) {
      return true;
    }
    return false;
  }

  @override
  Widget build(BuildContext context) {
    bool isRtl = Get.locale?.languageCode == 'ar';

    return Padding(
      padding: const EdgeInsets.only(bottom: 10.0),
      child: InkWell(
        borderRadius: BorderRadius.circular(4.0),
        onLongPress: onLongPress,
        child: Container(
          decoration: BoxDecoration(
            color: AppColors.grayColor.withOpacity(0.1),
            borderRadius: BorderRadius.circular(4.0),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                child: isDefault
                    ? Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 4, vertical: 2),
                        decoration: BoxDecoration(
                            color: AppColors.primaryColor.withOpacity(0.1),
                            borderRadius: isRtl
                                ? const BorderRadius.only(
                                    bottomLeft: Radius.circular(4.0),
                                    topRight: Radius.circular(4.0))
                                : const BorderRadius.only(
                                    bottomRight: Radius.circular(4.0),
                                    topLeft: Radius.circular(4.0))),
                        child: Text(
                          'Default'.tr,
                          style: TextStyle(
                              color: AppColors.primaryColor,
                              fontSize: 10,
                              fontWeight: FontWeight.w400),
                        ),
                      )
                    : null,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 8.0),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.fromLTRB(8.0, 0, 8.0, 8.0),
                      child: SizedBox(
                        height: 30,
                        width: 30,
                        child: SvgPicture.asset(AppAssets.mapPoint),
                      ),
                    ),
                    Expanded(
                        child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          '${address.firstName!} ${address.lastName!} ',
                          style: const TextStyle(fontWeight: FontWeight.w600),
                        ),
                        Text(
                          address.phoneNumber!,
                          style: const TextStyle(fontWeight: FontWeight.w500),
                        ),
                        Text(
                          address.country!,
                          style: const TextStyle(fontWeight: FontWeight.w400),
                        ),
                        Text(
                          '${address.state!} / ${address.city!}',
                          style: const TextStyle(
                              fontWeight: FontWeight.w400, fontSize: 13),
                        ),
                        Text(
                          '${address.addressLine1}',
                          style: const TextStyle(
                              fontWeight: FontWeight.w200, fontSize: 13),
                        ),
                        Text(
                          '${address.addressLine2}',
                          style: const TextStyle(
                              fontWeight: FontWeight.w200, fontSize: 13),
                        ),
                      ],
                    )),
                    SizedBox(
                      child: hasLocation(
                              latitude: address.latitude,
                              longitude: address.longitude)
                          ? Padding(
                              padding:
                                  const EdgeInsets.fromLTRB(8.0, 0, 8.0, 8.0),
                              child: SizedBox(
                                width: 48,
                                child: GestureDetector(
                                    onTap: () => Get.toNamed(
                                        Routes.locationScreen,
                                        arguments: LatLng(
                                            double.parse(address.latitude!),
                                            double.parse(address.longitude!))),
                                    child: SvgPicture.asset(AppAssets.map)),
                              ),
                            )
                          : null,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
