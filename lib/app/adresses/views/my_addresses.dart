import 'package:application/app/adresses/controlers/addresses_controller.dart';
import 'package:application/packages.dart';
import 'package:application/required_files.dart';
import 'package:application/app/adresses/models/address.dart';
import '../widgets/address_card.dart';
import '../widgets/address_menu.dart';

class MyAddresses extends StatelessWidget {
  const MyAddresses({super.key});

  final double space = 32;

  final String title = 'My addresses';

  final String subTitle = 'Control my shipping addresses';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Shipping address'.tr),
      ),
      body: Column(
        children: [
          Expanded(
            child: GetBuilder<AddressesController>(
              init: AddressesController(),
              builder: (_) => _.isLoading.value
                  ? const Center(child: CustomProgress())
                  : _.listAddresses.isEmpty && !_.isLoading.value
                      ? SizedBox(
                          height: 64,
                          width: 64,
                          child: SvgPicture.asset(AppAssets.emptyList))
                      : Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 10),
                          child: ListView.builder(
                              itemCount: _.listAddresses.length,
                              itemBuilder: (context, i) {
                                UserAddress address = _.listAddresses[i];
                                bool isDefault = _.defaultAddress == address.id
                                    ? true
                                    : false;

                                return AddressCard(
                                  onLongPress: () =>
                                      AddressCardMenu.menu(address),
                                  address: address,
                                  isDefault: isDefault,
                                );
                              }),
                        ),
            ),
          ),
          CustomElevatedButton(
            width: double.infinity,
            borderRadius: 0,
            child: const Text('Add New Address',
                style: TextStyle(color: Colors.white)),
            onPressed: () => Get.toNamed(Routes.addNewAddress),
          )
        ],
      ),
    );
  }
}
