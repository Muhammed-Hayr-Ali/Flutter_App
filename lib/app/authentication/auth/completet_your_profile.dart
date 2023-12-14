import 'package:application/packages.dart';
import 'package:application/required_files.dart';
import 'package:fl_country_code_picker/fl_country_code_picker.dart';
import 'components/title_page.dart';
import 'components/upload_image.dart';
import 'controller/auth.dart';

class CompletetYourProfile extends StatelessWidget {
  CompletetYourProfile({super.key});

  final double space = 32;

  final _ = Get.find<Auth>();
  final data = Get.arguments as Map;
  final _formKey = GlobalKey<FormState>();

  /// Default.
  final countryPicker = const FlCountryCodePicker();

  /// With custom params.
  final countryPickerWithParams = const FlCountryCodePicker(
    localize: true,
    showDialCode: true,
    showSearchBar: true,
    // favoritesIcon: _yourIcon,
    // favorites: _yourFavorites,
    // title: Text('data'),
    // filteredCountries: _yourFilters,
    // countryTextStyle: _yourCountryTextStyle,
    // dialCodeTextStyle: _yourdialCodeTextStyle,
    // searchBarDecoration: _yourInputDecoration,
  );
  final TextEditingController _imagePath = TextEditingController();
  final TextEditingController _userName = TextEditingController();
  final TextEditingController _countryCode = TextEditingController();
  final TextEditingController _phoneNumber = TextEditingController();
  final String title = 'Complete Your Profile';
  final String subTitle =
      'Don\'t worry only you can see your personal data No one else will be able to see it';

  void _createNewAccount() async {
    if (_.isLoading.value) return;

    if (_formKey.currentState!.validate()) {
      _.register({
        'email': data['email'],
        'password': data['password'],
        'path': _imagePath.text,
        'name': _userName.text,
        'country_code' : _countryCode.text,
        'phone_number' : _phoneNumber.text,
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Form(
        key: _formKey,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 32),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                PageTitle(
                  title: title,
                  subTitle: subTitle,
                ),
                SizedBox(height: space),
                UploadImage(
                  pathImage: _imagePath,
                ),
                SizedBox(height: space),
                FadeAnimationDx(
                  delay: 2,
                  child: CustomTextField(
                    labelText: 'Name',
                    hintText: 'Ex. John Doe',
                    textEditingController: _userName,
                    keyboardType: TextInputType.name,
                    validator: (value) => Validator.userName(value!),
                  ),
                ),
                SizedBox(height: space / 2),
                Row(
                  children: [
                    FadeAnimationDx(
                      delay: 5,
                      child: Text(
                        'You can edit the Name at a later time'.tr,
                        style:
                            TextStyle(fontSize: 12, color: AppColors.grayColor),
                      ),
                    ),
                  ],
                ),
                FadeAnimationDx(
                  delay: 3,
                  child: CustomTextField(
                    labelText: 'Phone Number',
                    hintText: 'Enter Phone Number',
                    textEditingController: _userName,
                    keyboardType: TextInputType.phone,
                    validator: (value) => Validator.userName(value!),
                    prefix: Obx(
                      () => Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          GestureDetector(
                            onTap: () async {
                              // Show the country code picker when tapped.
                              final picked =
                                  await countryPickerWithParams.showPicker(
                                      context: context,
                                      initialSelectedLocale: 'syr');
                              // Null check
                              if (picked != null) {
                                _.countryCode.value = picked.dialCode;
                                _countryCode.text = picked.dialCode;
                              }
                            },
                            child: Text(_.countryCode.value,
                                style: const TextStyle(color: Colors.black)),
                          ),
                          const SizedBox(width: 8)
                        ],
                      ),
                    ),
                  ),
                ),
                SizedBox(height: space),
                FadeAnimationDx(
                  delay: 9,
                  child: CustomElevatedButton(
                    height: 54,
                    width: double.infinity,
                    borderRadius: BorderRadius.circular(28),
                    onPressed: _createNewAccount,
                    child: Obx(() => _.isLoading.value
                        ? const CustomProgress(color: Colors.white)
                        : Text(
                            'Create New Account'.tr,
                            style: const TextStyle(
                                fontSize: 16, color: Colors.white),
                          )),
                  ),
                ),
                SizedBox(height: space * 2.2),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
