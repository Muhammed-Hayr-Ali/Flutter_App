import 'package:application/packages.dart';
import 'package:application/required_files.dart';
import 'package:application/utils/constants/colors_constants.dart';
import 'package:application/utils/models/address.dart';

import '../controller/addresses_controller.dart';

class AdressesScreen extends StatelessWidget {
  const AdressesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Adresses'.tr),
      ),
      body: GetBuilder<AddressesController>(
        init: AddressesController(),
        builder: (_) => _.listAddresses.isNotEmpty
            ? ListView.builder(
                itemCount: _.listAddresses.length,
                itemBuilder: (contx, index) {
                  final AddressModel address = _.listAddresses[index];

                  return Card(
                    elevation: 0,
                    color: AppColors.grayColor.withOpacity(0.1),
                    child: ListTile(
                      leading: SvgPicture.asset(AppAssets.mapPoint),
                      title: Text(address.addressName ?? ''),
                      subtitle: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                              '${address.country} ${address.state} ${address.city}'),
                          Text(
                            '${address.addressLine1} ${address.addressLine2}',
                            style: const TextStyle(fontSize: 12),
                          ),
                        ],
                      ),
                    ),
                  );
                })
            : Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const Expanded(child: SizedBox()),
                  Center(
                    child: SizedBox(
                        width: Get.width * 0.4,
                        child: SvgPicture.asset(AppAssets.emptyList)),
                  ),
                  Center(
                    child: CustomElevatedButton(
                      child: const Text('Add New Address',
                          style: TextStyle(
                            color: Colors.white,
                          )),
                      onPressed: () => Get.toNamed(Routes.addNewAddress),
                    ),
                  )
                ],
              ),
      ),
    );
  }
}
