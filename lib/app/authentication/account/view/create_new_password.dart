import 'package:application/packages.dart';

import '../../auth/components/title_page.dart';
import '../controller/account_controller.dart';
import 'package:application/required_files.dart';

class CreateNewPassword extends StatelessWidget {
  CreateNewPassword({super.key});

  final double space = 32;
  final double fontSize = 10;

  final _ = Get.put(AccountController());
  final _formKey = GlobalKey<FormState>();

  final TextEditingController _password = TextEditingController();
  final TextEditingController _confirmPassword = TextEditingController();
  final String title = 'Create New Password';
  final String subTitle =
      'Your New Password Must Be Different from Previous Password';
  final data = Get.arguments as Map;
  void _recovery() async {
    if (_formKey.currentState!.validate()) {
      _.createNewPassword(email: data['email'], verificationCode: data['verificationCode'], password: _password.text);
    }
  }

  @override
  Widget build(BuildContext context) {
    double size = Get.width * 0.5;
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
                Container(
                  height: size,
                  width: size,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(size),
                    color: AppColors.primaryColor.withOpacity(0.1),
                  ),
                  child: Icon(
                    Icons.password_rounded,
                    size: size * .5,
                    color: AppColors.primaryColor,
                  ),
                ),
                SizedBox(height: space),
                FadeAnimationDx(
                  delay: 4,
                  child: CustomTextField(
                    labelText: 'Password',
                    hintText: '************',
                    isPassword: true,
                    textEditingController: _password,
                    keyboardType: TextInputType.multiline,
                    validator: (value) =>
                        Validator.password(value!, _confirmPassword.text),
                    onChanged: (value) => _.createNewPasswordError.value = '',
                  ),
                ),
                SizedBox(height: space),
                FadeAnimationDx(
                  delay: 5,
                  child: CustomTextField(
                    labelText: 'Confirm password',
                    hintText: '************',
                    isPassword: true,
                    textEditingController: _confirmPassword,
                    keyboardType: TextInputType.multiline,
                    validator: (value) =>
                        Validator.password(value!, _password.text),
                    onChanged: (value) => _.createNewPasswordError.value = '',
                  ),
                ),
                SizedBox(height: space),
                Obx(
                  () => Text(
                    _.createNewPasswordError.value.tr,
                    style: const TextStyle(fontSize: 12, color: Colors.red),
                  ),
                ),
                SizedBox(height: space),
                FadeAnimationDx(
                  delay: 3,
                  child: CustomElevatedButton(
                    height: 54,
                    width: double.infinity,
                    borderRadius: BorderRadius.circular(28),
                    onPressed: _recovery,
                    child: Obx(
                      () => _.isLoading.value
                          ? const CustomProgress(
                              color: Colors.white,
                            )
                          : Text(
                              'save'.tr,
                              style: const TextStyle(
                                  fontSize: 16, color: Colors.white),
                            ),
                    ),
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
