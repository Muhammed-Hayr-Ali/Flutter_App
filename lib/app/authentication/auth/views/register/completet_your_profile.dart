import 'package:application/components/custom_date_picker.dart';
import 'package:application/components/custom_dropdown_utton.dart';
import 'package:application/packages.dart';
import 'package:application/required_files.dart';

import '../../../../../components/title_page.dart';
import '../../controller/creat_new_account.dart';
import '../../widgets/upload_image.dart';

class CompletetYourProfile extends StatelessWidget {
  CompletetYourProfile({super.key});

  final double space = 32;

  final _ = Get.find<CreatNewAccountController>();
  final arguments = Get.arguments as Map<String, dynamic>;
  final _formKey = GlobalKey<FormState>();

  final TextEditingController _imagePath = TextEditingController();
  final TextEditingController _userName = TextEditingController();
  final TextEditingController _gender = TextEditingController();
  final TextEditingController _dateBirth = TextEditingController();
  final TextEditingController _phoneNumber = TextEditingController();

  final String title = 'Complete Your Profile';
  final String subTitle =
      'Don\'t worry only you can see your personal data No one else will be able to see it';

  void _sendVerificationCode() async {
    if (_.isLoading.value) return;

    if (_formKey.currentState!.validate()) {
      arguments['path'] = _imagePath.text;
      arguments['name'] = _userName.text;
      arguments['gender'] = _gender.text;
      arguments['date_birth'] = _dateBirth.text;
      arguments['phone_number'] = _phoneNumber.text;


      final response = await _.sendVerificationCode(map: arguments);
      if (response) {
        Get.toNamed(Routes.completeRegistration, arguments: arguments);
      }
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
                FadeAnimationDx(
                  delay: 2,
                  child: PageTitle(
                    title: title,
                    subTitle: subTitle,
                  ),
                ),
                SizedBox(height: space),
                FadeAnimationDx(
                  delay: 3,
                  child: UploadImage(
                    pathImage: _imagePath,
                  ),
                ),
                SizedBox(height: space),
                FadeAnimationDx(
                  delay: 4,
                  child: CustomTextField(
                    labelText: 'Name',
                    hintText: 'Ex. John Doe',
                    controller: _userName,
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
                SizedBox(height: space / 2),
                FadeAnimationDx(
                  delay: 6,
                  child: CustomDropdownButton(
                      title: 'Gender',
                      listItem: AppConstants.genderList,
                      controller: _gender),
                ),
                SizedBox(height: space),
                FadeAnimationDx(
                  delay: 7,
                  child: CustomDatePicker(
                    controller: _dateBirth,
                    labelText: 'Date Birth',
                  ),
                ),
                SizedBox(height: space),
                FadeAnimationDx(
                  delay: 8,
                  child: CustomTextField(
                    labelText: 'Phone Number',
                    hintText: 'E.g. 0933123456',
                    controller: _phoneNumber,
                    keyboardType: TextInputType.phone,
                    validator: (value) => Validator.phoneNumber(value!),
                  ),
                ),
                SizedBox(height: space / 2),
                Row(
                  children: [
                    FadeAnimationDx(
                      delay: 9,
                      child: Text(
                        'Please enter a valid number for verification'.tr,
                        style:
                            TextStyle(fontSize: 12, color: AppColors.grayColor),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: space / 2),
                FadeAnimationDx(
                  delay: 10,
                  child: CustomElevatedButton(
                    onPressed: _sendVerificationCode,
                    child: Obx(() => _.isLoading.value
                        ? const CustomProgress(color: Colors.white)
                        : Text(
                            'Next'.tr,
                            style: const TextStyle(
                                fontSize: 16, color: Colors.white),
                          )),
                  ),
                ),
                SizedBox(height: space),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
