import 'package:application/app/profile/controller/addresses_controller.dart';
import 'package:application/components/title_page.dart';
import 'package:application/packages.dart';
import 'package:application/required_files.dart';
import 'package:application/utils/models/address.dart';

class MyAddresses extends StatelessWidget {
  MyAddresses({super.key});

  final double space = 32;
  final _ = Get.put<AddressesController>(AddressesController());

  final String title = 'My addresses';
  final String subTitle = 'Control my shipping addresses';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          GetBuilder<AddressesController>(
            builder: (_) => SizedBox(
              child: _.listAddresses.isNotEmpty
                  ? IconButton(
                      onPressed: () => Get.toNamed(Routes.addNewAddress),
                      icon: const Icon(
                        PhosphorIcons.plus_bold,
                      ))
                  : null,
            ),
          )
        ],
      ),
      body: Obx(
        () => _.isLoading.value
            ? const Center(
                child: CustomProgress(),
              )
            : GetBuilder<AddressesController>(
                builder: (_) => _.listAddresses.isEmpty
                    ? SizedBox(
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 8.0),
                          child: Column(
                            children: [
                              Row(
                                children: [
                                  PageTitle(
                                    title: title,
                                    subTitle: subTitle,
                                  ),
                                ],
                              ),
                              Expanded(
                                  child: SizedBox(
                                width: Get.width * 0.3,
                                child: SvgPicture.asset(AppAssets.emptyList),
                              )),
                              CustomElevatedButton(
                                child: const Text(
                                  'Add New Address',
                                  style: TextStyle(
                                      fontSize: 16, color: Colors.white),
                                ),
                                onPressed: () =>
                                    Get.toNamed(Routes.addNewAddress),
                              ),
                              SizedBox(height: space)
                            ],
                          ),
                        ),
                      )
                    : SizedBox(
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 8.0),
                          child: Column(
                            children: [
                              Row(
                                children: [
                                  PageTitle(
                                    title: title,
                                    subTitle: subTitle,
                                  ),
                                ],
                              ),
                              const SizedBox(height: 10),
                              Expanded(
                                child: RefreshIndicator(
                                  onRefresh: _.getAllAddresses,
                                  child: ListView.builder(
                                    itemCount: _.listAddresses.length,
                                    itemBuilder: (context, index) =>
                                        address(_.listAddresses[index]),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
              ),
      ),
    );
  }
}

Widget address(AddressModel address) {
  return Padding(
    padding: const EdgeInsets.only(bottom: 10.0),
    child: Material(
      borderRadius: BorderRadius.circular(12),
      color: AppColors.grayColor.withOpacity(0.1),
      child: InkWell(
        borderRadius: BorderRadius.circular(12),
        onTap: () => print('${address.latitude} + ${address.longitude}'),
        child: Padding(
          padding: const EdgeInsets.all(8),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  SizedBox(
                    height: 30,
                    width: 30,
                    child: SvgPicture.asset(AppAssets.mapPoint),
                  ),
                  const SizedBox(width: 4),
                  Text(
                    address.addressName ?? '',
                    style: const TextStyle(
                        fontSize: 18, fontWeight: FontWeight.w500),
                  )
                ],
              ),
              const SizedBox(height: 8),
              Row(
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          '${address.country ?? ''} ${address.state ?? ''} ${address.city ?? ''}',
                          style: const TextStyle(
                              fontSize: 16, fontWeight: FontWeight.w300),
                        ),
                        Text(
                          address.addressLine1 ?? '',
                          style: const TextStyle(
                              fontSize: 14, fontWeight: FontWeight.w200),
                        ),
                        Text(
                          address.addressLine2 ?? '',
                          style: const TextStyle(
                              fontSize: 14, fontWeight: FontWeight.w200),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 64,
                    width: 64,
                    child: address.latitude != '0.00000000' &&
                            address.longitude != '0.00000000' &&
                            address.latitude != null &&
                            address.longitude != null
                        ? SvgPicture.asset(AppAssets.map)
                        : null,
                  )
                ],
              ),
              Text(
                '${address.countryCode ?? ''} ${address.phoneNumber ?? ''}',
                style:
                    const TextStyle(fontSize: 16, fontWeight: FontWeight.w400),
              ),
            ],
          ),
        ),
      ),
    ),
  );
}
