import 'package:application/components/custom_date_picker.dart';
import 'package:application/components/custom_dropdown_utton.dart';
import 'package:application/packages.dart';
import 'package:application/required_files.dart';
import 'package:fl_country_code_picker/fl_country_code_picker.dart';
import 'components/title_page.dart';
import 'components/upload_image.dart';
import 'controller/auth_controller.dart';

class CompletetYourProfile extends StatelessWidget {
  CompletetYourProfile({super.key});

  final double space = 32;

  final _ = Get.find<AuthControlleer>();
  final data = Get.arguments as Map;
  final _formKey = GlobalKey<FormState>();

  /// With custom params.
  final countryPickerWithParams = const FlCountryCodePicker(
    localize: true,
    showDialCode: true,
    showSearchBar: true,
    favorites: [
      "SY",
      "BH",
      "DZ",
      "SD",
      "IQ",
      "KW",
      "MA",
      "JO",
      "AE",
      "SA",
      "SO",
      "SS",
      "IQ",
      "KW",
      "BH",
      "JO",
      "DZ",
      "AE",
      "MA",
      "MR",
      "TN",
      "DJ",
      "SO",
      "PS",
      "LB",
      "LY",
      "EG",
      "YE",
      "OM",
      "QA"
    ],
  );
  final TextEditingController _imagePath = TextEditingController();
  final TextEditingController _userName = TextEditingController();
  final TextEditingController _countryCode =
      TextEditingController(text: '+963');
  final TextEditingController _phoneNumber = TextEditingController();
  final TextEditingController _gender = TextEditingController();
  final TextEditingController _date_birth = TextEditingController();
  final String title = 'Complete Your Profile';
  final String subTitle =
      'Don\'t worry only you can see your personal data No one else will be able to see it';
  List<String> genderList = ['Unspecified', 'Male', 'Female'];
  void _createNewAccount() async {
    if (_.isLoading.value) return;

    if (_formKey.currentState!.validate()) {
      _.registerError.value = '';
      _.register({
        'email': data['email'],
        'password': data['password'],
        'path': _imagePath.text,
        'name': _userName.text,
        'country_code': _countryCode.text,
        'phone_number': _phoneNumber.text,
        'gender': _gender.text,
        'date_birth': _date_birth.text,
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
                SizedBox(height: space),
                FadeAnimationDx(
                  delay: 3,
                  child: CustomTextField(
                    labelText: 'Phone Number',
                    hintText: 'Enter Phone Number',
                    textEditingController: _phoneNumber,
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
                                debugPrint(picked.code);
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
                  delay: 4,
                  child: CustomDropdownButton(
                      title: 'Gender', listItem: genderList, value: _gender),
                ),
                SizedBox(height: space),
                CustomDatePicker(
                  textEditingController: _date_birth,
                  labelText: 'Date Birth',
                ),
                SizedBox(height: space),
                Obx(
                  () => Text(
                    _.registerError.value.tr,
                    style: const TextStyle(fontSize: 12, color: Colors.red),
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
                            'Complete Profile'.tr,
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
