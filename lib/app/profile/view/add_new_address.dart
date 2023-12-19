import 'package:application/app/profile/controller/addresses_controller.dart';
import 'package:application/packages.dart';
import 'package:application/required_files.dart';
import 'package:flutter/material.dart';

import '../../../components/title_page.dart';

class AddNewAddress extends StatelessWidget {
   AddNewAddress({super.key});

  final double space = 32;
  final _ = Get.find<AddressesController>();

  final _formKey = GlobalKey<FormState>();
  final TextEditingController _email = TextEditingController();
  final TextEditingController _password = TextEditingController();
  final TextEditingController _confirmPassword = TextEditingController();
  final String title = 'Create Account';
  final String subTitle =
      'Fill in your information below, and proceed to the home page';

  void _createNewAddress() async {
    // if (_.isLoading.value) return;

    // if (_formKey.currentState!.validate()) {
    //   _.checkMailAvailabilityError.value = '';

    //   Map data = {
    //     'email': _email.text,
    //     'password': _password.text,
    //   };
    //   _.checkMailAvailability(user: data);
    //   ();
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
                FadeAnimationDx(
                  delay: 4,
                  child: CustomTextField(
                    labelText: 'Email',
                    hintText: 'example@gmail.com',
                    // onChanged: (value) =>
                    //     _.checkMailAvailabilityError.value = '',
                    controller: _email,
                    keyboardType: TextInputType.emailAddress,
                    validator: (value) => Validator.email(value!),
                  ),
                ),
                SizedBox(height: space / 2),
                Row(
                  children: [
                    FadeAnimationDx(
                      delay: 5,
                      child: Text(
                        'You cannot edit the email at a later time'.tr,
                        style:
                            TextStyle(fontSize: 12, color: AppColors.grayColor),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: space),
                FadeAnimationDx(
                  delay: 6,
                  child: CustomTextField(
                    labelText: 'Password',
                    hintText: '************',
                    isPassword: true,
                    controller: _password,
                    keyboardType: TextInputType.multiline,
                    validator: (value) =>
                        Validator.password(value!, _confirmPassword.text),
                  ),
                ),
                SizedBox(height: space),
                FadeAnimationDx(
                  delay: 7,
                  child: CustomTextField(
                    labelText: 'Confirm password',
                    hintText: '************',
                    isPassword: true,
                    controller: _confirmPassword,
                    keyboardType: TextInputType.multiline,
                    validator: (value) =>
                        Validator.password(value!, _password.text),
                  ),
                ),
                SizedBox(height: space),
                Obx(
                  () => Text(
                    _.addAdressError.value.tr,
                    style: const TextStyle(fontSize: 12, color: Colors.red),
                  ),
                ),
                SizedBox(height: space),
                FadeAnimationDx(
                  delay: 9,
                  child: CustomElevatedButton(
                    child: Obx(() => _.isLoading.value
                        ? const CustomProgress(color: Colors.white)
                        : Text(
                            'Create New Address'.tr,
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
