import '../../../packages.dart';
import '../../../required_files.dart';
import '../controlers/addresses_controller.dart';
import '../models/address.dart';

class AddressCardMenu {
  AddressCardMenu._();
  static menu(UserAddress address) async {
    AddressesController _ = Get.find<AddressesController>();

    custombottomSheet(
      child: Column(
        children: [
          CustomListItem(
            child: const Text(
              'Edit Address',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
            ),
            onTap: () => {
              if (Get.isBottomSheetOpen ?? false)
                {
                  Get.back(),
                },
              Get.toNamed(Routes.editAddress, arguments: address)
            },
          ),
          Divider(
            color: Colors.grey.withOpacity(0.1),
          ),
          CustomListItem(
            child: const Text(
              'Set as default address',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
            ),
            onTap: () => {
              if (Get.isBottomSheetOpen ?? false)
                {
                  Get.back(),
                },
              _.setDefaultAddress(address.id!)
            },
          ),
          Divider(
            color: Colors.grey.withOpacity(0.1),
          ),
          CustomListItem(
            child: const Text(
              'Delete Address',
              style: TextStyle(
                  fontSize: 16, fontWeight: FontWeight.w500, color: Colors.red),
            ),
            onTap: () => {
              if (Get.isBottomSheetOpen ?? false)
                {
                  Get.back(),
                },
              _.deleteAddress(address.id!)
            },
          )
        ],
      ),
    );
  }
}
